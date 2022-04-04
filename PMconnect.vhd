library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.MyTypes.all;

entity PMconnect is
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
end PMconnect; 

architecture PMconnectbeh of PMconnect is
signal a:std_logic_vector(7 downto 0);
signal b: std_logic_vector(7 downto 0);
signal c: std_logic_vector(7 downto 0);
signal d: std_logic_vector(7 downto 0);
begin

  -- Connect DUT 
  process(Rout,Mout,instruction,control_state,adr)
  begin
  a<=(Mout(7)&Mout(7)&Mout(7)&Mout(7)&Mout(7)&Mout(7)&Mout(7)&Mout(7));
  b<=(Mout(15)&Mout(15)&Mout(15)&Mout(15)&Mout(15)&Mout(15)&Mout(15)&Mout(15));
  c<=(Mout(23)&Mout(23)&Mout(23)&Mout(23)&Mout(23)&Mout(23)&Mout(23)&Mout(23));
  d<=(Mout(31)&Mout(31)&Mout(31)&Mout(31)&Mout(31)&Mout(31)&Mout(31)&Mout(31));
  if(control_state="0100")then
  	if(instruction(20)='0') then--store
    	if(instruction(27 downto 26)="01") then--full word or byte
        	if(instruction(20)='1') then--byte transfer
            	Min(31 downto 24)<=Rout(7 downto 0);
                Min(23 downto 16)<=Rout(7 downto 0);
                Min(15 downto 8)<=Rout(7 downto 0);
                Min(7 downto 0)<=Rout(7 downto 0);
                if(adr(1 downto 0)="00")then
                 MW<="0001";
                elsif(adr(1 downto 0)="01")then
                 MW<="0010";
                elsif(adr(1 downto 0)="10") then
                 MW<="0100";
                else
                 MW<="1000";
                end if; 
--                 with adr(1 downto 0) select
--                 MW<="0001" when "00",
--                 "0010" when "01",
--                 "0100" when "10",
--                 "1000" when "11",
--                 "XXXX" when others;
            else-- full word
            	Min(31 downto 0)<=Rout(31 downto 0);
                MW<="1111";
            end if;
        end if;
        if(instruction(6 downto 5)="01") then--STRH instruction
        	Min(31 downto 16)<=Rout(15 downto 0);
            Min(15 downto 0)<=Rout( 15 downto 0);
                if(adr(1 downto 0)="00")then
                 MW<="0011";
                elsif(adr(1 downto 0)="10")then
                 MW<="1100";
                end if;
--             with adr(1 downto 0) select
--                 MW<="0011" when "00",
--                 "1100" when "10",
--                 "XXXX" when others;
        end if;
    else--load
    	if(instruction(27 downto 26)="01") then--full word or byte
        	if(instruction(20)='1') then--byte transfer
            	Rin(31 downto 8)<="000000000000000000000000";
                if(adr(1 downto 0)="00")then
                 Rin(7 downto 0)<=Mout(7 downto 0);
                elsif(adr(1 downto 0)="01")then
                 Rin(7 downto 0)<=Mout(15 downto 8);
                elsif(adr(1 downto 0)="10") then
                 Rin(7 downto 0)<=Mout(23 downto 16);
                else
                 Rin(7 downto 0)<=Mout(31 downto 24);
                end if;
--                 with adr(1 downto 0) select
--                 Rin(7 downto 0)<=Mout(7 downto 0) when "00",
--                 Mout(15 downto 8) when "01",
--                 Mout(23 downto 16) when "10",
--                 Mout(31 downto 24) when "11",
--                 "XXXXXXXX" when others;
            else-- full word
            	Rin(31 downto 0)<=Mout(31 downto 0);
            end if;
        end if;
        if(instruction(6 downto 5)="01") then--LDRH instruction
        	Rin(31 downto 16)<="0000000000000000";
            if(adr(1 downto 0)="00")then
                 Rin(15 downto 0)<=Mout(15 downto 0);
            elsif(adr(1 downto 0)="10")then
                 Rin(15 downto 0)<=Mout(31 downto 16);
            end if;
--             with adr(1 downto 0) select
--                 Rin(15 downto 0)<=Mout(15 downto 0) when "00",
--                 Mout(31 downto 16) when "10",
--                 "XXXXXXXXXXXXXXXX" when others;
        end if;
        if(instruction(6 downto 5)="10") then--LDRSB instruction
        if(adr(1 downto 0)="00")then
            Rin(31 downto 0)<= a & a & a & Mout(7 downto 0);
           elsif(adr(1 downto 0)="01")then
            Rin(31 downto 0)<=b & b & b & Mout(15 downto 8);
           elsif(adr(1 downto 0)="10") then
            Rin(31 downto 0)<=c & c & c & Mout(23 downto 16);
           else
            Rin(31 downto 0)<=d & d & d & Mout(31 downto 24);
           end if;
            -- with adr(1 downto 0) select
            --     Rin(31 downto 0)<=a & a & a & Mout(7 downto 0) when "00",
            --     b & b & b & Mout(15 downto 8) when "01",
            --     c & c & c & Mout(23 downto 16) when "10",
            --     d & d & d & Mout(31 downto 24) when "11",
            --     "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;
        end if;
        if(instruction(6 downto 5)="11") then--LDRSH instruction
            if(adr(1 downto 0)="00")then
                    Rin(31 downto 0)<=b & b & Mout(15 downto 0);
            elsif(adr(1 downto 0)="10")then
                    Rin(31 downto 0)<=d & d & Mout(31 downto 16);
            end if;
            -- with adr(1 downto 0) select
            --     Rin(31 downto 0)<=b & b & Mout(15 downto 0) when "00",
            --     d & d & Mout(31 downto 16) when "10",
            --     "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" when others;
        end if;
    end if;
  end if;
  end process;
end PMconnectbeh;
