-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
--use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity Shifter is
port(
  shift_amount: in std_logic_vector(31 downto 0);
  datain : in std_logic_vector(31 downto 0);
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
);
end Shifter; 

architecture Shifterbeh of Shifter is
signal  dataout1: std_logic_vector(31 downto 0);
signal  dataout2: std_logic_vector(31 downto 0);
signal  dataout3: std_logic_vector(31 downto 0);
signal  dataout4: std_logic_vector(31 downto 0);
signal  dataout5: std_logic_vector(31 downto 0);
signal  dataout6: std_logic_vector(31 downto 0);
signal  dataout7: std_logic_vector(31 downto 0);
signal  dataout8: std_logic_vector(31 downto 0);
signal  dataout_final1: std_logic_vector(31 downto 0);
signal  dataout_final2: std_logic_vector(31 downto 0);
signal  cout1: std_logic;
signal  cout2: std_logic;
signal  cout3: std_logic;
signal  cout4: std_logic;
signal  cout5: std_logic;
signal  cout6: std_logic;
signal  cout7: std_logic;
signal  cout8: std_logic;
signal  cout_final1: std_logic;
signal  cout_final2: std_logic;
signal  cin:std_logic :='0';

-- DUT component
component leftshift1 is
port(
  select1: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component leftshift2 is
port(
  select2: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component leftshift4 is
port(
  select4: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component leftshift8 is
port(
  select8: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component leftshift16 is
port(
  select16: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component rightshift1 is
port(
  select1: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component rightshift2 is
port(
  select2: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component rightshift4 is
port(
  select4: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component rightshift8 is
port(
  select8: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

component rightshift16 is
port(
  select16: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end component;

begin

  -- Connect DUT
  LS1:leftshift1 port map( shift_amount(0) , datain, cin, cout1 , dataout1);
  LS2:leftshift2 port map( shift_amount(1) , dataout1, cout1, cout2 , dataout2);
  LS3:leftshift4 port map( shift_amount(2) , dataout2, cout2, cout3 , dataout3);
  LS4:leftshift8 port map( shift_amount(3) , dataout3, cout3, cout4 , dataout4);
  LS5:leftshift16 port map( shift_amount(4) , dataout4, cout4, cout_final1 , dataout_final1);
  RS1:rightshift1 port map(shift_amount(0) , datain, cin,shtype, cout5 , dataout5);
  RS2:rightshift2 port map( shift_amount(1) , dataout5, cout5,shtype, cout6 , dataout6);
  RS3:rightshift4 port map( shift_amount(2) , dataout6, cout6,shtype, cout7 , dataout7);
  RS4:rightshift8 port map( shift_amount(3) , dataout7, cout7,shtype, cout8 , dataout8);
  RS5:rightshift16 port map( shift_amount(4) , dataout8, cout8,shtype, cout_final2 , dataout_final2);
  
  with shtype select
   dataout<=dataout_final1 when LSL,
   dataout_final2 when others;
   
  with shtype select
   cout<=cout_final1 when LSL,
   cout_final2 when others;
   
end Shifterbeh;
