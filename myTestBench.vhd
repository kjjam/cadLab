--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:17:35 06/10/2019
-- Design Name:   
-- Module Name:   D:/az_cad/Main-project/myTestBench.vhd
-- Project Name:  Main-project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: manage
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY myTestBench IS
END myTestBench;
 
ARCHITECTURE behavior OF myTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT manage
    PORT(
         i_clk40 : IN  std_logic;
         rst : IN  std_logic;
         Dipswitch2 : IN  std_logic;
         PushButton4 : IN  std_logic;
         HS : OUT  std_logic;
         VS : OUT  std_logic;
         o_color : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_clk40 : std_logic := '0';
   signal rst : std_logic := '0';
   signal Dipswitch2 : std_logic := '0';
   signal PushButton4 : std_logic := '0';

 	--Outputs
   signal HS : std_logic;
   signal VS : std_logic;
   signal o_color : std_logic_vector(9 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: manage PORT MAP (
          i_clk40 => i_clk40,
          rst => rst,
          Dipswitch2 => Dipswitch2,
          PushButton4 => PushButton4,
          HS => HS,
          VS => VS,
          o_color => o_color
        );

   -- Clock process definitions
   clk_process :process
   begin
		i_clk40 <= '0';
		wait for clk_period/2;
		i_clk40 <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
