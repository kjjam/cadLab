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
signal MXF:integer:=h_sp + h_bp+400;   
signal MYF:integer:=v_sp + v_bp+200; 
signal MXE:integer:=h_sp + h_bp +30+400;  
signal MYE:integer:=v_sp + v_bp +30 +200 ;  
signal RXF :integer:= h_sp + h_bp + h_va -25;
signal RXE :integer:= h_sp + h_bp + h_va ;
signal RYF :integer:= v_sp + v_bp +100;
signal RYE :integer:= v_sp + v_bp +300;
signal LXF :integer:= h_sp+ h_bp;
signal LXE :integer:= h_sp +h_bp + 25;
signal LYF :integer:= v_sp + v_bp +100;
signal LYE :integer:= v_sp + v_bp +300;
signal toleracket:integer:= 300;

begin
	process (XC,YC)
			begin 
				if (((XC>MXF and XC<MXE)and(YC>MYF and YC<MYE)) or
				  ((XC>LXF and XC<LXE)and(YC>LYF and YC<(LYF+toleracket))) or 
				  ((XC>RXF and XC<RXE)and(YC>RYF and YC<(RYF+toleracket)))  )then
				 o_color <= "1111111111" ;
				else
				 o_color <= "0000000000" ;
   end if;
 end process;
	
--   o_color <= "1111111111" when (XC<500)  else
--             "0000000000";


	process (clk1per60)
	begin
		if rising_edge(clk1per60) then
			s_posx1<=s_posx1 + 1;
--			if (s_posx1 > h_va)then
--				s_posx1 <= 0;
--			end if;
		end if;
	end process;
	
end Behavioral;


