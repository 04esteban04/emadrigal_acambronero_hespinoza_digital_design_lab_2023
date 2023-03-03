LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Fulladder_4tb IS
END Fulladder_4tb;
 
ARCHITECTURE behavior OF Fulladder_4tb IS
 
-- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT Fulladder_4
PORT(
		inA : IN std_logic_vector(3 downto 0);
		inB : IN std_logic_vector(3 downto 0);
		Cin : IN std_logic;
		Sum4 : OUT std_logic_vector(6 downto 0);
		Cout : OUT std_logic
		);
END COMPONENT;
 
--Inputs
signal inA : std_logic_vector(3 downto 0) := (others => '0');
signal inB : std_logic_vector(3 downto 0) := (others => '0');
signal Cin : std_logic := '0';
 
--Outputs
signal Sum4 : std_logic_vector(6 downto 0);
signal Cout : std_logic;
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: Fulladder_4 PORT MAP (
inA => inA,
inB => inB,
Cin => Cin,
Sum4 => Sum4,
Cout => Cout
);
 
-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 100 ns;
inA <= "0110";
inB <= "1100";
 
wait for 50 ns;
inA <= "1111";
inB <= "1100";
 
wait for 50 ns;
inA <= "0110";
inB <= "0111";
 
wait for 50 ns;
inA <= "1111";
inB <= "1111";
 
wait for 50 ns;
inA <= "1111";
inB <= "1111";
 
wait;
 
end process;
 
END;