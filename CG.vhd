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
		v_fp: integer := 1
 	);
	port(
		XC : IN integer;
		YC: IN integer;
		o_color : out std_logic_vector(9 downto 0);
		clk1per60 : in std_logic;
		PushButton : in std_logic_vector(3 downto 0)
	);

end CG;

architecture Behavioral of CG is
	--todo wtite signal base on each other
	--todo write length of items as signal seperatly
	signal mid_start_x:	 integer :=	h_sp + h_bp + 400;
	signal mid_end_x:	 integer :=	h_sp + h_bp + 400 + 15;  	   	
	signal mid_start_y:	 integer :=	v_sp + v_bp + 200;
	signal mid_end_y:	 integer :=	v_sp + v_bp + 200 + 15;   		
	signal right_start_x: integer :=	h_sp + h_bp + h_va - 15;
	signal right_end_x:  integer :=	h_sp + h_bp + h_va ;
	signal right_start_y: integer :=	v_sp + v_bp + 100;
	signal right_end_y:	 integer :=	v_sp + v_bp + 300;
	signal left_start_x:    integer :=	h_sp + h_bp;
	signal left_end_x:    integer :=	h_sp + h_bp + 15;
	signal left_start_y:   integer :=	v_sp + v_bp + 100;
	signal left_end_y:	 integer :=	v_sp + v_bp + 300;
	signal toleracket:	 integer :=	300;
	signal v_x	:integer :=	2;
	signal v_y	:integer :=	2;
	signal default_v	:integer :=	2;
	signal cntr 	:integer :=0;
	signal max_v 	:integer :=32;
	signal a :boolean :=false;
	
	begin
	
		process (XC,YC)		--displaying items
				begin 
					if (((XC>mid_start_x and XC<mid_end_x)and(YC>mid_start_y and YC<mid_end_y)) or
					  ((XC>left_start_x and XC<left_end_x)and(YC>left_start_y and YC<(left_start_y+toleracket))) or 
					  ((XC>right_start_x and XC<right_end_x)and(YC>right_start_y and YC<(right_start_y+toleracket)))  )then
					 o_color <= "1111111111" ;
					else
					 o_color <= "0000000000" ;
					end if;
					
		end process;
-- -----------------------------------------------------

		process (clk1per60)	--moving ball
		begin
		
			if rising_edge(clk1per60) then
			-------------------------------------------------------------------------------------- moving ball codes =>
				   mid_start_x <= mid_start_x + v_x;
					mid_end_x  <= mid_end_x + v_x;
					mid_start_y <= mid_start_y + v_y;
					mid_end_y  <= mid_end_y + v_y;
					
					if ( (mid_end_x>right_start_x) and 
							 (mid_start_y >right_start_y) and 
								(mid_end_y < right_start_y +toleracket)  )  then 			--hit right racket
						v_x <= -default_v;
					end if;
					if( (mid_start_x<left_end_x) and 
								(mid_start_y >left_start_y) and 
									(mid_end_y < left_start_y +toleracket)) then 			--hit left racket
						v_x <= default_v;
					end if;
					
					if(mid_start_y = v_sp+v_bp)then		-- hit top
						v_y<= +default_v;
					end if;
					
					if(mid_end_y = v_sp+v_bp+v_va)then	-- hit bottom
						v_y<=-default_v;
					end if;

					if(mid_start_x<h_sp+h_bp)then					-- right scores !
							mid_start_x <= h_sp + h_bp + 400;
							mid_end_x  <= h_sp + h_bp + 400 +15 ;
							mid_start_y <= v_sp + v_bp + 200;
							mid_end_y  <= v_sp + v_bp + 200 +15;
							
							if ( (v_x>-max_v-1) )then
								v_x<= v_x*2;
								v_y <=v_y*2;
							else
									v_x <= 2;
									v_y <= 2;
									default_v <= 2;
							end if;
							
					end if;
					
					if(mid_end_x > h_sp+h_bp+h_va) then			-- left scores !
							mid_start_x <= h_sp + h_bp + 350;
							mid_end_x  <= h_sp + h_bp + 350 +15 ;
							mid_start_y <= v_sp + v_bp + 150;
							mid_end_y  <= v_sp + v_bp + 150 +15; 
							
							if ( (v_x< max_v+1))then
								v_x<= v_x*2;
								v_y <=v_y *2;
							else
									v_x <= 2;
									v_y <= 2;
									default_v <= 2;
							end if;
							
					end if;

	--/------------------------------------------------------------------------------------------------------------ <=
		end if;
	end process;
	-- -----------------------------------------------------

	process (clk1per60)  -- push button check
		begin	
		
		
		
		cntr <= cntr + 1;
		if (19 < cntr) then			-- creating 3htz freqency
			cntr <= 0 ;
			--check pushing keys
			if ( PushButton = "1000" )then
						left_start_y <= left_start_y +10;
						a<=true;
			end if;
			if ( PushButton = "0100" )then
						left_start_y <= left_start_y -10;
			end if;
			if ( PushButton = "0010" )then
						right_start_y <= right_start_y +10;
			end if;
			if ( PushButton = "0001" )then
						right_start_y <= right_start_y -10;
			end if;
			
		end if;
	end process;
	
end Behavioral;


