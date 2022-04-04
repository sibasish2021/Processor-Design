library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyTypes.all;
use IEEE.NUMERIC_STD.ALL;
entity Decoder is
Port (
instruction : in word;
instr_class : out instr_class_type;
operation : out std_logic_vector(3 downto 0);
DP_subclass : out DP_subclass_type;
DP_operand_src : out DP_operand_src_type;
load_store : out load_store_type;
S_bit:out std_logic;
condition:out std_logic_vector(3 downto 0);
DT_offset_sign : out DT_offset_sign_type;
shift : out Shift_type;
shift_src : out Shift_operand_src;
multiply: out ML_subclass_type
);
end Decoder;
architecture Behavioral of Decoder is
type oparraytype is array (0 to 15) of optype;
constant oparray : oparraytype :=
(andop, eor, sub, rsb, add, adc, sbc, rsc,
tst, teq, cmp, cmn, orr, mov, bic, mvn);
begin
with instruction (27 downto 26) select
instr_class <= DP when "00",
DT when "01",
BRN when "10",
none when others;
operation <= (std_logic_vector(unsigned (
instruction (24 downto 21))));
with instruction (24 downto 22) select
DP_subclass <= arith when "001" | "010" | "011",
logic when "000" | "110" | "111",
comp when "101",
test when others;
DP_operand_src <= reg when instruction (25) = '0' else imm;

S_bit<=instruction(20);
condition<=instruction(31 downto 28);

load_store <= load when instruction (20) = '1' else store;
DT_offset_sign <= plus when instruction (23) = '1' else
minus;

with instruction(6 downto 5) select
shift<=LSL when "00" ,
LSR when "01" ,
ASR when "10" ,
RORT when "11" ,
none when others;

with instruction(4) select
shift_src<=reg when '1',
imm when '0',
none when others ;

with instruction(23 downto 21) select
multiply<=mul when "000",
mla when "001",
smull when "110",
umull when "100",
smlal when "111",
umlal when "101",
none when others;
end Behavioral;