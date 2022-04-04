-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
--use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is
signal clock: std_logic:='1';
signal  op1: std_logic_vector(31 downto 0):="00000000000000000000000000001010";
signal  op2: std_logic_vector(31 downto 0):="00000000000000000000000000001010";
signal  op3: std_logic_vector(31 downto 0):="00000000000000000000000000001010";
signal  instruction :  std_logic_vector(31 downto 0):="00000000000000000000000000001010";
signal  instr: ML_subclass_type:=mul;
signal  result32:std_logic_vector(31 downto 0);
signal  result64:std_logic_vector(63 downto 0);
-- DUT component
component Multiplier is
port(
  op1: in std_logic_vector(31 downto 0);
  op2: in std_logic_vector(31 downto 0);
  op3: in std_logic_vector(31 downto 0);
  instr: in ML_subclass_type;
  instruction: ini std_logic_vector(31 downto 0);
  result32: out std_logic_vector(31 downto 0);
  result64: out std_logic_vector(63 downto 0)
  );
end component;



begin

  -- Connect DUT
   DUT:Multiplier port map(op1,op2,op3,instr,instruction,result32,result64);
  process
  begin
  	report "Test 1 done";
    op1<="00000000000000000000000000001010";
    op2<="00000000000000000000000000001011";
    op3<="00000000000000000000000000001110";
    --report "Test 2 done";
    instruction(20)<='1';
    instr<=mul;
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    --report "Test 3 done";
    instruction(20)<='1';
    instr<=mla;
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    instr<=smull;
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    instr<=umull;
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    instr<=smlal;
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    instr<=umlal;
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    wait for 5 ns;
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
