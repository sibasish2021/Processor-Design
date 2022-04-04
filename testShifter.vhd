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
signal clock: std_logic;
signal  shift_amount: std_logic_vector(31 downto 0);
signal  datain :  std_logic_vector(31 downto 0);
signal  cout: std_logic;
signal shtype: Shift_type;
signal  dataout:std_logic_vector(31 downto 0);
-- DUT component
component Shifter is
port(
  shift_amount: in std_logic_vector(31 downto 0);
  datain : in std_logic_vector(31 downto 0);
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;



begin

  -- Connect DUT
   DUT:Shifter port map(shift_amount, datain, shtype, cout , dataout);
  process
  begin
  -- Test cases for Logical shift left
  	clock<='1';
    shift_amount<="00000000000000000000000000000011";  
    shtype<=LSL;
    datain<="00000000000000000000000110000001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000000000000000000000101";  
    shtype<=LSL;
    datain<="00000000000000000000000110011001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000000100000000000010011";  
    shtype<=LSL;
    datain<="10000010000001000000000110000001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000111100000000000000111";  
    shtype<=LSL;
    datain<="00000000000001111000000110011001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    -- Test cases for Logical shift right
    clock<='1';
    shift_amount<="00000000000000000000000000000011";  
    shtype<=LSR;
    datain<="00000000000000000000000110000001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000000000000000000000101";  
    shtype<=LSR;
    datain<="00000000000000000000000110011001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000000100000000000010011";  
    shtype<=LSR;
    datain<="10000010000001000000000110000001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000111100000000000000111";  
    shtype<=LSR;
    datain<="00000000000001111000000110011001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    --Test cases for Arithimetic shift right
    clock<='1';
    shift_amount<="00000000000000000000000000000011";  
    shtype<=ASR;
    datain<="00000000000000000000000110000001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000000000000000000000101";  
    shtype<=ASR;
    datain<="00000000000000000000000110011001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000000100000000000010011";  
    shtype<=ASR;
    datain<="10000010000001000000000110000001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000111100000000000000111";  
    shtype<=ASR;
    datain<="00000000000001111000000110011001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    --Test cases for Right rotate
    
    clock<='1';
    shift_amount<="00000000000000000000000000000011";  
    shtype<=RORT;
    datain<="00000000000000000000000110000001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000000000000000000000101";  
    shtype<=RORT;
    datain<="00000000000000000000000110011001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000000100000000000010011";  
    shtype<=RORT;
    datain<="10000010000001000000000110000001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    shift_amount<="00000000000111100000000000000111";  
    shtype<=RORT;
    datain<="00000000000001111000000110011001";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    wait for 5 ns;
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
