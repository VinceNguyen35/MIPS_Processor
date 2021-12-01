----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2020 04:20:27 AM
-- Design Name: 
-- Module Name: BranchControl - Behavioral
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

entity BranchControl is
    port(   Din : in STD_LOGIC_VECTOR ( 5 downto 0 );
            Branch : in STD_LOGIC;
            Zero : in STD_LOGIC;
            Dout : out STD_LOGIC
    );
end BranchControl;

architecture Behavioral of BranchControl is
begin
    process(Din, Branch, Zero)
    begin
        if( (Din = "000100" AND Branch = '1' AND Zero = '1') or
            (Din = "000101" AND Branch = '1' AND Zero = '0')) then
                Dout <= '1';
        else
                Dout <= '0';
        end if;
    end process;
end Behavioral;
