LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Fulladder_1tb IS
END Fulladder_1tb;
 
ARCHITECTURE behavior OF Fulladder_1tb IS
 
 
 
 
 COMPONENT Fulladder_1
 PORT(
		 inA : IN std_logic;
		 inB : IN std_logic;
		 Cin : IN std_logic;
		 Sum1 : OUT std_logic;
		 Cout : OUT std_logic
		 );
 END COMPONENT;
 
 --Inputs
 signal inA : std_logic := '0';
 signal inB : std_logic := '0';
 signal Cin : std_logic := '0';
 
 --Outputs
 signal Sum1 : std_logic;
 signal Cout : std_logic;
 
BEGIN
 

 uut: Fulladder_1 PORT MAP (
									 inA => inA,
									 inB => inB,
									 Cin => Cin,
									 Sum1 => Sum1,
									 Cout => Cout
									 );
 
 -- Stimulus process
 stim_proc: process
 
 begin
	 -- hold reset state for 100 ns.
	 wait for 100 ns;
	 
	 -- insert stimulus here
	 inA <= '1';
	 inB <= '0';
	 Cin <= '0';
	 wait for 10 ns;
	 
	 inA <= '0';
	 inB <= '1';
	 Cin <= '0';
	 wait for 10 ns;
	 
	 inA <= '1';
	 inB <= '1';
	 Cin <= '0';
	 wait for 10 ns;
	 
	 inA <= '0';
	 inB <= '0';
	 Cin <= '1';
	 wait for 10 ns;
	 
	 inA <= '1';
	 inB <= '0';
	 Cin <= '1';
	 wait for 10 ns;
	 
	 inA <= '0';
	 inB <= '1';
	 Cin <= '1';
	 wait for 10 ns;
	 
	 inA <= '1';
	 inB <= '1';
	 Cin <= '1';
	 wait for 10 ns;
 
 end process;
 
END;