library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity leftshift1 is
port(
  select1: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end leftshift1;

architecture leftshift1beh of leftshift1 is
signal v0:std_logic:='0';
signal v1:std_logic:='1';
begin
  process(datain , cin ,select1) is
  begin
    if(select1='1') then
    	dataout<=datain(30 downto 0) & v0;
        cout<=datain(31);
    else
    	dataout<=datain;
    	cout<=cin;
    end if;    
  end process;
end leftshift1beh;

-- ALU and register file design
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity leftshift2 is
port(
  select2: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end leftshift2;

architecture leftshift2beh of leftshift2 is
signal v0:std_logic_vector(1 downto 0):="00";
signal v1:std_logic:='1';
begin
  process(datain , cin , select2) is
  begin
    if(select2='1') then
    	dataout<=datain(29 downto 0) & v0;
        cout<=datain(30);
    else
    	dataout<=datain;
    	cout<=cin;
    end if;    
  end process;
end leftshift2beh;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity leftshift4 is
port(
  select4: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end leftshift4;

architecture leftshift4beh of leftshift4 is
signal v0:std_logic_vector(3 downto 0):="0000";
signal v1:std_logic:='1';
begin
  process(datain , cin, select4) is
  begin
    if(select4='1') then
    	dataout<=datain(27 downto 0) & v0;
        cout<=datain(28);
    else
    	dataout<=datain;
    	cout<=cin;
    end if;    
  end process;
end leftshift4beh;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity leftshift8 is
port(
  select8: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end leftshift8;

architecture leftshift8beh of leftshift8 is
signal v0:std_logic_vector(7 downto 0):="00000000";
signal v1:std_logic:='1';
begin
  process(datain , cin, select8) is
  begin
    if(select8='1') then
    	dataout<=datain(23 downto 0) & v0;
        cout<=datain(24);
    else
    	dataout<=datain;
    	cout<=cin;
    end if;    
  end process;
end leftshift8beh;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity leftshift16 is
port(
  select16: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end leftshift16;

architecture leftshift16beh of leftshift16 is
signal v0:std_logic_vector(15 downto 0):="0000000000000000";
signal v1:std_logic:='1';
begin
  process(datain , cin ,select16) is
  begin
    if(select16='1') then
    	dataout<=datain(15 downto 0) & v0;
      cout<=datain(16);
    else
    	dataout<=datain;
    	cout<=cin;
    end if;    
  end process;
end leftshift16beh;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity rightshift1 is
port(
  select1: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end rightshift1;

architecture rightshift1beh of rightshift1 is
signal v0:std_logic;
signal v1:std_logic:='1';

begin
with shtype select
v0<='0' when LSR ,
datain(31) when ASR ,
datain(0) when RORT ,
'X' when others;
    with select1 select
    	dataout<= v0 & datain(31 downto 1) when '1', 
        datain when others;
    with select1 select
    	cout<=datain(0) when '1', 
        cin when others;
end rightshift1beh;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity rightshift2 is
port(
  select2: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end rightshift2;

architecture rightshift2beh of rightshift2 is
signal v0:std_logic_vector(1 downto 0);
signal v1:std_logic_vector(1 downto 0):=(others=>datain(31));

begin
  with shtype select
  v0<=(others=>datain(31)) when ASR ,
  "00" when LSR ,
  datain(1 downto 0) when RORT ,
  "XX" when others;
    with select2 select
    	dataout<= v0 & datain(31 downto 2) when '1', 
        datain when others;
    with select2 select
    	cout<=datain(1) when '1', 
        cin when others;
end rightshift2beh;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity rightshift4 is
port(
  select4: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end rightshift4;

architecture rightshift4beh of rightshift4 is
signal v0:std_logic_vector(3 downto 0);
signal v1:std_logic:='1';

begin
with shtype select
v0<=(others=>datain(31)) when ASR ,
"0000" when LSR ,
datain(3 downto 0) when RORT ,
"XXXX" when others;
    with select4 select
    	dataout<= v0 & datain(31 downto 4) when '1', 
        datain when others;
    with select4 select
    	cout<=datain(3) when '1', 
        cin when others;

end rightshift4beh;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity rightshift8 is
port(
  select8: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end rightshift8;

architecture rightshift8beh of rightshift8 is
signal v0:std_logic_vector(7 downto 0);
signal v1:std_logic:='1';
begin
with shtype select
v0<=(others=>datain(31)) when ASR ,
"00000000" when LSR ,
datain(7 downto 0) when RORT ,
"XXXXXXXX" when others;

    with select8 select
    	dataout<= v0 & datain(31 downto 8) when '1', 
        datain when others;
    with select8 select
    	cout<=datain(7) when '1', 
        cin when others;

end rightshift8beh;

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;
entity rightshift16 is
port(
  select16: in std_logic;
  datain : in std_logic_vector(31 downto 0);
  cin:in std_logic ;
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
  );
end rightshift16;

architecture rightshift16beh of rightshift16 is
signal v0:std_logic_vector(15 downto 0);
signal v1:std_logic:='1';
begin

with shtype select
v0<=(others=>datain(31)) when ASR ,
"0000000000000000" when LSR ,
datain(15 downto 0) when RORT ,
X"XXXX" when others;
    with select16 select
    	dataout<= v0 & datain(31 downto 16) when '1', 
        datain when others;
    with select16 select
    	cout<=datain(15) when '1', 
        cin when others;

end rightshift16beh;