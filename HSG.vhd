library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HSG is
	generic(
		h_sp : integer :=128;
		h_bp: integer := 88;
		h_va: integer := 800;
		h_fp: integer := 40;
		v_sp : integer :=4;
		v_bp: integer := 23;
		v_va: integer := 600;
		v_fp: integer := 1
	);
	port(
		i_clk40 : IN STD_LOGIC;
		HS :  OUT STD_LOGIC;
		XC : OUT integer
	);

end HSG;

architecture Behavioral of HSG is

signal cntr :integer :=0;

begin

HS_generator: process(i_clk40)
begin
	if rising_edge(i_clk40) then
		XC <= cntr;
		cntr<=cntr+1;
		
		if ( cntr = h_bp + h_va + h_fp + h_sp  ) then
			cntr <=0;
		end if;
		
		if (cntr< h_sp ) then
			HS<='0';
		else HS<='1';
		end if; 
		
	end if;
end process; 
end Behavioral;

