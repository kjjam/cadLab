library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity VSG is
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
		HS : IN STD_LOGIC;
		VS : OUT STD_LOGIC;
		YC : OUT integer 
	);

end VSG;

architecture Behavioral of VSG is

signal cntr :integer :=0;
begin

HS_generator: process(HS)
begin
	if rising_edge(HS) then
		YC <= cntr;
		cntr<=cntr+1;
		
		if ( cntr = v_bp + v_va + v_fp + v_sp  ) then
			cntr <= 0;
		end if;
		
		if (cntr< v_sp ) then
			VS <= '0';
		else VS <= '1';
		
		end if;
	end if;
end process;
end Behavioral;

