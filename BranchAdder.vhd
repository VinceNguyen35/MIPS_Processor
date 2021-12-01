----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2020 04:47:50 AM
-- Design Name: 
-- Module Name: BranchAdder - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BranchAdder is
    port(   PCADD : in STD_LOGIC_VECTOR ( 31 downto 0 );
            ShiftLeft : in STD_LOGIC_VECTOR ( 31 downto 0 );
            Result : out STD_LOGIC_VECTOR ( 31 downto 0 )
    );
end BranchAdder;

architecture Behavioral of BranchAdder is
begin
    Result <= PCADD + ShiftLeft;
end Behavioral;
