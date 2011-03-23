-- Description:
-- filterblock_main.vhd
-- Author: Shwan Ciyako,Anandhavel Sakthivel
-- It is still in the implementation phase. 
-- This files adds needed components together to make a filterbank, you are welcome to make changes but make shure to update the whole chain of files that will be affected
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_signed.ALL;
USE work.EQ_data_type.ALL;
USE work.EQ_functions.ALL;

ENTITY filterblock_main IS
	  GENERIC(
            NUM_BITS_OUT : NATURAL := 13;
            NUM_OF_SAMPLES : NATURAL := 200;
            NUM_OF_COEFFS : NATURAL := 110;
            NUM_OF_BANDS: NATURAL := 8);
    PORT( 
            clk     : IN STD_LOGIC;
            reset   : IN STD_LOGIC;
            sample1 : IN sample;
            sample2 : IN sample;
            updated : IN STD_LOGIC; 
            Q       : OUT Multi_Result_array;
            done    : OUT STD_LOGIC;
            next_sample : OUT STD_LOGIC;
            sample_nr : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END filterblock_main;

ARCHITECTURE  filterblock_main_arch OF filterblock_main IS 
-- constants 
CONSTANT CO:taps_type:=(( "111111111111000101100000","111111111110111111111110","111111111110111010001010","111111111110110011111101","111111111110101101010110","111111111110100110001111","111111111110011110100110","111111111110010110010111","111111111110001101011111","111111111110000011111100","111111111101111001101010","111111111101101110101001","111111111101100010110111","111111111101010110010010","111111111101001000111010","111111111100111010101111","111111111100101011110000","111111111100011011111111","111111111100001011011101","111111111011111010001100","111111111011101000001101","111111111011010101100100","111111111011000010010100","111111111010101110100000","111111111010011010001101","111111111010000101100000","111111111001110000011101","111111111001011011001011","111111111001000101101111","111111111000110000010000","111111111000011010110100","111111111000000101100100","111111110111110000100111","111111110111011100000100","111111110111001000000011","111111110110110100101110","111111110110100010001100","111111110110010000100110","111111110110000000000100","111111110101110000110001","111111110101100010110100","111111110101010110010110","111111110101001011100001","111111110101000010011100","111111110100111011010000","111111110100110110000101","111111110100110011000011","111111110100110010010010","111111110100110011111001","111111110100110111111110","111111110100111110101001","111111110101000111111111","111111110101010100000101","111111110101100011000000","111111110101110100110100","111111110110001001100110","111111110110100001010111","111111110110111100001010","111111110111011010000000","111111110111111010111010","111111111000011110111001","111111111001000101111010","111111111001101111111101","111111111010011100111111","111111111011001100111100","111111111011111111110010","111111111100110101011010","111111111101101101101111","111111111110101000101100","111111111111100110000111","000000000000100101111010","000000000001100111111101","000000000010101100000100","000000000011110010000111","000000000100111001111010","000000000110000011010010","000000000111001110000011","000000001000011010000001","000000001001100110111111","000000001010110100101111","000000001100000011000011","000000001101010001101110","000000001110100000100000","000000001111101111001011","000000010000111101100001","000000010010001011010001","000000010011011000001110","000000010100100100001000","000000010101101110101111","000000010110110111110110","000000010111111111001101","000000011001000100100110","000000011010000111110011","000000011011001000100101","000000011100000110110000","000000011101000010000111","000000011101111010011101","000000011110101111100110","000000011111100001010111","000000100000001111100101","000000100000111010001000","000000100001100000110100","000000100010000011100011","000000100010100010001101","000000100010111100101011","000000100011010010111000","000000100011100100101110","000000100011110010001010","000000100011111011001001","000000100011111111101001"),
("000000000010000001110111","000000000010000110000111","000000000010001010100011","000000000010001111001101","000000000010010100000100","000000000010011001001001","000000000010011110011001","000000000010100011110011","000000000010101001010100","000000000010101110110110","000000000010110100010110","000000000010111001101100","000000000010111110110010","000000000011000011100000","000000000011000111101111","000000000011001011010100","000000000011001110000111","000000000011001111111110","000000000011010000101101","000000000011010000001011","000000000011001110001101","000000000011001010101000","000000000011000101010010","000000000010111110000000","000000000010110100101000","000000000010101001000010","000000000010011011000100","000000000010001010101000","000000000001110111100101","000000000001100001110110","000000000001001001010110","000000000000101110000011","000000000000001111111010","111111111111101110111010","111111111111001011000110","111111111110100100011111","111111111101111011001010","111111111101001111001101","111111111100100000110001","111111111011101111111111","111111111010111101000010","111111111010001000001000","111111111001010001100000","111111111000011001011010","111111110111100000001010","111111110110100110000001","111111110101101011010110","111111110100110000100000","111111110011110101110101","111111110010111011101111","111111110010000010101000","111111110001001010111000","111111110000010100111100","111111101111100001001110","111111101110110000001010","111111101110000010001011","111111101101010111101011","111111101100110001000110","111111101100001110110101","111111101011110001010001","111111101011011000110001","111111101011000101101101","111111101010111000011001","111111101010110001001000","111111101010110000001100","111111101010110101110100","111111101011000010001101","111111101011010101100010","111111101011101111111010","111111101100010001011100","111111101100111010001010","111111101101101010000100","111111101110100001000111","111111101111011111001110","111111110000100100001111","111111110001101111111111","111111110011000010001111","111111110100011010101110","111111110101111001000111","111111110111011101000011","111111111001000110001001","111111111010110011111100","111111111100100101111110","111111111110011011101110","000000000000010100101001","000000000010010000001011","000000000100001101101110","000000000110001100101011","000000001000001100010111","000000001010001100001011","000000001100001011011101","000000001110001001100000","000000010000000101101101","000000010001111111010111","000000010011110101110101","000000010101101000011110","000000010111010110101010","000000011000111111110011","000000011010100011010011","000000011100000000100111","000000011101010111001101","000000011110100110100111","000000011111101110010111","000000100000101110000100","000000100001100101010111","000000100010010011111011","000000100010111001100000","000000100011010101111000","000000100011101000111001","000000100011110010011010"),
("111111111111011100001111","111111111111010110110011","111111111111010001001101","111111111111001011011110","111111111111000101100110","111111111110111111101000","111111111110111001100100","111111111110110011011110","111111111110101101011010","111111111110100111011111","111111111110100001110010","111111111110011100011101","111111111110010111101001","111111111110010011100000","111111111110010000001111","111111111110001110000010","111111111110001101001001","111111111110001101110001","111111111110010000001010","111111111110010100100011","111111111110011011001010","111111111110100100001101","111111111110101111111011","111111111110111110011111","111111111111010000000001","111111111111100100101011","111111111111111100100001","000000000000010111100101","000000000000110101110101","000000000001010111001011","000000000001111011011111","000000000010100010100010","000000000011001100000011","000000000011110111101011","000000000100100100111111","000000000101010011011111","000000000110000010101000","000000000110110001110011","000000000111100000010011","000000001000001101011100","000000001000111000011011","000000001001100000011111","000000001010000100110010","000000001010100100100000","000000001010111110110011","000000001011010010111001","000000001011100000000000","000000001011100101011000","000000001011100010010111","000000001011010110010110","000000001011000000110100","000000001010100001011000","000000001001110111101100","000000001001000011100111","000000001000000101000100","000000000110111100001010","000000000101101001001000","000000000100001100010111","000000000010100110011010","000000000000110111111101","111111111111000001110110","111111111101000101000100","111111111011000010110001","111111111000111100001100","111111110110110010101101","111111110100100111110010","111111110010011101000001","111111110000010100000001","111111101110001110011110","111111101100001110000101","111111101010010100100101","111111101000100011101001","111111100110111100111100","111111100101100010000011","111111100100010100100000","111111100011010101101010","111111100010100110110100","111111100010001001000011","111111100001111101010100","111111100010000100010101","111111100010011110101010","111111100011001100100111","111111100100001110010001","111111100101100011100000","111111100111001011111100","111111101001000110111011","111111101011010011101000","111111101101110000111101","111111110000011101100110","111111110011011000000001","111111110110011110100010","111111111001101111001110","111111111101001000000011","000000000000100110110110","000000000100001001010101","000000000111101101001001","000000001011001111111000","000000001110101111000110","000000010010001000011001","000000010101011001010111","000000011000011111101111","000000011011011001010001","000000011110000011111011","000000100000011101101111","000000100010100101000000","000000100100011000001011","000000100101110101111011","000000100110111101001100","000000100111101101001011","000000101000000101010011"),
("111111111111101111101100","111111111111111001010000","000000000000000011010011","000000000000001101101011","000000000000011000001011","000000000000100010101000","000000000000101100110010","000000000000110110011010","000000000000111111001110","000000000001000110111011","000000000001001101001111","000000000001010001110110","000000000001010100100000","000000000001010100111101","000000000001010011000001","000000000001001110100100","000000000001000111100101","000000000000111110000111","000000000000110010010110","000000000000100100100101","000000000000010101001101","000000000000000100101111","111111111111110011110000","111111111111100010111100","111111111111010010111110","111111111111000100100100","111111111110111000011000","111111111110101111000000","111111111110101000111011","111111111110100110011100","111111111110100111101100","111111111110101100100110","111111111110110100110101","111111111110111111110110","111111111111001100110110","111111111111011010111000","111111111111101000110000","111111111111110101001110","111111111111111110111100","000000000000000100100101","000000000000000100111100","111111111111111110111101","111111111111110001110110","111111111111011101001010","111111111111000000110100","111111111110011101010000","111111111101110011010110","111111111101000100011111","111111111100010010100100","111111111011011111111100","111111111010101111010101","111111111010000011110011","111111111001100000100011","111111111001001000110111","111111111000111111111010","111111111001001000101000","111111111001100101100001","111111111010011000011110","111111111011100010101011","111111111101000100011100","111111111110111101000111","000000000001001011000001","000000000011101011010111","000000000110011010010110","000000001001010011001001","000000001100010000000011","000000001111001010101000","000000010001111011111000","000000010100011100011111","000000010110100101000110","000000011000001110100110","000000011001010010010111","000000011001101010100111","000000011001010010101001","000000011000000111001001","000000010110000110010101","000000010011010000001010","000000001111100110011110","000000001011001100111111","000000000110001001010110","000000000000100010111100","111111111010100010110101","111111110100010011011100","111111101110000000010110","111111100111110101110011","111111100010000000011111","111111011100101100111111","111111011000000111011001","111111010100011010110101","111111010001110001000110","111111010000010010001100","111111010000000100000011","111111010001001010010000","111111010011100101110100","111111010111010101000010","111111011100010011100100","111111100010011010011001","111111101001100000000011","111111110001011000110101","111111111001110111001110","000000000010101100001011","000000001011100111101011","000000010100011001010000","000000011100110000011100","000000100100011101010111","000000101011010001010011","000000110000111111000110","000000110101011011101011","000000111000011110011000","000000111010000001001111"),
("111111111111110101001010","111111111111111000011110","111111111111111101011110","000000000000000010111011","000000000000000111011100","000000000000001001101100","000000000000001000100011","000000000000000011010101","111111111111111001110111","111111111111101100101010","111111111111011100111011","111111111111001100011111","111111111110111101101011","111111111110110011000001","111111111110101110111111","111111111110110011100011","111111111111000001110111","111111111111011001111100","111111111111111010100000","000000000000100000111110","000000000001001001100110","000000000001101111111011","000000000010001111010001","000000000010100011010110","000000000010101000111101","000000000010011110100010","000000000010000100100000","000000000001011101011000","000000000000101101100100","111111111111111010110111","111111111111001011101001","111111111110100101111100","111111111110001110011100","111111111110000111101010","111111111110010001011001","111111111110101000100100","111111111111000111011110","111111111111100110100111","111111111111111101110101","000000000000000101101011","111111111111111000111001","111111111111010101100001","111111111110011101110110","111111111101011000011100","111111111100001111110011","111111111011010001000010","111111111010101010001001","111111111010100111111011","111111111011010011101001","111111111100110001010000","111111111110111101111111","000000000001101111111011","000000000100110110100101","000000000111111100011110","000000001010101001101011","000000001100100110110101","000000001101100000100011","000000001101001010010110","000000001011100000111000","000000001000101011001010","000000000100111010001001","000000000000100111000111","111111111100010000100101","111111111000010110010001","111111110101010100110011","111111110011100001011010","111111110011000110100111","111111110100000010010011","111111110110000101100110","111111111000110110100111","111111111011110100000110","111111111110011010010110","000000000000001001000000","000000000000101000100101","111111111111101111001010","111111111101100011010000","111111111010011100010111","111111110111000000111011","111111110100000001101010","111111110010010010111001","111111110010100100100011","111111110101011001111100","111111111011000010100100","000000000011010100110111","000000001101101100001110","000000011001001010010111","000000100100011100101101","000000101110000100111000","000000110100100011111100","000000110110100110101000","000000110011010001011101","000000101010001010101111","000000011011100001011000","000000001000001111000100","111111110001110101011000","111111011010010101110110","111111000100000101011100","111110110001011101000001","111110100100101000010000","111110011111010101000000","111110100010100101011001","111110101110100110000000","111111000010101001111100","111111011101001101000101","111111111011111100110000","000000011100000101110011","000000111010100110101111","000001010100100011111100","000001100111011011100001","000001110001010110101101"),
("111111111111110111110000","111111111111110011110110","111111111111111010111101","000000000000000101100011","000000000000001001110010","000000000000000000111011","111111111111101011011111","111111111111010001111100","111111111111000001010110","111111111111000101001111","111111111111100001010011","000000000000001110010101","000000000000111100010010","000000000001011000111000","000000000001011000010000","000000000000111011000111","000000000000001111000110","111111111111101000011110","111111111111010111111011","111111111111100001011001","111111111111111001001110","000000000000001001110101","111111111111111111110101","111111111111010110100000","111111111110011101100010","111111111101110011111000","111111111101111000111110","111111111110111011000100","000000000000101100000110","000000000010100100001001","000000000011110001111100","000000000011110010010010","000000000010100010101011","000000000000100100110011","111111111110101111010111","111111111101110011000011","111111111110000000110110","111111111111000000001010","111111111111111011010101","111111111111111101101010","111111111110110011110100","111111111100111100100100","111111111011011110011011","111111111011100100111010","111111111101110101110100","000000000001110101000001","000000000110001000001110","000000001000111100010001","000000001000111011110100","000000000101111100001010","000000000001000111101100","111111111100011101101110","111111111001110101001011","111111111010000000111000","111111111100010100110110","111111111110111101100110","111111111111111111110010","111111111110100000011101","111111111011001110011101","111111111000010011000110","111111111000001101001000","111111111100010110101001","000000000100000101001101","000000001100101010001101","000000010010011001111100","000000010010011011011000","000000001100001001010001","000000000001110000101001","111111110111010111100010","111111110001000010110101","111111110000110110110011","111111110101110100010001","111111111100011001100101","000000000000011011101010","111111111111011011111111","111111111010001011101001","111111110100100001001100","111111110011011100111011","111111111010010100010111","000000001000100001111011","000000011001001011011011","000000100100111010111101","000000100101011010000111","000000011000100111001111","000000000010010101000001","111111101010110111010011","111111011011011000000010","111111011001011111110000","111111100100011101110111","111111110101010111100010","000000000010100101010101","000000000100111100100101","111111111011111111011111","111111101110111100010101","111111101001100001011100","111111110101110000101101","000000010101101010111010","000001000000000110001101","000001100010110111101100","000001101001111110111011","000001001001000001110011","000000000010101010011000","111110101010010100001001","111101011110100101110011","111100111110000001011110","111101011010100001000011","111110110000110010010010","000000100111101111010000","000010011000100110011101","000011011100111010000111"),
("000000000000100110011010","111111111111111100100110","111111111111110110100101","000000000000001001001011","111111111111111000011011","111111111111001100111111","111111111111010010111011","000000000000011000000111","000000000001000101100100","000000000000100010110110","111111111111101111001000","111111111111110100011001","000000000000001001111001","111111111111100100001001","111111111110101110111101","111111111111010111000011","000000000001000111001110","000000000001101100101101","000000000000011010111111","111111111111010101100100","111111111111110001100100","000000000000000110110000","111111111110111000110111","111111111110000001000101","111111111111110011110000","000000000010100001101001","000000000010011110001101","111111111111111001101001","111111111110101010111110","111111111111110001001100","111111111111110101011100","111111111101101100010100","111111111101010110000100","000000000001001100000100","000000000100101110100101","000000000010111110001001","111111111110101000001011","111111111101110010101100","111111111111110101011111","111111111111000111010011","111111111011111111000010","111111111101010011100000","000000000100000010100101","000000000111011110101110","000000000010100001000001","111111111100010110011111","111111111100111001010100","111111111111111100111001","111111111101101100110100","111111111010000011001011","111111111110101111000101","000000001000101101100111","000000001010000110110100","000000000000010010101010","111111111001000010000100","111111111100010010111111","111111111111111111011111","111111111011011010110011","111111111000100001100001","000000000010101000110010","000000001111001100111111","000000001011011110101100","111111111011011101101010","111111110100111001011111","111111111100010111101011","111111111111101101110000","111111111000001111100101","111111111000011101000101","000000001010000111010111","000000010111000100100110","000000001010000000011110","111111110011001100111101","111111110000011011010011","111111111101100000010010","111111111110101111101111","111111110100010110101100","111111111011011100010010","000000010110100011001000","000000011111011101111110","000000000011011001110101","111111100110011000101101","111111101100010000001111","000000000000001001100010","111111111100011111111000","111111110000001001010101","000000000100010010010111","000000101010101000010100","000000100111010001001101","111111110011010110000110","111111010010000111100010","111111101001000010010110","000000000101001111111110","111111110111101011001011","111111101100001011001000","000000011010011101010111","000001001111110010100111","000000101101010011001010","111111001011010100000101","111110101001000111000000","111111100111010011001101","000000010001011100000101","111111101010001001100101","111111101001000011010110","000001101011110101111111","000011010001001111011110","000000110000100101101100","111011101001110010000001","111010010010100111110001","111111100111010100010110","000110000111100000010110"),
("111111111111100110111100","000000000000110100010010","111111111111110010111110","000000000000000110110001","111111111111001000010000","000000000000110001101101","000000000000000110001110","000000000000000011101111","111111111111010100010011","111111111111111111011101","000000000000111001110110","111111111111101011001010","111111111111111010110101","111111111110111101001010","000000000001011101110010","111111111111101111101110","000000000000001000100000","111111111110101001001011","000000000000110011011110","000000000000111011001011","111111111111100001111110","111111111111011010000100","111111111110111111101111","000000000010011111101111","111111111111000100111100","000000000000001001100101","111111111101101010101101","000000000010011110110011","000000000000011011100110","111111111111011110001101","111111111110010010110011","111111111111111010101010","000000000011011101100000","111111111110000101010100","111111111111110111101100","111111111100110101001101","000000000101001000010000","111111111110111100101010","111111111111100110101010","111111111100011110110001","000000000010011111001000","000000000011100001001000","111111111101000001110001","111111111110111010001011","111111111101000100000100","000000001000001110111011","111111111100010000001101","111111111111111000010011","111111111010010011100100","000000000111001100010000","000000000001100110111011","111111111100011000101100","111111111100111000101111","111111111111101000110011","000000001010100010101011","111111111000100110101100","111111111111111110101101","111111111000101111010100","000000001101110101001000","111111111100110100000000","111111111100101001110010","111111111001101011101110","000000000101110111001111","000000001010001010100000","111111110100110011001110","111111111111010011001110","111111111001011101101011","000000010101001110010101","111111110100101011000110","111111111110000110100110","111111110101101111000111","000000010000110000001101","000000000100110001101111","111111110010000011110101","111111111101000011000010","111111111110111010001111","000000011011000101101111","111111101001010001100011","000000000000100111001000","111111110010010101011000","000000100000111101110101","111111110111100001110001","111111110001110101011110","111111111000010101000011","000000001100110000010101","000000011011110011001100","111111011010101111011011","000000000011101000010110","111111110010001001111111","000000110111110010110111","111111011101001001010111","111111110101111111010101","111111101111110000011110","000000101011011001011110","000000010000001111101111","111111000110110010001010","000000000110010101111111","111111111100010001100110","000001011101101100010010","111110011111111100101111","000000000100001001011100","111111011100110101111100","000010000111110100101001","111111010101010010110000","111110010000111101110111","000000000111111100101010","000001010001101111110000","000100110001110010000101","110100001101101001001101","000110101111001011111100"));


-- components 

-- The samples come from the main main 
-- The Coefficents will be here or in the package 

-- serialfilter component 
COMPONENT serial_filter IS 
  GENERIC(
        NUM_BITS_OUT : NATURAL := 37;
        NUM_OF_COEFFS : NATURAL := 110);
PORT( 
        clk     : IN STD_LOGIC;
        reset   : IN STD_LOGIC;
        CO      : IN coefficient_type;
        CE      : IN STD_LOGIC;
        sample1 : IN sample;
        sample2 : IN sample;
        Q	    : OUT STD_LOGIC_VECTOR(NUM_BITS_OUT-1 DOWNTO 0));
END COMPONENT;


-- signals 
SIGNAL CE_FIR1,OE_FIR1,CE_FIR2,OE_FIR2: STD_LOGIC;
SIGNAL Q_FIR1, Q_FIR2 :  Multi_Result;
SIGNAL CO_FIR1,CO_FIR2 : coefficient_type;

TYPE state_type_Filter_Bank IS ( WAIT_SAMPLE, COMPUTE_DATA);
SIGNAL STATE, NEXT_STATE : state_type_Filter_Bank;
SIGNAL start_filter : STD_LOGIC;

BEGIN 
-- component instantiation 
FIR1:  serial_filter PORT MAP(
    clk => clk,
    reset => updated,
    CO => CO_FIR1,
    CE => start_filter,
    sample1 => sample1,
    sample2 => sample2,
    Q => Q_FIR1);
    
FIR2:  serial_filter PORT MAP(
    clk => clk,
    reset => updated,
    CO => CO_FIR2,
    CE => start_filter,
    sample1 => sample1,
    sample2 => sample2,
    Q => Q_FIR2);

PROCESS(clk)
    VARIABLE count : NATURAL RANGE 0 TO NUM_OF_COEFFS;
    VARIABLE count_filters : NATURAL RANGE 0 TO NUM_OF_BANDS+1;
    TYPE state_type IS (IDLE, READ_SAMPLE, UPDATE_FILTER, UPDATE_OUTPUT);
    VARIABLE state : state_type;
BEGIN

IF clk'EVENT AND clk = '1' THEN
    IF reset = '1' THEN
        count := 0;
        count_filters := 0;
        done <= '0';
        state := IDLE;
        Q(0) <= (OTHERS => '0');
        Q(1) <= (OTHERS => '0');
        Q(2) <= (OTHERS => '0');
        Q(3) <= (OTHERS => '0');
        Q(4) <= (OTHERS => '0');
        Q(5) <= (OTHERS => '0');
        Q(6) <= (OTHERS => '0');
        Q(7) <= (OTHERS => '0');
    ELSE
        IF updated = '1' THEN
            state := READ_SAMPLE;
            count := 0;
            count_filters := 0;
            start_filter <= '0';
            done <= '0';
        ELSE
            CASE (state) IS
                WHEN IDLE =>
                    done <= '0';
                    
                WHEN READ_SAMPLE =>
                    next_sample <= '1';
                    start_filter <= '0';
                    sample_nr <= STD_LOGIC_VECTOR(TO_UNSIGNED(count, 7));
                    state := UPDATE_FILTER;
                    
                WHEN UPDATE_FILTER =>
                    next_sample <= '0';
                    CO_FIR1 <= CO(count_filters, count);
                    CO_FIR2 <= CO(count_filters+1, count);
                    start_filter <= '1';
                    IF count < NUM_OF_COEFFS-1 THEN
                        count := count + 1;
                        state := READ_SAMPLE;
                    ELSE
                        count := 0;
                        state := UPDATE_OUTPUT;
                    END IF;
                    
                WHEN UPDATE_OUTPUT =>
                    Q(count_filters) <= Q_FIR1;
                    Q(count_filters+1) <= Q_FIR2;
                    IF count_filters < NUM_OF_BANDS-2 THEN
                        count_filters := count_filters + 2; -- since we calculate 2 filters at the time
                        state := READ_SAMPLE;
                    ELSE
                        done <= '1';
                        count_filters := 0;
                        state := IDLE;
                    END IF;
            END CASE;
        END IF;
    END IF;
END IF; --clk
End process;

END ARCHITECTURE;
