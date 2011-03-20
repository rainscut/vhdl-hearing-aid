----------------------------------------------------------------------------------
-- Design Name: Receive Data serially from PC to FPGA via RS232 COM port
-- Module Name: HIF_RS232_Receive_from_PC - Behavioral 
-- Designer: Amit Kulkarni(amitk@student.chalmers.se)
-- Date: 2011-03-19
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.EQ_data_type.ALL;

ENTITY HIF_RS232_Receive_from_PC IS
	GENERIC(n:INTEGER:=10;  --Total number of bits received (10 bits = 1-start bit + 8 bits of data + 1-stop bit)
			m:INTEGER:=8);   --No.of.Bands
			

	PORT(     system_clk : IN STD_LOGIC;	--Main clock input
		 serial_data_inp : IN STD_LOGIC; 	--Serial data input(bit by bit)
				   RESET : IN STD_LOGIC;	--System reset
			  data_ready : OUT STD_LOGIC;	--Flag to indicate equalizer that, gain datas are ready to send from HIF
	gain_data_array_rx   : OUT Gained_result_Array ); --Band Gain value with 13 bits			
END HIF_RS232_Receive_from_PC;

ARCHITECTURE Behavioral OF HIF_RS232_Receive_from_PC IS

	SIGNAL receive  :STD_LOGIC_VECTOR(n-1 DOWNTO 0); --Variable where data from PC is collected for first time
	SIGNAL j,k	  	:INTEGER RANGE 0 TO n; 
	SIGNAL i		:INTEGER RANGE 0 TO 5210;
	SIGNAL startbit :STD_LOGIC;
	SIGNAL gain_data:STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL LUT 		: Gained_result_Array ;	--Array for LUT to convert internally the gain values from 8 bits to 13 bits
							
BEGIN
	startbit <= serial_data_inp; --Receive bits from PC serially, serial_data_inp is mapped with receive pin of RS232 using UCF file
	PROCESS(system_clk,RESET)
		VARIABLE enable:STD_LOGIC;
	BEGIN
		IF(rising_edge(system_clk) AND RESET = '0') THEN
      		IF( (startbit = '0' or enable = '1')) THEN  --Check to start new reception or complete one comple byte transfer
				enable := '1';
				i <= i+1;
				IF(i=5207) THEN  --Count corresponds to 50MHz for 9600 bps and can be changed IF we are working with 1MHz or any  other frequency
					i <= 0;
					IF(j < n ) THEN 
						receive(j) <= serial_data_inp; --Receiving at 9600 bps and storing it, serial bits are packed
						j <= j + 1;
						IF ( j = n-2 ) THEN
							gain_data <= receive( n-3 downto 0); -- Packed datas are first stored in the local cariable and then used for value conversion
							CASE gain_data IS 	-- Look Up Table begins here(as data are not decided so initially we set all the bit equal to high)
								WHEN "00000001" => 
												LUT(k) <="0111111111111"; 
								WHEN "00000010" => 
												LUT(k) <="0111111111111"; 
								WHEN "00000011" => 
												LUT(k) <="0111111111111"; 
								WHEN "00000100" => 
												LUT(k) <="0111111111111"; 
								WHEN "00000101" => 
												LUT(k) <="0111111111111"; 
								WHEN "00000110" => 
												LUT(k) <="0111111111111"; 
								WHEN "00000111" => 
												LUT(k) <="0111111111111"; 
								WHEN "00001000" => 
												LUT(k) <="0111111111111"; 
								WHEN "00001001" => 
												LUT(k) <="0111111111111"; 
								WHEN "00001010" => 
												LUT(k) <="0111111111111"; 
								WHEN "00001011" => 
												LUT(k) <="0111111111111"; 
								WHEN "00001100" => 
												LUT(k) <="0111111111111"; 
								WHEN "00001101" => 
												LUT(k) <="0111111111111"; 
								WHEN "00001110" => 
												LUT(k) <="0111111111111"; 
								WHEN "00001111" => 
												LUT(k) <="0111111111111"; 
								WHEN "00010000" => 
												LUT(k) <="0111111111111"; 
								WHEN "00010001" =>
												LUT(k) <="0111111111111"; 
								WHEN "00010010" => 
												LUT(k) <="0111111111111"; 
								WHEN "00010011" => 
												LUT(k) <="0111111111111"; 
								WHEN "00010100" => 
												LUT(k) <="0111111111111"; 
								WHEN "00010101" => 
												LUT(k) <="0111111111111"; 
								WHEN "00010110" => 
												LUT(k) <="0111111111111"; 
								WHEN "00010111" => 
												LUT(k) <="0111111111111"; 
								WHEN "00011000" => 
												LUT(k) <="0111111111111"; 
								WHEN "00011001" => 
												LUT(k) <="0111111111111"; 
								WHEN "00011010" => 
												LUT(k) <="0111111111111"; 
								WHEN "00011011" =>
												LUT(k) <="0111111111111"; 
								WHEN "00011100" =>
												LUT(k) <="0111111111111"; 
								WHEN "00011101" => 
												LUT(k) <="0111111111111"; 
								WHEN "00011110" => 
												LUT(k) <="0111111111111"; 
								WHEN "00011111" => 
												LUT(k) <="0111111111111"; 
								WHEN "00100000" => 
												LUT(k) <="0111111111111"; 
												
								WHEN OTHERS => NULL;
							END CASE;
							k <= k+1;
							IF(k = 8) THEN 		--Final gain values of 13 bits are now ready
								k<=0;
								gain_data_array_rx(1) <= LUT(1); 
								gain_data_array_rx(2) <= LUT(2);
								gain_data_array_rx(3) <= LUT(3);
								gain_data_array_rx(4) <= LUT(4);
								gain_data_array_rx(5) <= LUT(5);
								gain_data_array_rx(6) <= LUT(6);
								gain_data_array_rx(7) <= LUT(7);
								gain_data_array_rx(8) <= LUT(8);
								data_ready  <= '1';	-- Set a flag that gain values are ready and to be accpted by EQUALIZER
							ELSE
								data_ready <= '0'; --Ensure that flag is reset so that EQUALIZER waits for the data processed by HIF
							END IF;
							enable := '0';  --When one byte of data received the reception is halted but again when a new start bit is encountered, the serial data reception starts
							j <= 0;                                       
						END IF;
					END IF;
				END IF;
			END IF;
		ELSIF(RESET = '1') THEN
			gain_data_array_rx <=(OTHERS =>"0111111111111");
			data_ready  <= '1';
		END IF;
	END PROCESS;
END Behavioral;