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

entity ControlUnit is
    port(   Din : in STD_LOGIC_VECTOR ( 5 downto 0 );
            RegDst : out STD_LOGIC;
            Branch : out STD_LOGIC;
            MemRead : out STD_LOGIC;
            MemtoReg : out STD_LOGIC;
            ALUOp : out STD_LOGIC_VECTOR ( 2 downto 0 );
            MemWrite : out STD_LOGIC;
            ALUSrc : out STD_LOGIC;
            RegWrite : out STD_LOGIC
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
    process(Din)
    begin
        if(Din = "000000") then -- R type instruction
            RegDst <= '1';
            Branch <= '0';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "000";
            MemWrite <= '0';
            ALUSrc <= '0';
            RegWrite <= '1';
        end if;
        if(Din = "001000") then -- Add Immediate
            RegDst <= '0';
            Branch <= '0';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "001";
            MemWrite <= '0';
            ALUSrc <= '1';
            RegWrite <= '1';
        end if;
        if(Din = "001001") then -- Add Immediate Unsigned
            RegDst <= '0';
            Branch <= '0';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "010";
            MemWrite <= '0';
            ALUSrc <= '1';
            RegWrite <= '1';
        end if;
        if(Din = "001100") then -- And Immediate
            RegDst <= '0';
            Branch <= '0';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "100";
            MemWrite <= '0';
            ALUSrc <= '1';
            RegWrite <= '1';
        end if;
        if(Din = "001101") then -- Or Immediate
            RegDst <= '0';
            Branch <= '0';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "101";
            MemWrite <= '0';
            ALUSrc <= '1';
            RegWrite <= '1';
        end if;
        if(Din = "100011") then -- Load Word
            RegDst <= '0';
            Branch <= '0';
            MemRead <= '1';
            MemtoReg <= '1';
            ALUOp <= "001";
            MemWrite <= '0';
            ALUSrc <= '1';
            RegWrite <= '1';
        end if;
        if(Din = "101011") then -- Store Word
            RegDst <= '0';
            Branch <= '0';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "001";
            MemWrite <= '1';
            ALUSrc <= '1';
            RegWrite <= '0';
        end if;
        if(Din = "000100") then -- Branch On Equal
            RegDst <= '0';
            Branch <= '1';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "011";
            MemWrite <= '0';
            ALUSrc <= '0';
            RegWrite <= '0';
        end if;
        if(Din = "000101") then -- Branch On Not Equal
            RegDst <= '0';
            Branch <= '1';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "011";
            MemWrite <= '0';
            ALUSrc <= '0';
            RegWrite <= '0';
        end if;
        if(Din = "001010") then -- Set Less Than Immediate
            RegDst <= '0';
            Branch <= '0';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "110";
            MemWrite <= '0';
            ALUSrc <= '1';
            RegWrite <= '1';
        end if;
        if(Din = "001011") then -- Set Less Than Immediate Unsigned
            RegDst <= '0';
            Branch <= '0';
            MemRead <= '0';
            MemtoReg <= '0';
            ALUOp <= "111";
            MemWrite <= '0';
            ALUSrc <= '1';
            RegWrite <= '1';
        end if;
    end process;
end Behavioral;
