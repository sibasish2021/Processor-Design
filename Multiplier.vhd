library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;
use work.MyTypes.all;

entity Multiplier is
port(
  op1: in std_logic_vector(31 downto 0);
  op2: in std_logic_vector(31 downto 0);
  op3: in std_logic_vector(31 downto 0);
  instr: in ML_subclass_type;
  instruction: ini std_logic_vector(31 downto 0);
  result32: out std_logic_vector(31 downto 0);
  result64: out std_logic_vector(63 downto 0)
);
end MUltiplier; 

architecture Multiplierbeh of Multiplier is
signal p_s: std_logic_vector(65 downto 0);
signal r32: std_logic_vector(63 downto 0);
signal x1, x2: std_logic;
signal zero: std_logic_vector(33 downto 0):="00"&X"00000000";
signal one : std_logic_vector(33 downto 0):="11"&X"FFFFFFFF";
signal exadd: std_logic_vector(65 downto 0);
signal concat0: std_logic_vector(65 downto 0);
signal concat1: std_logic_vector(65 downto 0);
signal s1: std_logic_vector(32 downto 0);
signal s2: std_logic_vector(32 downto 0);
signal s3: std_logic_vector(65 downto 0);
begin
  r32<=op1*op2;
  with instr select
  result32<=r32(31 downto 0) when mul,
  r32(31 downto 0)+op3 when mla,
  X"XXXXXXXX" when others;
  concat0<=zero & op3;
  concat1<=one & op3;
  
  exadd<=concat0 when op3(31)='0' else concat1;
  
  with instruction(20) select
  x1<=op1(31) when '1',
  '0' when '0',
  'X' when others;
  
  with instruction(20) select
  x2<=op2(31) when '1',
  '0' when '0',
  'X' when others;
  
  s1<=(x1 & op1);
  s2<=(x2 & op2);
  s3<=std_logic_vector(signed(s1)*signed(s2));
  p_s<=s3+exadd when instruction(21)='1' else s3;
  result64 <=p_s(63 downto 0);
  
end Multiplierbeh;
