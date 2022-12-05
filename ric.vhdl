library ieee;
use ieee.std_logic_1164.all;

entity rec is
	port(	
		clk,reset,d,c,e,EN, set: in std_logic;
        b1,b2,r: out std_logic
		);
		
end rec;

architecture arch of rec is
	
	type state is (A0, B0, C0, D0);
	signal actual_state, next_state : state;
	
	begin
	
	state_register : process(clk, reset, set) -- che cosa ci fa passare da uno stato all'altro
	begin
        if (set = '0') then
            actual_state <= D0;
		elsif(reset ='1') then
			actual_state <= A0;
		else if(rising_edge(clk) and EN = '1') then
			actual_state <= next_state;
			end if;
		end if;
	end process;
	
	next_state_proc : process(d,c,e,actual_state) -- comb 
        begin  
		case actual_state is
			when A0 =>
                    if(c = '1')then
                        next_state <=A0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    elsif(d = '1')then 
                        next_state <=B0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    else
                        next_state <=A0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    end if;
			
            when B0 =>
                    if(c = '1')then
                        next_state <= A0;
                        b1 <= '0';
                        b2 <= '0';
                        r <=  '1';
                    elsif(d = '1')then
                        next_state <= C0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    elsif(e = '1')then
                        next_state <= B0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    else
                        next_state <= B0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    end if;
    
			when C0 =>
                    if(c = '1')then
                        next_state <= A0;
                        b1 <= '0';
                        b2 <= '0';
                        r <=  '1';
                    elsif(d = '1')then 
                        next_state <= D0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    elsif(e = '1')then
                        next_state <= C0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    else
                        next_state <= C0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    end if; 
			
            when D0 =>
                    if(c = '1')then
                        next_state <= A0;
                        b1 <= '0';
                        b2 <= '0';
                        r <=  '1';
                    elsif(d = '1')then
                        if (e = '1') then 
                            next_state <= A0;
                            b1 <= '1';
                            b2 <= '0';
                            r <= '1'; 
                        else 
                            next_state <= A0;
                            b1 <= '0';
                            b2 <= '1';
                            r <= '0';

                        end if;
                    else  
                        next_state <= D0;
                        b1 <= '0';
                        b2 <= '0';
                        r <= '0';
                    end if;
			end case;
	end process; 
     
end arch;