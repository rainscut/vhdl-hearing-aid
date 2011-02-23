--------------------------------------------------------------------------------
-- Init is part of the multiplier generated on 2007-02-22 using the
-- HMS  Multiplier Generator.
--
-- Copyright Magnus Sjalander
--
-- http://www.ce.chalmers.se/~hms/multiplier.html
--
-- Disclaimer: This service was provided "as is",
-- the service provider cannot guarantee that there are no discrepancies.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity Init is
	port(	A	: in  std_logic;
		B	: in  std_logic;
		G	: out std_logic;
		P	: out std_logic);
end;

architecture rtl of Init is
begin
	G <= A AND B;
	P <= A XOR B;
end;
