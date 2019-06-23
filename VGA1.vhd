library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity VGA1 is
	generic(
		h_sp : 	integer;
		h_bp: 	integer;
		h_va: 	integer;
		h_fp: 	integer;
		v_sp : 	integer;
		v_bp: 	integer;
		v_va: 	integer;
		v_fp: 		integer
	);
	port(
		i_clk40 : 	in STD_LOGIC;
		HS : 			out STD_LOGIC;
		VS : 			out STD_LOGIC;
		o_color : 	out std_logic_vector(9 downto 0);
		PushButton  : in std_logic_vector(3 downto 0)

	);

end VGA1;

architecture Behavioral of VGA1 is
--/-------------------------------------------------------------------------HSG-----------------------------------------------------------/
component HSG
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
end component;

--/-------------------------------------------------------------------------VSG-----------------------------------------------------------/
component VSG

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
end component ;
--/------------------------------------------------------------------------CG-----------------------------------------------------------/
	
	component CG
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
		XC : IN integer;
		YC: IN integer;
		o_color : out std_logic_vector(9 downto 0);
		clk1per60 : in std_logic;
		PushButton1: in  std_logic_vector(3 downto 0)
	);
	end component;
	
--/-----------------------------------------------------------------------------------------------------------------------------------------/
signal h2c : integer :=0;
signal v2c : integer :=0;
signal hs1 : STD_LOGIC :='0' ;
signal vs1 : STD_LOGIC :='0' ;

begin

--/++++++++++++++++++++++++++++++++HSG_Instance+++++++++++++++++++++++++++++++++/

Inst_HSG: HSG
	generic map(
		v_sp => v_sp,
		v_bp => v_bp,
		v_fp => v_fp,
		v_va => v_va,
		h_sp => h_sp,
		h_bp => h_bp,
		h_fp => h_fp,
		h_va => h_va
	)
	port map(
			i_clk40 => i_clk40,
			HS => hs1,
			XC => h2c
	);

--/++++++++++++++++++++++++++++++++VSG_Instance+++++++++++++++++++++++++++++++++/

Inst_VSG: VSG
	generic map(
		v_sp => v_sp,
		v_bp => v_bp,
		v_fp => v_fp,
		v_va => v_va,
		h_sp => h_sp,
		h_bp => h_bp,
		h_fp => h_fp,
		h_va => h_va
	)
	port map(
			HS => hs1,
			VS => vs1,
			YC => v2c
	);

--/++++++++++++++++++++++++++++++++CG_Instance______+++++++++++++++++++++++++++++++++/

Inst_CG : CG
	generic map(
		h_sp  =>128,
		h_bp => 88,
		h_va => 800,
		h_fp => 40,
		v_sp  =>4,
		v_bp => 23,
		v_va => 600,
		v_fp => 1
	)
	port map(
		XC => h2c,
		YC => v2c,
		o_color => o_color,
		clk1per60 => vs1,
		PushButton1 => PushButton

	);
	
--/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

HS<= hs1;
VS <= vs1;

end Behavioral;

