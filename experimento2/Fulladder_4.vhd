library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Fulladder_4 is
		Port ( inA :   in STD_LOGIC_VECTOR (3 downto 0);
				 inB :   in STD_LOGIC_VECTOR (3 downto 0);
				 Cin :   in STD_LOGIC;
				 Sum4 :  out STD_LOGIC_VECTOR (6 downto 0);
				 Cout :  out STD_LOGIC);
end Fulladder_4;
 
architecture Structural of Fulladder_4 is
 
-- Componente del full adder de 1 bit
component Fulladder_1
		Port ( inA :  in STD_LOGIC;
				 inB :  in STD_LOGIC;
				 Cin :  in STD_LOGIC;
				 Sum1 : out STD_LOGIC;
				 Cout : out STD_LOGIC);
end component;


-- Componente del codificador para el display de 7 segmentos
component codec7seg is

    Port ( 
			Sum4 : in  STD_LOGIC_VECTOR (3 downto 0);
			seg7 : out  STD_LOGIC_VECTOR (6 downto 0));
	 
end component;
 

signal co1,co2,co3: STD_LOGIC;
Signal result: STD_LOGIC_VECTOR (3 downto 0);
 
begin
 
-- Suma de 4 bits usando full adders de 1 bit
S0: Fulladder_1 port map( inA(0), inB(0), Cin, result(0), co1);
S1: Fulladder_1 port map( inA(1), inB(1), co1, result(1), co2);
S2: Fulladder_1 port map( inA(2), inB(2), co2, result(2), co3);
S3: Fulladder_1 port map( inA(3), inB(3), co3, result(3), Cout);

conv: codec7seg port map(result, Sum4);
 
end Structural;