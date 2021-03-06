
library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
  port ( a,b :in std_logic_vector(11 downto 0); 
         clk,reset :in std_logic; 
          output :out std_logic_vector(11 downto 0));
        end entity;
        
architecture arch_adder of adder is
signal sig : std_logic_vector(11 downto 0);
begin
  process(clk,reset,a,b)
    begin
if clk'EVENT and clk='1' then
  if reset='1' then 
    sig <=(others => '0');
  else
    sig<=(a+b);
    
  end if;
end if;
end process;
output<=sig;
end architecture;