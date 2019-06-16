library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CG is
	generic(
	
		h_sp : integer :=128;
		h_bp: integer := 88;
		h_va: integer := 800;
		h_fp: integer := 40;
		v_sp : integer :=4;
		v_bp: integer := 23;
		v_va: integer := 600;
		v_fp: integer := 1;
		
		posx1: integer := 0;
		posx2: integer := 0;
		posx3: integer := 0;
		posy1: integer := 0;
		posy2: integer := 0;
		posy3: integer := 0;
		
		height1 : integer :=0;
		height2 : integer :=0;
		height3 : integer :=0;
		
		width1 : integer :=0;
		width2: integer :=0;
		width3 : integer :=0;
		
		speedx1: integer := 0;
		speedx2: integer := 0;
		speedx3: integer := 0;
		
		speedy1: integer := 0;
		speedy2: integer := 0;
		speedy3: integer := 0;
		
		screenVisibleWidth: integer := 0;
		screenVisibleHeight: integer := 0
 	);
	port(
		XC : IN integer;
		YC: IN integer;
		o_color : out std_logic_vector(9 downto 0);
		clk1per60 : in std_logic
	);

end CG;

architecture Behavioral of CG is
signal s_posx1 : integer := posx1; 
signal s_posy1 : integer := posy1; 
signal x,y : integer;

begin
--	x <= XC - ( h_sp + h_bp);
--	y <= YC - ( v_sp + v_bp);
--	process (XC,YC)
--	begin
--			if(x >= 0 and x < h_va and y >=0 and y < v_va)then
--				if (x >= s_posx1 and x < s_posx1 + width1 and y >= s_posy1 and y< s_posy1+height1 ) then
--					o_color <= "1111111111";
--				end if;
--			else o_color <="0000000000";
--		end if;
--	end process;
   o_color <= "1111111111" when (XC<500)  else
             "0000000000";


--	process (clk1per60)
--	begin
--		if rising_edge(clk1per60) then
--			s_posx1<=s_posx1 + 1;
--			s_posy1<= s_posy1 + 1;
--		end if;
--	end process;
end Behavioral;


