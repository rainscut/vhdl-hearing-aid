--------------------------------------------------------------------------------
-- DOT is part of the multiplier generated on 2007-02-22 using the
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

entity DOTs is
	port(	P1	: in std_logic;
		G1	: in  std_logic;
		P2	: in  std_logic;
		G2	: in  std_logic;
		P	: out std_logic;
		G	: out std_logic);
end;

architecture rtl of DOTs is
begin
	G <= G1 OR (G2 AND P1);
	P <= P1 AND P2;
end;
