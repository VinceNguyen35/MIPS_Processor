----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2020 11:32:58 PM
-- Design Name: 
-- Module Name: ALUControlUnit - Behavioral
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

entity PC is
    port(   clock : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
            Dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
    );
end PC;

architecture Behavioral of PC is
begin
    process(clock, Reset)
    begin
        if(Reset = '1') then
            Dout <= x"0000_0000";
        else    if rising_edge(clock) then
                    Dout <= Din;
                end if;
        end if;
    end process;
end Behavioral;
