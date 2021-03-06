-- fulladd_ovf.vhd
-- 100910 Mathias Lundell
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.math_real.all;

ENTITY fulladd_ovf IS
    GENERIC ( WIDTH : NATURAL := 4 );
    PORT ( a        : IN  STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0 );
           b        : IN  STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0 );
           cin      : IN  STD_LOGIC;
           
           s        : OUT STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0 );
           overflow : OUT STD_LOGIC );   
END ENTITY fulladd_ovf;

ARCHITECTURE fulladd_ovf_arch OF fulladd_ovf IS
    COMPONENT add2b
        PORT ( a    : IN  STD_LOGIC;
               b    : IN  STD_LOGIC;
               cin  : IN  STD_LOGIC;
          
               s    : OUT STD_LOGIC;
               cout : OUT STD_LOGIC );
    END COMPONENT;
    
    SIGNAL n_cout : STD_LOGIC_VECTOR( WIDTH DOWNTO 0 );
    
BEGIN
    n_cout(0) <= cin;
    
    FA_generate: FOR i IN 0 TO WIDTH-1 GENERATE
        FA_i: add2b PORT MAP ( a(i), b(i), n_cout(i), s(i), n_cout(i+1) );
    END GENERATE;
    
    overflow <= n_cout(WIDTH) XOR n_cout(WIDTH-1);
    
END ARCHITECTURE fulladd_ovf_arch;

