----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2020 01:39:52 AM
-- Design Name: 
-- Module Name: Datapath_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Datapath_tb is
--  Port ( );
end Datapath_tb;

architecture Behavioral of Datapath_tb is

constant ClockPeriod : time := 20 ns;

signal clock : STD_LOGIC := '1';
signal Reset : STD_LOGIC;
signal Dout : STD_LOGIC_VECTOR ( 31 downto 0 );
signal PCout : STD_LOGIC_VECTOR ( 31 downto 0 );

component Datapath_wrapper is
    port(
        clock : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
        PCout : out STD_LOGIC_VECTOR ( 31 downto 0 )
    );
end component Datapath_wrapper;

begin
DUT: Datapath_wrapper
    port map(
        clock => clock,
        Reset => Reset,
        Dout => Dout,
        PCout => PCout
    );

clock <= not clock after ClockPeriod/2;

sim_proc: process
begin
-- set Datapath to a known state
Reset <= '1';

wait for 20 ns;
Reset <= '0';

wait for 600 ns;

wait;
end process;

end Behavioral;
