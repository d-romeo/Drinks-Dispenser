-- Testbench per il distributore di bibite
library ieee;
use ieee.std_logic_1164.all;

entity rec_testbench is
end rec_testbench;

architecture testbench of rec_testbench is

	signal d,c,e,clk,reset,b1,b2,r: std_logic;
	signal input_sequenceD : std_logic_vector(0 to 15) := "0111111110111011"; 
    signal input_sequenceC : std_logic_vector(0 to 15) := "1000000000000001";
    signal input_sequenceE : std_logic_vector(0 to 15) := "0000001111111110";
	constant clk_period : time := 50 ns;

	component rec is	
		port(	
			clk,reset,d,c,e: in std_logic;
            b1,b2,r : out std_logic
		);
	end component;

begin

	u1 : rec port map (clk,reset,d,c,e,b1,b2,r);
	
	genclk : process
		begin
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
	end process;
	
	tb : process
		begin
			reset <= '1';
			d <= '0';
			c <= '0';
			e <= '0';

			wait for 5*clk_period/2;
			reset <= '0';
			for i in 0 to 15 loop
				d <= input_sequenceD(i);
                c <= input_sequenceC(i);
                e <= input_sequenceE(i);
				wait for clk_period;
			end loop;
			wait;
	end process;

end testbench;