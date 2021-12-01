
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
    Port (A, B     : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUCntl  : in  STD_LOGIC_VECTOR (3 downto 0);
          Carryin  : in  STD_LOGIC;
          ALUOut   : out  STD_LOGIC_VECTOR (31 downto 0);
          Zero     : out  STD_LOGIC;
          Carryout : out std_logic;
          Overflow : out  STD_LOGIC);
end ALU; 


architecture Behavioral of ALU is
signal ALU_Result : std_logic_vector (31 downto 0);
signal add_result,sub_result,a32,b32: std_logic_vector(32 downto 0);
signal c32: std_logic_vector(32 downto 0):=(others=>'0');
signal add_ov,sub_ov:std_logic;

begin
   ALU_Result <=add_result(31 downto 0) when ALUCntl = "0010" else --Add
                sub_result(31 downto 0) when ALUCntl = "0110" else --sub
                A AND B when ALUCntl = "0000" else
                A OR  B when ALUCntl = "0001" else
                A XOR B when ALUCntl = "0011" else
                A NOR B when ALUCntl = "1100" else
                x"0000_0001" when ALUCntl = "0111" and sub_result(32) = '1' else
                x"0000_0000" when ALUCntl = "0111" and sub_result(32) = '0' else
                A;---condition for all other alu control signals
ALUOut  <= ALU_Result; 
----Addition Operation and carry out generation-----	
   a32   <='0'& A;
   b32   <='0'& B;
   c32(0)<=Carryin;
   add_result<=a32 + b32 + c32;
   sub_result<=a32 - b32;
---Zero flag-----------------------------	
   Zero <= '1' when ALU_Result =x"00000000" else '0';
---Overflow flag---------------------------------------
   add_ov<= (A(31)and B(31)       and (not alu_result(31))) or ((not A(31))and (not B(31)) and alu_result(31));
   sub_ov<= (A(31)and (not B(31)) and (not alu_result(31))) or ((not A(31))and B(31)       and alu_result(31)); 
   with ALUCntl select
      Overflow<= add_ov when "0010",
                 sub_ov when "0110",
                 'Z' when others;
---Carryout-------------------------------------------------
  With ALUCntl select 
     Carryout<= add_result(32) when "0010",
                sub_result(32) when "0110",
                'Z' when others;
end Behavioral;

