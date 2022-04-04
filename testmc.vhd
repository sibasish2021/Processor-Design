-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Mytypes.all;

entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

signal clock: std_logic;
-- DUT component
component multi_cycle_processor is
port(
  clock: in std_logic;
  );
end component;



begin

  -- Connect DUT
   DUT:multi_cycle_processor port map(clock);
  process
  begin
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
   
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
   
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
   
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
   
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
    clock<='1';
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
   
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
--     clock<='1';
--     wait for 5 ns;
--     clock<='0';
--     wait for 5 ns;
    
    
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
