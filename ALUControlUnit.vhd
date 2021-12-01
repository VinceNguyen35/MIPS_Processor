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

entity ALUControlUnit is
    port(   ALUOp : in STD_LOGIC_VECTOR ( 2 downto 0 );
            Din : in STD_LOGIC_VECTOR ( 5 downto 0 );
            Dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
    );
end ALUControlUnit;

architecture Behavioral of ALUControlUnit is
begin
    process(ALUOp, Din)
    begin
        if(ALUOp = "000") then -- R type instruction
             case Din is
                when "100000" => Dout <= "0010"; -- Add
                when "100001" => Dout <= "0010"; -- Add Unsigned
                when "100010" => Dout <= "0110"; -- Subtract
                when "100011" => Dout <= "0110"; -- Subtract Unsigned
                when "100100" => Dout <= "0000"; -- And
                when "100101" => Dout <= "0001"; -- Or
                when "100110" => Dout <= "0011"; -- Xor
                when "100111" => Dout <= "1100"; -- Nor
                when "101010" => Dout <= "0111"; -- Set Less Than
                when "101011" => Dout <= "0111"; -- Set Less Than Unsigned
                when others => Dout <= "1111";
             end case;
        end if;
        if(ALUOp = "001" OR ALUOp = "010") then -- Add Immediate (Unsigned), Load and Store Word
            Dout <= "0010";
        end if;
        if(ALUOp = "011") then -- Branch on (Not) Equal
            Dout <= "0110";
        end if;
        if(ALUOp = "100") then -- And Immediate
            Dout <= "0000";
        end if;
        if(ALUOp = "101") then -- Or Immediate
            Dout <= "0001";
        end if;
        if(ALUOp = "110" OR ALUOp = "111") then -- Set Less Than Immediate (Unsigned)
            Dout <= "0111";
        end if;
    end process;
end Behavioral;
