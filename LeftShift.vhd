----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2020 07:46:52 PM
-- Design Name: 
-- Module Name: LeftShift - Behavioral
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

entity LeftShift is
    port(   Din : in STD_LOGIC_VECTOR ( 31 downto 0 );
            Dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
    );
end LeftShift;

architecture Behavioral of LeftShift is
begin
    Dout(31 downto 2) <= Din(29 downto 0);
    Dout(1 downto 0) <= "00";
end Behavioral;
