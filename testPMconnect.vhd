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
signal clock:std_logic:='1';
signal  Rout: std_logic_vector(31 downto 0);
signal  Mout: std_logic_vector(31 downto 0);
signal  instruction:  std_logic_vector(31 downto 0);
signal  control_state:  std_logic_vector( 3 downto 0);
signal  adr:  std_logic_vector(1 downto 0);
signal  MW:  std_logic_vector( 3 downto 0);
signal  Rin: std_logic_vector(31 downto 0);
signal  Min: std_logic_vector(31 downto 0);
-- DUT component
component PMconnect is
port(
  Rout:in std_logic_vector(31 downto 0);
  Mout:in std_logic_vector(31 downto 0);
  instruction: in std_logic_vector(31 downto 0);
  control_state: in std_logic_vector( 3 downto 0);
  adr: in std_logic_vector(1 downto 0);
  MW: out std_logic_vector( 3 downto 0);
  Rin:out std_logic_vector(31 downto 0);
  Min:out std_logic_vector(31 downto 0)
  );
end component;



begin

  -- Connect DUT
   DUT:PMconnect port map(Rout,Mout,instruction,control_state,adr,MW,Rin,Min);
  process
  begin
  -- Test cases for Logical shift left
    Rout<="00000000000000000000000000001000";
    Mout<="00000000000000000000000000001100";
    instruction<=X"E5921000";
    control_state<="0100";
    adr<="00";
  	wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    control_state<="0101";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    Rout<="00000010000001000000100000001000";
    Mout<="00000000000000000000000000001100";
    control_state<="0100";
    instruction<=X"E5932000";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    instruction<=X"E1D210B0";
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    wait for 5 ns;
    clock<='0';
    wait for 5 ns;
    clock<='1';
    
    wait for 5 ns;
    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
