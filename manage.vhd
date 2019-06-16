library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity manage is
	port(
		i_clk40 : in STD_LOGIC;
		rst : in STD_LOGIC;
		Dipswitch2 : in STD_LOGIC_vector(1 downto 0);
		PushButton4: in STD_LOGIC_vector(3 downto 0);
		HS: out STD_LOGIC;
		VS: out STD_LOGIC;
		o_color : out STD_LOGIC_VECTOR(9 downto 0)
	);
end manage;

architecture Behavioral of manage is
--/-------------------------------------------------------------------------VGA component -----------------------------------------------------------/
component VGA1
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
		posx2: integer := 50;
		posx3: integer := 100;
		posy1: integer := 0;
		posy2: integer := 50;
		posy3: integer := 100;
		
		height1 : integer :=50;
		height2 : integer :=10;
		height3 : integer :=10;
		
		width1 : integer :=50;
		width2: integer :=10;
		width3 : integer :=10
		
	);
	port(
		i_clk40 : in STD_LOGIC;
		HS : out STD_LOGIC;
		VS: out STD_LOGIC;
		o_color : out STD_LOGIC_VECTOR(9 downto 0 )
	);	
	end component ;
--/-------------------------------------------------------------------------DCM component -----------------------------------------------------------/
	COMPONENT myDCM
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKDV_OUT : OUT std_logic;
		CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;
--/-----------------------------------------------------------------------------------------------------------------------------------------------------/

signal clk40 : STD_LOGIC;
signal clk75 : STD_LOGIC;
signal clk20 : STD_LOGIC;
signal hs1 , vs1 , hs2 , vs2 : std_logic :='0' ;
signal color1 ,color2 : std_logic_vector(9 downto 0 ); 

begin
--/++++++++++++++++++++++++++++++++++++++++ DCM_instance ++++++++++++++++++++++++++++++++++/

	Inst_myDCM: myDCM 
		PORT MAP(
			CLKIN_IN => i_clk40,
			RST_IN => rst,
			CLKDV_OUT => clk20 ,
			CLKFX_OUT => clk75 ,
			CLKIN_IBUFG_OUT =>open ,
			CLK0_OUT => clk40 ,
			LOCKED_OUT => open 
		);

--/++++++++++++++++++++++++++++++++++++++++ VGA_1_instance ++++++++++++++++++++++++++++++++++/

	Inst_myVGA1 : VGA1
	generic map(
		h_sp =>128,
		h_bp => 88,
		h_va => 800,
		h_fp => 40,
		v_sp => 4,
		v_bp => 23,
		v_va => 600,
		v_fp => 1,
		
		posx1 => 0,
		posx2 => 50,
		posx3=> 100,
		posy1=> 0,
		posy2=> 50,
		posy3=> 100,
		
		height1 =>10,
		height2 =>10,
		height3 =>10,
		
		width1 =>10,
		width2=>10,
		width3 =>10
	)
	port map(
		i_clk40 => clk40,
		HS => hs1,
		VS=> vs1,
		o_color => color1
	);
	
--/++++++++++++++++++++++++++++++++++++++++ VGA_2_instance ++++++++++++++++++++++++++++++++++/

Inst_myVGA2 : VGA1
	generic map(
		h_sp =>128,
		h_bp => 88,
		h_va => 800,
		h_fp => 40,
		v_sp => 4,
		v_bp => 23,
		v_va => 600,
		v_fp => 1,
		
		posx1 => 0,
		posx2 => 50,
		posx3=> 100,
		posy1=> 0,
		posy2=> 50,
		posy3=> 100,
		
		height1 =>10,
		height2 =>10,
		height3 =>10,
		
		width1 =>10,
		width2=>10,
		width3 =>10
		)
	port map(
		i_clk40 => clk75,
		HS=> hs2,
		VS=> vs2,
		o_color => color2
	);
	
--/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

HS <= hs1  when Dipswitch2= "00" else hs2;
VS <=  vs1 when Dipswitch2= "00"  else vs2;
o_color <= color1 when(Dipswitch2= "00")  else color2;

end Behavioral;


