library IEEE;
use IEEE.std_logic_1164.all;

entity sdtb is
end entity;

architecture arch_sdtb of sdtb is

component sd is
  port ( input :in std_logic_vector(11 downto 0); 
         clk,reset :in std_logic; 
         output : out std_logic_vector(11 downto 0);
         sign: out std_logic);
end component;

type vals IS ARRAY (0 to 99) of std_logic_vector(11 downto 0); 

constant sin: vals := ("010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000",
--"010000000000");
--"101100011011",
--"110110111001",
--"111101110001",
--"111111111110",
--"111101001010",
--"110101110010",
--"101010111110",
--"011110011100",
--"010010001010",
--"001000000010",
--"000001101100",
--"000000000101",
--"000011100000",
--"001011011000",
--"010110011111",
--"100011000110",
--"101111001110",
--"111000111101",
--"111110110001",
--"111111110000",
--"111011110000",
--"110011011010",
--"101000000000",
--"011011010110",
--"001111011011",
--"000110000110",
--"000000110101",
--"000000011110",
--"000101000010",
--"001101110110",
--"011001100000",
--"100110001011",
--"110001111000",
--"111010110001",
--"111111011110",
--"111111001110",
--"111010000101",
--"110000110110",
--"100100111101",
--"011000010011",
--"001100110110",
--"000100011001",
--"000000010010",
--"000001001001",
--"000110110110",
--"010000011111",
--"011100100100",
--"101001001100",
--"110100010111",
--"111100010110",
--"111111111000",
--"111110011010",
--"111000001010",
--"101110001000",
--"100001111000",
--"010101010101",
--"001010011101",
--"000010111101",
--"000000000001",
--"000010000110",
--"001000111000",
--"010011010001",
--"011111101011",
--"101100000111",
--"110110101010",
--"111101101001",
--"111111111111",
--"111101010011",
--"110110000001",
--"101011010001",
--"011110110001",
--"010010011101",
--"001000010000",
--"000001110011",
--"000000000100",
--"000011010110",
--"001011001000",
--"010110001100",
--"100010110010",
--"101110111100",
--"111000110000",
--"111110101011",
--"111111110010",
--"111011111010",
--"110011101010",
--"101000010100",
--"011011101011",
--"001111101101",
--"000110010010",
--"000000111010",
--"000000011010",
--"000100110111",
--"001101100101",
--"011001001100",
--"100101110111",
--"110001100111",
--"111010100110",
--"111111011010",
--"111111010011");
"000000000010",
"001000000100",
"000000001000",
"000000010000",
"000001000000",
"000010000000",
"000100000000",
"000100000000",
"000010000000",
"000001000000",
"000000100000",
"000000010000",
"000000001000",
"000000000000",
"000000000010",
"010000000000",
"000000000000",
"010000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"010000000000",
"010000000000",
"000000000000",
"000000000000",
"000000000000",
"000010000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000",
"000000000000");


signal input: std_logic_vector(11 downto 0);
signal clk,sign : std_logic:='0'; 
signal output : std_logic_vector(11 downto 0);
signal reset: std_logic:='1';
signal index : integer range 0 to 99:=0;

begin

  clk<= not clk after 100 ns;
  
  S0: SD port map(input, clk, reset,output, sign);
  
  p0: process
  begin 
    wait for 500 ns;
    reset<='0';
    wait for 100 ns;
    for i in 0 to 100 loop
      input <=sin(index);
      index<=index+1;
      wait for 10000 ns;
    end loop;
  end process;
end architecture;