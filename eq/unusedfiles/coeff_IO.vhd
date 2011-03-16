LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.EQ_data_type.all;

ENTITY coeff_io IS
    GENERIC ( 	    N : NATURAL := 24;
		    NUM_OF_TAPS_HALF: NATURAL :=111); -- width of samples and filter coefficients



    PORT (tc     : OUT taps_type); 
END coeff_io;



ARCHITECTURE coeff_io_arch OF coeff_io IS
       
    -- Filter coefficients
    
BEGIN
-- adding the values into the table
tc(1,1)<="111111111111001000011100";
tc(1,2)<="111111111111000010111011";
tc(1,3)<="111111111110111101000111";
tc(1,4)<="111111111110110110111101";
tc(1,5)<="111111111110110000011001";
tc(1,6)<="111111111110101001010110";
tc(1,7)<="111111111110100001110010";
tc(1,8)<="111111111110011001101000";
tc(1,9)<="111111111110010000110110";
tc(1,10)<="111111111110000111011001";
tc(1,11)<="111111111101111101010000";
tc(1,12)<="111111111101110010010111";
tc(1,13)<="111111111101100110101101";
tc(1,14)<="111111111101011010010001";
tc(1,15)<="111111111101001101000011";
tc(1,16)<="111111111100111111000001";
tc(1,17)<="111111111100110000001100";
tc(1,18)<="111111111100100000100101";
tc(1,19)<="111111111100010000001101";
tc(1,20)<="111111111011111111000101";
tc(1,21)<="111111111011101101001111";
tc(1,22)<="111111111011011010101110";
tc(1,23)<="111111111011000111100101";
tc(1,24)<="111111111010110011111000";
tc(1,25)<="111111111010011111101010";
tc(1,26)<="111111111010001011000001";
tc(1,27)<="111111111001110110000001";
tc(1,28)<="111111111001100000110000";
tc(1,29)<="111111111001001011010011";
tc(1,30)<="111111111000110101110001";
tc(1,31)<="111111111000100000010001";
tc(1,32)<="111111111000001010111001";
tc(1,33)<="111111110111110101110010";
tc(1,34)<="111111110111100001000011";
tc(1,35)<="111111110111001100110011";
tc(1,36)<="111111110110111001001011";
tc(1,37)<="111111110110100110010100";
tc(1,38)<="111111110110010100010110";
tc(1,39)<="111111110110000011011001";
tc(1,40)<="111111110101110011100111";
tc(1,41)<="111111110101100101001000";
tc(1,42)<="111111110101011000000100";
tc(1,43)<="111111110101001100100101";
tc(1,44)<="111111110101000010110100";
tc(1,45)<="111111110100111010110111";
tc(1,46)<="111111110100110100111001";
tc(1,47)<="111111110100110001000000";
tc(1,48)<="111111110100101111010100";
tc(1,49)<="111111110100101111111101";
tc(1,50)<="111111110100110011000010";
tc(1,51)<="111111110100111000101000";
tc(1,52)<="111111110101000000110111";
tc(1,53)<="111111110101001011110011";
tc(1,54)<="111111110101011001100001";
tc(1,55)<="111111110101101010000111";
tc(1,56)<="111111110101111101100111";
tc(1,57)<="111111110110010100000101";
tc(1,58)<="111111110110101101100011";
tc(1,59)<="111111110111001010000010";
tc(1,60)<="111111110111101001100101";
tc(1,61)<="111111111000001100001011";
tc(1,62)<="111111111000110001110011";
tc(1,63)<="111111111001011010011100";
tc(1,64)<="111111111010000110000101";
tc(1,65)<="111111111010110100101001";
tc(1,66)<="111111111011100110000111";
tc(1,67)<="111111111100011010011000";
tc(1,68)<="111111111101010001010111";
tc(1,69)<="111111111110001011000000";
tc(1,70)<="111111111111000111001010";
tc(1,71)<="000000000000000101101110";
tc(1,72)<="000000000001000110100100";
tc(1,73)<="000000000010001001100011";
tc(1,74)<="000000000011001110100000";
tc(1,75)<="000000000100010101010010";
tc(1,76)<="000000000101011101101110";
tc(1,77)<="000000000110100111100111";
tc(1,78)<="000000000111110010110010";
tc(1,79)<="000000001000111111000010";
tc(1,80)<="000000001010001100001010";
tc(1,81)<="000000001011011001111100";
tc(1,82)<="000000001100101000001010";
tc(1,83)<="000000001101110110100111";
tc(1,84)<="000000001111000101000011";
tc(1,85)<="000000010000010011010000";
tc(1,86)<="000000010001100000111111";
tc(1,87)<="000000010010101110000001";
tc(1,88)<="000000010011111010000111";
tc(1,89)<="000000010101000101000011";
tc(1,90)<="000000010110001110100101";
tc(1,91)<="000000010111010110011111";
tc(1,92)<="000000011000011100100010";
tc(1,93)<="000000011001100000100000";
tc(1,94)<="000000011010100010001011";
tc(1,95)<="000000011011100001010110";
tc(1,96)<="000000011100011101110011";
tc(1,97)<="000000011101010111010111";
tc(1,98)<="000000011110001101110100";
tc(1,99)<="000000011111000001000000";
tc(1,100)<="000000011111110000110000";
tc(1,101)<="000000100000011100111001";
tc(1,102)<="000000100001000101010011";
tc(1,103)<="000000100001101001110100";
tc(1,104)<="000000100010001010010101";
tc(1,105)<="000000100010100110101111";
tc(1,106)<="000000100010111110111100";
tc(1,107)<="000000100011010010110110";
tc(1,108)<="000000100011100010011001";
tc(1,109)<="000000100011101101100011";
tc(1,110)<="000000100011110100010000";
tc(1,111)<="000000100011110110011111";
tc(2,1)<="000000000001111111001010";
tc(2,2)<="000000000010000011100111";
tc(2,3)<="000000000010001000010000";
tc(2,4)<="000000000010001101000110";
tc(2,5)<="000000000010010010001010";
tc(2,6)<="000000000010010111011100";
tc(2,7)<="000000000010011100111010";
tc(2,8)<="000000000010100010100011";
tc(2,9)<="000000000010101000010010";
tc(2,10)<="000000000010101110000101";
tc(2,11)<="000000000010110011110110";
tc(2,12)<="000000000010111001011111";
tc(2,13)<="000000000010111110111010";
tc(2,14)<="000000000011000100000000";
tc(2,15)<="000000000011001000101000";
tc(2,16)<="000000000011001100101010";
tc(2,17)<="000000000011001111111100";
tc(2,18)<="000000000011010010010101";
tc(2,19)<="000000000011010011101001";
tc(2,20)<="000000000011010011101111";
tc(2,21)<="000000000011010010011100";
tc(2,22)<="000000000011001111100110";
tc(2,23)<="000000000011001011000010";
tc(2,24)<="000000000011000100100101";
tc(2,25)<="000000000010111100000101";
tc(2,26)<="000000000010110001011010";
tc(2,27)<="000000000010100100011010";
tc(2,28)<="000000000010010100111110";
tc(2,29)<="000000000010000010111101";
tc(2,30)<="000000000001101110010010";
tc(2,31)<="000000000001010110111000";
tc(2,32)<="000000000000111100101011";
tc(2,33)<="000000000000011111101001";
tc(2,34)<="111111111111111111110001";
tc(2,35)<="111111111111011101000010";
tc(2,36)<="111111111110110111100000";
tc(2,37)<="111111111110001111001111";
tc(2,38)<="111111111101100100010011";
tc(2,39)<="111111111100110110110100";
tc(2,40)<="111111111100000110111011";
tc(2,41)<="111111111011010100110011";
tc(2,42)<="111111111010100000101001";
tc(2,43)<="111111111001101010101010";
tc(2,44)<="111111111000110011000111";
tc(2,45)<="111111110111111010010010";
tc(2,46)<="111111110111000000011100";
tc(2,47)<="111111110110000101111100";
tc(2,48)<="111111110101001011000111";
tc(2,49)<="111111110100010000010011";
tc(2,50)<="111111110011010101111010";
tc(2,51)<="111111110010011100010100";
tc(2,52)<="111111110001100011111100";
tc(2,53)<="111111110000101101001010";
tc(2,54)<="111111101111111000011100";
tc(2,55)<="111111101111000110001011";
tc(2,56)<="111111101110010110110011";
tc(2,57)<="111111101101101010101110";
tc(2,58)<="111111101101000010011000";
tc(2,59)<="111111101100011110001011";
tc(2,60)<="111111101011111110011110";
tc(2,61)<="111111101011100011101011";
tc(2,62)<="111111101011001110001001";
tc(2,63)<="111111101010111110001100";
tc(2,64)<="111111101010110100001001";
tc(2,65)<="111111101010110000010011";
tc(2,66)<="111111101010110010111000";
tc(2,67)<="111111101010111100000111";
tc(2,68)<="111111101011001100001011";
tc(2,69)<="111111101011100011001110";
tc(2,70)<="111111101100000001010111";
tc(2,71)<="111111101100100110101001";
tc(2,72)<="111111101101010011000110";
tc(2,73)<="111111101110000110101011";
tc(2,74)<="111111101111000001010101";
tc(2,75)<="111111110000000010111011";
tc(2,76)<="111111110001001011010101";
tc(2,77)<="111111110010011010010011";
tc(2,78)<="111111110011101111100111";
tc(2,79)<="111111110101001010111101";
tc(2,80)<="111111110110101011111111";
tc(2,81)<="111111111000010010010110";
tc(2,82)<="111111111001111101100110";
tc(2,83)<="111111111011101101010010";
tc(2,84)<="111111111101100000111010";
tc(2,85)<="111111111111010111111101";
tc(2,86)<="000000000001010001110111";
tc(2,87)<="000000000011001110000011";
tc(2,88)<="000000000101001011111010";
tc(2,89)<="000000000111001010110101";
tc(2,90)<="000000001001001010001011";
tc(2,91)<="000000001011001001010010";
tc(2,92)<="000000001101000111100000";
tc(2,93)<="000000001111000100001011";
tc(2,94)<="000000010000111110101001";
tc(2,95)<="000000010010110110010000";
tc(2,96)<="000000010100101010010111";
tc(2,97)<="000000010110011010010101";
tc(2,98)<="000000011000000101100100";
tc(2,99)<="000000011001101011011101";
tc(2,100)<="000000011011001011011101";
tc(2,101)<="000000011100100101000010";
tc(2,102)<="000000011101110111101011";
tc(2,103)<="000000011111000010111011";
tc(2,104)<="000000100000000110010111";
tc(2,105)<="000000100001000001100110";
tc(2,106)<="000000100001110100010100";
tc(2,107)<="000000100010011110001100";
tc(2,108)<="000000100010111111000001";
tc(2,109)<="000000100011010110100111";
tc(2,110)<="000000100011100100110100";
tc(2,111)<="000000100011101001100011";
tc(3,1)<="111111111111011111000010";
tc(3,2)<="111111111111011001100101";
tc(3,3)<="111111111111010011111110";
tc(3,4)<="111111111111001110001101";
tc(3,5)<="111111111111001000010001";
tc(3,6)<="111111111111000010001100";
tc(3,7)<="111111111110111100000000";
tc(3,8)<="111111111110110101110000";
tc(3,9)<="111111111110101111100000";
tc(3,10)<="111111111110101001010101";
tc(3,11)<="111111111110100011010101";
tc(3,12)<="111111111110011101101001";
tc(3,13)<="111111111110011000011010";
tc(3,14)<="111111111110010011110010";
tc(3,15)<="111111111110001111111110";
tc(3,16)<="111111111110001101001001";
tc(3,17)<="111111111110001011100010";
tc(3,18)<="111111111110001011010111";
tc(3,19)<="111111111110001100111000";
tc(3,20)<="111111111110010000010011";
tc(3,21)<="111111111110010101111000";
tc(3,22)<="111111111110011101110101";
tc(3,23)<="111111111110101000011001";
tc(3,24)<="111111111110110101101111";
tc(3,25)<="111111111111000110000010";
tc(3,26)<="111111111111011001011010";
tc(3,27)<="111111111111101111111111";
tc(3,28)<="000000000000001001110010";
tc(3,29)<="000000000000100110110100";
tc(3,30)<="000000000001000111000000";
tc(3,31)<="000000000001101010010000";
tc(3,32)<="000000000010010000010111";
tc(3,33)<="000000000010111001000100";
tc(3,34)<="000000000011100100000100";
tc(3,35)<="000000000100010000111100";
tc(3,36)<="000000000100111111010000";
tc(3,37)<="000000000101101110011101";
tc(3,38)<="000000000110011101111110";
tc(3,39)<="000000000111001101001000";
tc(3,40)<="000000000111111011001111";
tc(3,41)<="000000001000100111100011";
tc(3,42)<="000000001001010001010001";
tc(3,43)<="000000001001110111100110";
tc(3,44)<="000000001010011001101101";
tc(3,45)<="000000001010110110110001";
tc(3,46)<="000000001011001101111101";
tc(3,47)<="000000001011011110100000";
tc(3,48)<="000000001011100111101001";
tc(3,49)<="000000001011101000101010";
tc(3,50)<="000000001011100000111101";
tc(3,51)<="000000001011001111111100";
tc(3,52)<="000000001010110101001011";
tc(3,53)<="000000001010010000010011";
tc(3,54)<="000000001001100001000101";
tc(3,55)<="000000001000100111011011";
tc(3,56)<="000000000111100011010101";
tc(3,57)<="000000000110010100111111";
tc(3,58)<="000000000100111100101110";
tc(3,59)<="000000000011011010111111";
tc(3,60)<="000000000001110000011010";
tc(3,61)<="111111111111111101110010";
tc(3,62)<="111111111110000100000010";
tc(3,63)<="111111111100000100001101";
tc(3,64)<="111111111001111111100000";
tc(3,65)<="111111110111110111001111";
tc(3,66)<="111111110101101100110111";
tc(3,67)<="111111110011100001110111";
tc(3,68)<="111111110001010111111000";
tc(3,69)<="111111101111010000100010";
tc(3,70)<="111111101101001101100010";
tc(3,71)<="111111101011010000100101";
tc(3,72)<="111111101001011011011010";
tc(3,73)<="111111100111101111101010";
tc(3,74)<="111111100110001110111101";
tc(3,75)<="111111100100111010110111";
tc(3,76)<="111111100011110100110100";
tc(3,77)<="111111100010111110001000";
tc(3,78)<="111111100010010111111110";
tc(3,79)<="111111100010000011011000";
tc(3,80)<="111111100010000001001011";
tc(3,81)<="111111100010010001111111";
tc(3,82)<="111111100010110110010000";
tc(3,83)<="111111100011101110001011";
tc(3,84)<="111111100100111001101100";
tc(3,85)<="111111100110011000100101";
tc(3,86)<="111111101000001010010011";
tc(3,87)<="111111101010001110001000";
tc(3,88)<="111111101100100011000101";
tc(3,89)<="111111101111000111111101";
tc(3,90)<="111111110001111011010110";
tc(3,91)<="111111110100111011101000";
tc(3,92)<="111111111000000111000000";
tc(3,93)<="111111111011011011100001";
tc(3,94)<="111111111110110111000010";
tc(3,95)<="000000000010010111010111";
tc(3,96)<="000000000101111010001011";
tc(3,97)<="000000001001011101000110";
tc(3,98)<="000000001100111101101100";
tc(3,99)<="000000010000011001100100";
tc(3,100)<="000000010011101110010101";
tc(3,101)<="000000010110111001101000";
tc(3,102)<="000000011001111001001110";
tc(3,103)<="000000011100101010111110";
tc(3,104)<="000000011111001100111001";
tc(3,105)<="000000100001011101001001";
tc(3,106)<="000000100011011010000111";
tc(3,107)<="000000100101000010010110";
tc(3,108)<="000000100110010100101100";
tc(3,109)<="000000100111010000001100";
tc(3,110)<="000000100111110100001011";
tc(3,111)<="000000101000000000001101";
tc(4,1)<="111111111111101011001011";
tc(4,2)<="111111111111110100011001";
tc(4,3)<="111111111111111110001110";
tc(4,4)<="000000000000001000100000";
tc(4,5)<="000000000000010011000100";
tc(4,6)<="000000000000011101101101";
tc(4,7)<="000000000000101000001101";
tc(4,8)<="000000000000110010010100";
tc(4,9)<="000000000000111011110000";
tc(4,10)<="000000000001000100001111";
tc(4,11)<="000000000001001011011110";
tc(4,12)<="000000000001010001000111";
tc(4,13)<="000000000001010100111010";
tc(4,14)<="000000000001010110100011";
tc(4,15)<="000000000001010101110110";
tc(4,16)<="000000000001010010100111";
tc(4,17)<="000000000001001100110011";
tc(4,18)<="000000000001000100011010";
tc(4,19)<="000000000000111001100100";
tc(4,20)<="000000000000101100100000";
tc(4,21)<="000000000000011101100110";
tc(4,22)<="000000000000001101010100";
tc(4,23)<="111111111111111100001101";
tc(4,24)<="111111111111101010111011";
tc(4,25)<="111111111111011010001011";
tc(4,26)<="111111111111001010101010";
tc(4,27)<="111111111110111101000110";
tc(4,28)<="111111111110110010000110";
tc(4,29)<="111111111110101010001111";
tc(4,30)<="111111111110100101111001";
tc(4,31)<="111111111110100101010100";
tc(4,32)<="111111111110101000100000";
tc(4,33)<="111111111110101111010000";
tc(4,34)<="111111111110111001000111";
tc(4,35)<="111111111111000101011011";
tc(4,36)<="111111111111010011010001";
tc(4,37)<="111111111111100001100100";
tc(4,38)<="111111111111101111000100";
tc(4,39)<="111111111111111010011100";
tc(4,40)<="000000000000000010011000";
tc(4,41)<="000000000000000101100011";
tc(4,42)<="000000000000000010110101";
tc(4,43)<="111111111111111001010001";
tc(4,44)<="111111111111101000010000";
tc(4,45)<="111111111111001111100001";
tc(4,46)<="111111111110101111001111";
tc(4,47)<="111111111110001000000100";
tc(4,48)<="111111111101011011001011";
tc(4,49)<="111111111100101010001110";
tc(4,50)<="111111111011110111010110";
tc(4,51)<="111111111011000101001000";
tc(4,52)<="111111111010010110011101";
tc(4,53)<="111111111001101110100001";
tc(4,54)<="111111111001010000100101";
tc(4,55)<="111111111000111111111001";
tc(4,56)<="111111111000111111100100";
tc(4,57)<="111111111001010010010010";
tc(4,58)<="111111111001111010010011";
tc(4,59)<="111111111010111001001010";
tc(4,60)<="111111111100001111100111";
tc(4,61)<="111111111101111101011110";
tc(4,62)<="000000000000000001100100";
tc(4,63)<="000000000010011001101001";
tc(4,64)<="000000000101000010011000";
tc(4,65)<="000000000111110111011100";
tc(4,66)<="000000001010110011100001";
tc(4,67)<="000000001101110000100000";
tc(4,68)<="000000010000100111101000";
tc(4,69)<="000000010011010001101101";
tc(4,70)<="000000010101100111010111";
tc(4,71)<="000000010111100001010011";
tc(4,72)<="000000011000111000101001";
tc(4,73)<="000000011001100111001001";
tc(4,74)<="000000011001100111100011";
tc(4,75)<="000000011000110101110101";
tc(4,76)<="000000010111001111011100";
tc(4,77)<="000000010100110011011100";
tc(4,78)<="000000010001100010110001";
tc(4,79)<="000000001101100000001110";
tc(4,80)<="000000001000110000011111";
tc(4,81)<="000000000011011010000111";
tc(4,82)<="111111111101100101011000";
tc(4,83)<="111111110111011100000101";
tc(4,84)<="111111110001001001001111";
tc(4,85)<="111111101010111000110100";
tc(4,86)<="111111100100110111010110";
tc(4,87)<="111111011111010001100000";
tc(4,88)<="111111011010010011101011";
tc(4,89)<="111111010110001001011111";
tc(4,90)<="111111010010111101011101";
tc(4,91)<="111111010000111000011111";
tc(4,92)<="111111010000000001100101";
tc(4,93)<="111111010000011101100001";
tc(4,94)<="111111010010001110100110";
tc(4,95)<="111111010101010100011100";
tc(4,96)<="111111011001101100000010";
tc(4,97)<="111111011111001111101011";
tc(4,98)<="111111100101110111000101";
tc(4,99)<="111111101101010111101001";
tc(4,100)<="111111110101100100101101";
tc(4,101)<="111111111110001111111100";
tc(4,102)<="000000000111001001110010";
tc(4,103)<="000000010000000001111011";
tc(4,104)<="000000011000100111110110";
tc(4,105)<="000000100000101011010111";
tc(4,106)<="000000100111111101000111";
tc(4,107)<="000000101110001111000111";
tc(4,108)<="000000110011010101001110";
tc(4,109)<="000000110111000101100001";
tc(4,110)<="000000111001011000101101";
tc(4,111)<="000000111010001010010010";
tc(5,1)<="111111111111110100011110";
tc(5,2)<="111111111111110110100001";
tc(5,3)<="111111111111111010110011";
tc(5,4)<="000000000000000000001110";
tc(5,5)<="000000000000000101011011";
tc(5,6)<="000000000000001001000001";
tc(5,7)<="000000000000001001101101";
tc(5,8)<="000000000000000110100100";
tc(5,9)<="111111111111111111000110";
tc(5,10)<="111111111111110011011110";
tc(5,11)<="111111111111100100100011";
tc(5,12)<="111111111111010011111000";
tc(5,13)<="111111111111000011101000";
tc(5,14)<="111111111110110110010011";
tc(5,15)<="111111111110101110011111";
tc(5,16)<="111111111110101110100010";
tc(5,17)<="111111111110111000000100";
tc(5,18)<="111111111111001011101110";
tc(5,19)<="111111111111101000110110";
tc(5,20)<="000000000000001101011110";
tc(5,21)<="000000000000110110010100";
tc(5,22)<="000000000001011111001000";
tc(5,23)<="000000000010000011001011";
tc(5,24)<="000000000010011101110011";
tc(5,25)<="000000000010101011001000";
tc(5,26)<="000000000010101000101100";
tc(5,27)<="000000000010010101111001";
tc(5,28)<="000000000001110100010000";
tc(5,29)<="000000000001000111010111";
tc(5,30)<="000000000000010100100000";
tc(5,31)<="111111111111100001111110";
tc(5,32)<="111111111110110110001100";
tc(5,33)<="111111111110010110101100";
tc(5,34)<="111111111110000111001110";
tc(5,35)<="111111111110001000111111";
tc(5,36)<="111111111110011010010010";
tc(5,37)<="111111111110110110100100";
tc(5,38)<="111111111111010111000001";
tc(5,39)<="111111111111110011100100";
tc(5,40)<="000000000000000100000111";
tc(5,41)<="000000000000000010000110";
tc(5,42)<="111111111111101001110000";
tc(5,43)<="111111111110111011001101";
tc(5,44)<="111111111101111010111110";
tc(5,45)<="111111111100110001110011";
tc(5,46)<="111111111011101011110010";
tc(5,47)<="111111111010110110110111";
tc(5,48)<="111111111010100000110011";
tc(5,49)<="111111111010110100111100";
tc(5,50)<="111111111011111010001010";
tc(5,51)<="111111111101110001000110";
tc(5,52)<="000000000000010011010101";
tc(5,53)<="000000000011010011011000";
tc(5,54)<="000000000110011101110110";
tc(5,55)<="000000001001011011100010";
tc(5,56)<="000000001011110100001111";
tc(5,57)<="000000001101010010000110";
tc(5,58)<="000000001101100100110001";
tc(5,59)<="000000001100100100001010";
tc(5,60)<="000000001010010010000111";
tc(5,61)<="000000000110111010110101";
tc(5,62)<="000000000010110011111001";
tc(5,63)<="111111111110011001110100";
tc(5,64)<="111111111010001100011001";
tc(5,65)<="111111110110101010011100";
tc(5,66)<="111111110100001101011110";
tc(5,67)<="111111110011000101101100";
tc(5,68)<="111111110011010111011100";
tc(5,69)<="111111110100111010000001";
tc(5,70)<="111111110111011000100110";
tc(5,71)<="111111111010010100111100";
tc(5,72)<="111111111101001011110001";
tc(5,73)<="111111111111011010010000";
tc(5,74)<="000000000000100011110000";
tc(5,75)<="000000000000010111000011";
tc(5,76)<="111111111110110010010001";
tc(5,77)<="111111111100000100100011";
tc(5,78)<="111111111000101101011010";
tc(5,79)<="111111110101011001001110";
tc(5,80)<="111111110010111011100011";
tc(5,81)<="111111110010000111100111";
tc(5,82)<="111111110011101000000011";
tc(5,83)<="111111110111110111000100";
tc(5,84)<="111111111110111000000100";
tc(5,85)<="000000001000010011111001";
tc(5,86)<="000000010011011000101000";
tc(5,87)<="000000011110111100110100";
tc(5,88)<="000000101001100110101011";
tc(5,89)<="000000110001110101111110";
tc(5,90)<="000000110110010000000001";
tc(5,91)<="000000110101101100000001";
tc(5,92)<="000000101111011110010110";
tc(5,93)<="000000100011100001000111";
tc(5,94)<="000000010010011000101110";
tc(5,95)<="111111111101010011100101";
tc(5,96)<="111111100110000100101000";
tc(5,97)<="111111001110111000111100";
tc(5,98)<="111110111010001001100101";
tc(5,99)<="111110101010001010111011";
tc(5,100)<="111110100000111011101110";
tc(5,101)<="111110011111110101011010";
tc(5,102)<="111110100111100000001100";
tc(5,103)<="111110110111101011111101";
tc(5,104)<="111111001111001111011111";
tc(5,105)<="111111101100001101111000";
tc(5,106)<="000000001100000010001001";
tc(5,107)<="000000101011101111100010";
tc(5,108)<="000001001000010100111100";
tc(5,109)<="000001011111000001001111";
tc(5,110)<="000001101101100110001100";
tc(5,111)<="000001110010100111110011";
tc(6,1)<="111111111111111110100000";
tc(6,2)<="111111111111110100001010";
tc(6,3)<="111111111111110110010110";
tc(6,4)<="000000000000000000011100";
tc(6,5)<="000000000000001001000101";
tc(6,6)<="000000000000000111001111";
tc(6,7)<="111111111111110111010100";
tc(6,8)<="111111111111011110000000";
tc(6,9)<="111111111111000110110110";
tc(6,10)<="111111111110111111001111";
tc(6,11)<="111111111111001111101000";
tc(6,12)<="111111111111110110011000";
tc(6,13)<="000000000000100111000110";
tc(6,14)<="000000000001001111001101";
tc(6,15)<="000000000001011110010011";
tc(6,16)<="000000000001001110001010";
tc(6,17)<="000000000000100110011111";
tc(6,18)<="111111111111111001101111";
tc(6,19)<="111111111111011100001000";
tc(6,20)<="111111111111011001000011";
tc(6,21)<="111111111111101100011000";
tc(6,22)<="000000000000000011111011";
tc(6,23)<="000000000000001001000101";
tc(6,24)<="111111111111101110010001";
tc(6,25)<="111111111110111001000000";
tc(6,26)<="111111111110000010011100";
tc(6,27)<="111111111101101100100111";
tc(6,28)<="111111111110010000101111";
tc(6,29)<="111111111111101111011110";
tc(6,30)<="000000000001101100000011";
tc(6,31)<="000000000011010110010111";
tc(6,32)<="000000000100000000100111";
tc(6,33)<="000000000011010110001011";
tc(6,34)<="000000000001100111110000";
tc(6,35)<="111111111111100101001001";
tc(6,36)<="111111111110000110011110";
tc(6,37)<="111111111101101111011110";
tc(6,38)<="111111111110011100000100";
tc(6,39)<="111111111111100001101001";
tc(6,40)<="000000000000000101111110";
tc(6,41)<="111111111111100001001100";
tc(6,42)<="111111111101111000101001";
tc(6,43)<="111111111100000010101010";
tc(6,44)<="111111111011001110011000";
tc(6,45)<="111111111100011001111101";
tc(6,46)<="111111111111101011111011";
tc(6,47)<="000000000100000101101001";
tc(6,48)<="000000000111111001000101";
tc(6,49)<="000000001001011010010000";
tc(6,50)<="000000000111110100111110";
tc(6,51)<="000000000011101010111100";
tc(6,52)<="111111111110101000010101";
tc(6,53)<="111111111010110001101001";
tc(6,54)<="111111111001100010010011";
tc(6,55)<="111111111010111101111011";
tc(6,56)<="111111111101101110001010";
tc(6,57)<="111111111111110001010101";
tc(6,58)<="111111111111100011110101";
tc(6,59)<="111111111100111101101100";
tc(6,60)<="111111111001100001010101";
tc(6,61)<="111111110111101110100110";
tc(6,62)<="111111111001101101001111";
tc(6,63)<="111111111111111001100110";
tc(6,64)<="000000001000100001110001";
tc(6,65)<="000000010000001011000100";
tc(6,66)<="000000010011010011110101";
tc(6,67)<="000000010000000011101100";
tc(6,68)<="000000000111010000101000";
tc(6,69)<="111111111100010001011000";
tc(6,70)<="111111110011011101100101";
tc(6,71)<="111111110000000111111010";
tc(6,72)<="111111110010110101010101";
tc(6,73)<="111111111001001010010011";
tc(6,74)<="111111111110111100111001";
tc(6,75)<="000000000000100110011011";
tc(6,76)<="111111111101001001101110";
tc(6,77)<="111111110111000100000111";
tc(6,78)<="111111110011000110101011";
tc(6,79)<="111111110101110011011001";
tc(6,80)<="000000000000101110010111";
tc(6,81)<="000000010001000000111111";
tc(6,82)<="000000100000001011010011";
tc(6,83)<="000000100110111000101000";
tc(6,84)<="000000100000100111001011";
tc(6,85)<="000000001110001110011111";
tc(6,86)<="111111110110001000000111";
tc(6,87)<="111111100001100111000101";
tc(6,88)<="111111011000100101001000";
tc(6,89)<="111111011101101010010000";
tc(6,90)<="111111101100110000011010";
tc(6,91)<="111111111101000000000001";
tc(6,92)<="000000000101010101111101";
tc(6,93)<="000000000001100110001010";
tc(6,94)<="111111110101010010000110";
tc(6,95)<="111111101010100001010100";
tc(6,96)<="111111101101000011011010";
tc(6,97)<="000000000011100100001101";
tc(6,98)<="000000101010100100100001";
tc(6,99)<="000001010011110001111000";
tc(6,100)<="000001101010111110000110";
tc(6,101)<="000001011110110001100100";
tc(6,102)<="000000101001101011010011";
tc(6,103)<="111111010110111101111010";
tc(6,104)<="111110000000110011000011";
tc(6,105)<="111101000111010110011010";
tc(6,106)<="111101000100010010000011";
tc(6,107)<="111101111111100010010100";
tc(6,108)<="111111101010011011001110";
tc(6,109)<="000001100011100001101101";
tc(6,110)<="000011000010010011010100";
tc(6,111)<="000011100110000011100110";
tc(7,1)<="000000000000110100010110";
tc(7,2)<="000000000000010000010010";
tc(7,3)<="111111111111110011011001";
tc(7,4)<="000000000000000000111001";
tc(7,5)<="000000000000000111010011";
tc(7,6)<="111111111111100001001110";
tc(7,7)<="111111111111000101010101";
tc(7,8)<="111111111111110001100000";
tc(7,9)<="000000000000111000110100";
tc(7,10)<="000000000000111101100111";
tc(7,11)<="000000000000000100101000";
tc(7,12)<="111111111111101001111011";
tc(7,13)<="000000000000000011010111";
tc(7,14)<="111111111111111111001110";
tc(7,15)<="111111111111000010101000";
tc(7,16)<="111111111110110010100100";
tc(7,17)<="000000000000001110111110";
tc(7,18)<="000000000001101101001010";
tc(7,19)<="000000000001001110011100";
tc(7,20)<="111111111111101100101000";
tc(7,21)<="111111111111011001101011";
tc(7,22)<="000000000000000111000001";
tc(7,23)<="111111111111101001000011";
tc(7,24)<="111111111110001011000000";
tc(7,25)<="111111111110100011010011";
tc(7,26)<="000000000001010101100000";
tc(7,27)<="000000000011000001000011";
tc(7,28)<="000000000001010010111001";
tc(7,29)<="111111111110111001110100";
tc(7,30)<="111111111111000101000110";
tc(7,31)<="000000000000001001010001";
tc(7,32)<="111111111110110110011101";
tc(7,33)<="111111111100111100111110";
tc(7,34)<="111111111110110111011110";
tc(7,35)<="000000000011011110100100";
tc(7,36)<="000000000100100110100101";
tc(7,37)<="000000000000101100000111";
tc(7,38)<="111111111101100011110100";
tc(7,39)<="111111111110110011101000";
tc(7,40)<="000000000000000010011110";
tc(7,41)<="111111111101011011000110";
tc(7,42)<="111111111011101100111100";
tc(7,43)<="000000000000011010110111";
tc(7,44)<="000000000110110101100111";
tc(7,45)<="000000000101111001000010";
tc(7,46)<="111111111110110111100110";
tc(7,47)<="111111111011101101101000";
tc(7,48)<="111111111110101111001010";
tc(7,49)<="111111111111100101011101";
tc(7,50)<="111111111011010011001110";
tc(7,51)<="111111111011000100010110";
tc(7,52)<="000000000011111100010110";
tc(7,53)<="000000001011001101110110";
tc(7,54)<="000000000101111110010101";
tc(7,55)<="111111111011010111111100";
tc(7,56)<="111111111001101000000110";
tc(7,57)<="111111111111000000011011";
tc(7,58)<="111111111110100000101111";
tc(7,59)<="111111111000101010010100";
tc(7,60)<="111111111100000001100111";
tc(7,61)<="000000001010000100001110";
tc(7,62)<="000000001111111011100000";
tc(7,63)<="000000000011101011011110";
tc(7,64)<="111111110101111011101101";
tc(7,65)<="111111110111110001001110";
tc(7,66)<="111111111111101011001011";
tc(7,67)<="111111111100100000111001";
tc(7,68)<="111111110110000000111001";
tc(7,69)<="111111111111111000001010";
tc(7,70)<="000000010011001110101111";
tc(7,71)<="000000010011110000100111";
tc(7,72)<="111111111101100101101010";
tc(7,73)<="111111101110011101110001";
tc(7,74)<="111111110110110001100010";
tc(7,75)<="000000000000101011111011";
tc(7,76)<="111111111001010001110000";
tc(7,77)<="111111110100010010101111";
tc(7,78)<="000000001000011011100011";
tc(7,79)<="000000011111110100000111";
tc(7,80)<="000000010100110110001110";
tc(7,81)<="111111110001101110100000";
tc(7,82)<="111111100100110111100001";
tc(7,83)<="111111110111011101000101";
tc(7,84)<="000000000001110111111010";
tc(7,85)<="111111110100010111101001";
tc(7,86)<="111111110101001000111110";
tc(7,87)<="000000011000111100111010";
tc(7,88)<="000000110000111001000010";
tc(7,89)<="000000010000000010011100";
tc(7,90)<="111111011011111001101011";
tc(7,91)<="111111011000001000101111";
tc(7,92)<="111111111011001011111001";
tc(7,93)<="000000000010111111100101";
tc(7,94)<="111111101100100100010000";
tc(7,95)<="111111111100010111110001";
tc(7,96)<="000000111011010010001111";
tc(7,97)<="000001001100000000000011";
tc(7,98)<="111111111100100110111110";
tc(7,99)<="111110101011110100101011";
tc(7,100)<="111111000001100011100111";
tc(7,101)<="000000000111000000001100";
tc(7,102)<="000000000011110010110000";
tc(7,103)<="111111011010010111001011";
tc(7,104)<="000000011101110001010010";
tc(7,105)<="000010110100001110100001";
tc(7,106)<="000010100110011100011010";
tc(7,107)<="111110001011000000000011";
tc(7,108)<="111010001000100010111001";
tc(7,109)<="111100010010001100101000";
tc(7,110)<="000011010010000110100111";
tc(7,111)<="000111001011010011100010";
tc(8,1)<="111111111111001011010101";
tc(8,2)<="000000000000100100000001";
tc(8,3)<="000000000000001101101110";
tc(8,4)<="000000000000000001110000";
tc(8,5)<="111111111111100001001111";
tc(8,6)<="111111111111110001100100";
tc(8,7)<="000000000000110110111100";
tc(8,8)<="111111111111101111001110";
tc(8,9)<="000000000000000010010100";
tc(8,10)<="111111111111000001111101";
tc(8,11)<="000000000001000101101110";
tc(8,12)<="111111111111111100110101";
tc(8,13)<="000000000000000110001011";
tc(8,14)<="111111111111000000100101";
tc(8,15)<="000000000000010100011011";
tc(8,16)<="000000000000111101110000";
tc(8,17)<="111111111111100101111010";
tc(8,18)<="111111111111101101111001";
tc(8,19)<="111111111110111001000111";
tc(8,20)<="000000000001111111010100";
tc(8,21)<="111111111111011100101000";
tc(8,22)<="000000000000001010011000";
tc(8,23)<="111111111110001001001100";
tc(8,24)<="000000000001100010110010";
tc(8,25)<="000000000000110010011100";
tc(8,26)<="111111111111011110010011";
tc(8,27)<="111111111110111010111101";
tc(8,28)<="111111111111010010001111";
tc(8,29)<="000000000011000101000011";
tc(8,30)<="111111111110100101101101";
tc(8,31)<="000000000000000100011101";
tc(8,32)<="111111111101001001001100";
tc(8,33)<="000000000011110000000100";
tc(8,34)<="111111111111110101011000";
tc(8,35)<="111111111111100000010110";
tc(8,36)<="111111111101011011110011";
tc(8,37)<="000000000000111101110001";
tc(8,38)<="000000000011101101100010";
tc(8,39)<="111111111101100000100001";
tc(8,40)<="111111111111011111101110";
tc(8,41)<="111111111100101101000101";
tc(8,42)<="000000000110110000010001";
tc(8,43)<="111111111101101110011111";
tc(8,44)<="111111111111101110111111";
tc(8,45)<="111111111011010110100001";
tc(8,46)<="000000000100100110101100";
tc(8,47)<="000000000010111001011111";
tc(8,48)<="111111111100100110000001";
tc(8,49)<="111111111110000010000011";
tc(8,50)<="111111111101111101010000";
tc(8,51)<="000000001001101010010111";
tc(8,52)<="111111111010011110001110";
tc(8,53)<="111111111111111110111100";
tc(8,54)<="111111111001010100001110";
tc(8,55)<="000000001010011000010110";
tc(8,56)<="111111111111100111000110";
tc(8,57)<="111111111100010111000110";
tc(8,58)<="111111111011011001011011";
tc(8,59)<="000000000010001110110101";
tc(8,60)<="000000001010111000001100";
tc(8,61)<="111111110110100111000011";
tc(8,62)<="111111111111110010001001";
tc(8,63)<="111111111000101001101101";
tc(8,64)<="000000010001100111100011";
tc(8,65)<="111111111001001001000010";
tc(8,66)<="111111111101001101111011";
tc(8,67)<="111111110111101101111101";
tc(8,68)<="000000001010101101101000";
tc(8,69)<="000000001000010001111110";
tc(8,70)<="111111110011001011001001";
tc(8,71)<="111111111110011010110111";
tc(8,72)<="111111111011011001100000";
tc(8,73)<="000000011000100101111111";
tc(8,74)<="111111101111010100110110";
tc(8,75)<="111111111111001111111010";
tc(8,76)<="111111110011110100011111";
tc(8,77)<="000000011000001100100111";
tc(8,78)<="111111111111010110111001";
tc(8,79)<="111111110001100000110110";
tc(8,80)<="111111111011000011010100";
tc(8,81)<="000000000100011101101100";
tc(8,82)<="000000011100011011010011";
tc(8,83)<="111111100010011001010101";
tc(8,84)<="000000000010000110110101";
tc(8,85)<="111111110001100100100011";
tc(8,86)<="000000101011011001100000";
tc(8,87)<="111111101100100011010011";
tc(8,88)<="111111110011001100010101";
tc(8,89)<="111111110100101010111001";
tc(8,90)<="000000011000111110010111";
tc(8,91)<="000000011000010110100000";
tc(8,92)<="111111010001110111000111";
tc(8,93)<="000000000101000101001010";
tc(8,94)<="111111110101000001010010";
tc(8,95)<="000001000111011011111100";
tc(8,96)<="111111000110010101000001";
tc(8,97)<="111111111010111100000010";
tc(8,98)<="111111101000101110111001";
tc(8,99)<="000001001001110010111000";
tc(8,100)<="111111111111001100000110";
tc(8,101)<="111110110110001001001001";
tc(8,102)<="000000000111010100101111";
tc(8,103)<="000000001110010100001111";
tc(8,104)<="000010000111100010101101";
tc(8,105)<="111101001000110011100011";
tc(8,106)<="000000011011011011001101";
tc(8,107)<="111110111100011111010111";
tc(8,108)<="000101101111101011001010";
tc(8,109)<="111011110100010111011010";
tc(8,110)<="111000111000011000000110";
tc(8,111)<="001110010101110010000000";
END coeff_io_arch;