library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- use IEEE.std_logic_signed.all;
use work.Mytypes.all;

entity mux32_4 is
port(
r1:in std_logic_vector(31 downto 0);
r2,r3,r4: in std_logic_vector(31 downto 0);
sel : in std_logic_vector(1 downto 0);
output: out std_logic_vector(31 downto 0)
);
end mux32_4;
architecture muxbeh of mux32_4 is
begin 
	process(r1,r2,r3,r4,sel) is
    begin
      output<= X"XXXXXXXX";
      if(sel ="00") then 
        output<=r1;
      end if;  
      if(sel="01")then
        output<=r2;
      end if;
      if(sel="10")then
        output<=r3;
      end if;
      if(sel="11")then
        output<=r4;
      end if;
    end process;
end muxbeh;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- use IEEE.std_logic_signed.all;
use work.Mytypes.all;

entity mux32_2 is
port(
r1:in std_logic_vector(31 downto 0);
r2: in std_logic_vector(31 downto 0);
sel : in std_logic;
output: out std_logic_vector(31 downto 0)
);
end mux32_2;
architecture muxbeh of mux32_2 is
begin 
	process(r1,r2,sel) is
    begin
      output<=X"XXXXXXXX";
      if(sel ='0') then 
        output<=r1;
      end if;  
      if(sel='1')then
        output<=r2;
      end if;  
    end process;
end muxbeh;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- use IEEE.std_logic_signed.all;
use work.Mytypes.all;

entity mux6_2 is
port(
r1:in std_logic_vector(5 downto 0);
r2: in std_logic_vector(5 downto 0);
sel : in std_logic;
output: out std_logic_vector(5 downto 0)
);
end mux6_2;
architecture muxbeh of mux6_2 is
begin 
	process(r1,r2,sel) is
    begin
      output<="XXXXXX";
      if(sel ='0') then 
        output<=r1;
      end if;  
      if(sel='1')then
        output<=r2;
      end if;  
    end process;
end muxbeh;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- use IEEE.std_logic_signed.all;
use work.Mytypes.all;

entity mux4_2 is
port(
r1:in std_logic_vector(3 downto 0);
r2: in std_logic_vector(3 downto 0);
sel : in std_logic;
output: out std_logic_vector(3 downto 0)
);
end mux4_2;
architecture muxbeh of mux4_2 is
begin 
	process(r1,r2,sel) is
    begin
      output<="XXXX";
      if(sel ='0') then 
        output<=r1;
      end if;  
      if(sel='1')then
        output<=r2;
      end if;  
    end process;
end muxbeh;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- use IEEE.std_logic_signed.all;
use work.Mytypes.all;

entity mux4_4 is
port(
r1:in std_logic_vector(3 downto 0);
r2: in std_logic_vector(3 downto 0);
r3: in std_logic_vector(3 downto 0);
r4 : in std_logic_vector(3 downto 0);
sel : in std_logic_vector(1 downto 0);
output: out std_logic_vector(3 downto 0)
);
end mux4_4;
architecture muxbeh of mux4_4 is
begin 
	process(r1,r2,r3,r4,sel) is
    begin
      output<="XXXX";
      with sel select
      output<=r1 when "00",
      r2 when "01",
      r3 when "10",
      r4 when others;
    end process;
end muxbeh;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Mytypes.all;

entity fsmcontrol is
port(
Rout:in std_logic_vector(31 downto 0);
Mout:in std_logic_vector(31 downto 0);
adr: in std_logic_vector(1 downto 0);
Rin:out std_logic_vector(31 downto 0);
Min:out std_logic_vector(31 downto 0);
  
clock:in std_logic;
instruction: in std_logic_vector(31 downto 0);
instr_class: in instr_class_type;
load_store: in load_store_type;
DP_operand_src: in DP_operand_src_type;
DT_offset_sign: in DT_offset_sign_type;
conditionout: in std_logic;
shift_src: in Shift_operand_src;
shtype: in Shift_type;
multresact: out std_logic_vector(1 downto 0);
pw: out std_logic;
mw1,mw2, mw3, mw4: out std_logic;
iw: out std_logic;
dw: out std_logic;
rw: out std_logic;
aw: out std_logic;
bw: out std_logic;
iord: out std_logic;
rsrc: out std_logic_vector(1 downto 0);
asrc1: out std_logic;
asrc2: out std_logic_vector(1 downto 0);
fset: out std_logic;
op: out std_logic_vector(3 downto 0);
rew: out std_logic;
m2r: out std_logic
);
end fsmcontrol;

architecture fsmbeh of fsmcontrol is
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
end PMconnect; 
signal state: std_logic_vector(3 downto 0) :="0000";
signal reset:std_logic;
signal MW:std_logic_vector(3 downto 0);
--signal nextstate: std_logic_vector(3 downto 0) :="0000";
begin
DUT: PMconnect port map(Rout,Mout,instruction,state,adr,MW,Rin,Min);
process(clock)
begin

	if(rising_edge(clock)) then
        pw<='0' ;
        mw1<='0';
        mw2<='0';
        mw3<='0';
        mw4<='0';
        --ending<='0';
        iw<='0';
        dw<='0';
        rw<='0';
        aw<='0';
        bw<='0';
        iord<='X';
        rsrc<="XX";
        asrc1<='0';
        asrc2<="XX";
        fset<='0';
        op<="XXXX";
        rew<='0';
        m2r<='0';
        if(reset='1')then
        	state<="0000";
            reset<='0';
        end if;    
    	if(state="0000") then
        	iord<='0';
            asrc1<='0';
            asrc2<="01";
            op<="0100";
            pw<='1';
            state<="0001";
        end if;
        if(state="0001") then
        	iw<='1';
            rsrc<="00";
        	state<="0010";
        end if;
        if(state="0010") then
        	aw<='1';
            bw<='1';
        	if(instr_class=DP) then
            	rsrc<="11";
            	state<="1010";
            end if;
            if(instr_class=DT) then
            	rsrc<="11";
                state<="1100";
            end if;
            if(instr_class=BRN) then
            if(conditionout='1')then
            	asrc1<='0';
                asrc2<="11";
                op<="0010";
                fset<='1';
                pw<='1';
            end if;
            	reset<='1';
            	state<="0101";
            end if;
        end if;
        if(state="1100")then
            if(shtype=RORT)then 
            	multresact<="11";
            else
                if(shift_src = reg) then
                  multresact<="10";
                else
                  multresact<="00";
                end if;
            end if;
            state<="1101";
        end if;
        if(state="1101") then
        	asrc1<='1';
                asrc2<="11";
                rew<='1';
                fset<='1';
                if(DT_offset_sign=plus)then
                	op<="0100";
                end if;
                if(DT_offset_sign=minus)then
                	op<="0010";
                end if;
             state<="0100";   
        end if;        
        if(state="1010")then
        	if(shtype=RORT)then 
            	multresact<="11";
            else
                if(shift_src = reg) then
                  multresact<="10";
                else
                  multresact<="00";
                end if;  
            end if;
            state<="1011";
            
        end if;
        if(state="1011") then
        	asrc1<='1';
                if(DP_operand_src=reg)then
                	asrc2<="00";
                end if;
                if(DP_operand_src=imm)then
                	asrc2<="10";
                end if;
                fset<='1';
                op<=instruction(24 downto 21);
                rew<='1';
                state<="0011";
        end if;        
        if(state="0011") then
            m2r<='0';
            rw<='1';
        	state<="0110";
            reset<='1';
        end if;
        if(state="0100") then
            
        	if(load_store=load) then
            	iord<='1';
                dw<='1';
            	state<="0111";
            end if;
            if(load_store=store) then
            	rsrc<="01";
                bw<='1';
                iord<='1';
                mw1<=MW(0);
                mw2<=MW(1);
                mw3<=MW(2);
                mw4<=MW(3);
                reset<='1';
            	state<="1000";
            end if ;   
        end if;
        if(state="0101") then
        	asrc1<='0';
            asrc2<="01";
            op<="0100";
            fset<='1';
            pw<='1';
        	--state<="0000";
        end if;
        if(state="0111") then
          	m2r<='1';
            rw<='1';
            reset<='1';
        	state<="1001";
        end if;
        if(state="1001") then
            if(instruction(21)='1')then--write back
            	m2r<='0';
                rw<='1';
            end if;
        	--state<="0000";
        end if;
        if(state="1000") then
            if(instruction(21)='1')then--write back
            	m2r<='0';
                rw<='1';
            end if;
        	--state<="0000";
        end if;
        if(state<="0110")then
        	--state<="0000";
        end if;
        if(reset='1')then
        	state<="0000";
        end if;    
    end if;
end process; 
end fsmbeh;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.Mytypes.all;


entity intermediateregister is
port(
iw:in std_logic;
input: in std_logic_vector(31 downto 0);
clock: in std_logic;
output: out std_logic_vector(31 downto 0)
);
end intermediateregister;
architecture irbeh of intermediateregister is
signal data: std_logic_vector(31 downto 0) :="00000000000000000000000000000000";
begin 
	process(clock) is
    begin
    	if(rising_edge(clock)) then
            if(iw='1')then 
            	data<=input;
                output<=input;
            else
            	output<=data;
            end if;    
        end if;
    end process;
end irbeh;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.Mytypes.all;

entity programcounter is
port(
reset: in std_logic;
we:in std_logic;
input: in std_logic_vector(31 downto 0);
clock: in std_logic;
output: out std_logic_vector(31 downto 0)
);
end programcounter;
architecture PCbeh of programcounter is
signal PC: std_logic_vector(31 downto 0) :="00000000000000000000000000000000";
signal add: std_logic_vector(31 downto 0):="00000000000000000000000000000100";
begin 
	process(clock) is
    begin
    	if(rising_edge(clock)) then
            if(we='1')then
              PC<=input;
              output<=input;
            else
              output<=PC;
            end if;
            if(reset='1') then
            	PC<="00000000000000000000000000000000";
            end if; 
        end if;
    end process;
end PCbeh;

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
shift_src : out Shift_operand_src
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

end Behavioral;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.Mytypes.all;

entity flagset is
port(
aluinp1: in std_logic_vector(31 downto 0);
aluinp2: in std_logic_vector(31 downto 0);
aluout: in std_logic_vector(31 downto 0);
alucout: in std_logic;
clock: in std_logic;
S_bit:in std_logic;
instr_class: in instr_class_type;
DP_subclass: in DP_subclass_type;
N:out std_logic;
C:out std_logic;
V:out std_logic;
Z:out std_logic
);
end flagset;
architecture flagbeh of flagset is
begin 
	process(clock) is
    begin
    	if(rising_edge(clock)) then
            if(instr_class= DP) then
              if(DP_subclass=arith) then
                if(S_bit='1') then
                  C<=alucout;
                  if( aluinp1(31)=aluinp2(31)) then
                    V<= aluinp1(31) xor aluout(31);
                  else
                    V<='0';
                  end if;
                  if(aluout(31)='1') then
                    N<='1';
                  else
                    N<='0';
                  end if;
                  if(aluout="00000000000000000000000000000000") then
                    Z<='1';
                  else
                    Z<='0';
                  end if;
                end if;
              end if;
              if(DP_subclass=logic) then
              if(S_bit='1') then
                if(aluout(31)='1') then
                    N<='1';
                else
                    N<='0';
                end if;
                if(aluout="00000000000000000000000000000000") then
                    Z<='1';
                else
                    Z<='0';
                end if;
              end if;
              end if;
              if(DP_subclass=comp) then
                  C<=alucout;
                  if( aluinp1(31)=aluinp2(31)) then
                    V<= aluinp1(31) xor aluout(31);
                  else
                    V<='0';
                  end if;
                  if(aluout(31)='1') then
                    N<='1';
                  else
                    N<='0';
                  end if;
                  if(aluout="00000000000000000000000000000000") then
                    Z<='1';
                  else
                    Z<='0';
                  end if;
              end if;
              if(DP_subclass=test) then
                if(aluout(31)='1') then
                    N<='1';
                  else
                    N<='0';
                  end if;
                  if(aluout="00000000000000000000000000000000") then
                    Z<='1';
                  else
                    Z<='0';
                  end if;
              end if;
            end if;  
        end if;
    end process;
end flagbeh;  

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.Mytypes.all;

entity conditionchecker is
port(
--PC : in std_logic_vector(8 down to 0);
Zflag: in std_logic;
Nflag: in std_logic;
Cflag: in std_logic;
Vflag: in std_logic;
condition: in std_logic_vector(3 downto 0);
outputeq:out std_logic
);
end conditionchecker;
architecture condbeh of conditionchecker is
begin 
	process(Zflag,Nflag , Cflag, Vflag) is
    begin
     if(condition="0000") then
    	if(Zflag='1') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     if(condition="0001") then
    	if(Zflag='0') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     
     if(condition="0010") then
    	if(Cflag='1') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     if(condition="0011") then
    	if(Cflag='0') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     
     if(condition="0100") then 
    	if(Nflag='1') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     if(condition="0101") then
    	if(Nflag='0') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     
     if(condition="0110") then
    	if(Vflag='1') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     if(condition="0111") then
    	if(Vflag='0') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     
     if(condition="1000") then
    	if(Cflag='1' and Zflag='0') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     if(condition="1001") then
    	if(Cflag='0' and Zflag='1') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     
     if(condition="1010") then
    	if(Nflag = Vflag) then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     if(condition="1011") then
    	if(not(Nflag=Vflag)) then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     
     if(condition="1100") then
    	if(Nflag = Vflag and Zflag='0') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     if(condition="1101") then
    	if(not(Nflag=Vflag) or Zflag='1') then
          outputeq<='1';
        else
          outputeq<='0';
        end if;
     end if;
     
     if(condition="1110") then
    	outputeq<='1';
     end if;
     
    end process;
end condbeh;  

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.Mytypes.all;

entity RegisterFile is
port(
  read1: in std_logic_vector(3 downto 0);
  read2: in std_logic_vector(3 downto 0);
  write1: in std_logic_vector(3 downto 0);
  datain: in std_logic_vector(31 downto 0);
  clock: in std_logic;
  --cout:in std_logic;
  we: in std_logic;
  dataout1:out std_logic_vector(31 downto 0);
  dataout2:out std_logic_vector(31 downto 0)
  );
end RegisterFile;

architecture regbeh of RegisterFile is

	type rFile is array(0 to 15) of std_logic_vector(31 downto 0);
    signal registers : rFile;
    signal addr1:integer:=0;
    signal addr2:integer:=0;
    signal addr3:integer:=0;
begin    
	addr1<=conv_integer(read1);
    addr2<=conv_integer(read2);
    addr3<=conv_integer(write1);
	process(read1,read2,clock,we) is
    begin
    	dataout1<=registers(addr1);
        dataout2<=registers(addr2);
        if(rising_edge(clock)) then
        	if(we='1') then
            	registers(addr3)<=datain;
            end if;
        end if;
    end process;
end regbeh;

-- ALU and register file design
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
port(
  a: in std_logic_vector(31 downto 0);
  b: in std_logic_vector(31 downto 0);
  opcode: in std_logic_vector(3 downto 0);
  cin: in std_logic;
  cout:out std_logic;
  q: out std_logic_vector(31 downto 0)
  );
end ALU;

architecture ALUbeh of ALU is
signal v:std_logic_vector(32 downto 0):="000000000000000000000000000000000";
signal zero : std_logic_vector(31 downto 0):="00000000000000000000000000000000";
  signal one : std_logic_vector(31 downto 0):="00000000000000000000000000000001";
begin
  process(a, b, opcode) is
  begin
    if(opcode="0000") then 
    	q<=a and b;
    end if;
    if(opcode="0001")then
    	q<=a xor b;
    end if;    
    if(opcode="0010") then
    	q<=std_logic_vector(signed(a)-signed(b));
    end if;
    if(opcode="0011") then
    	q<=std_logic_vector(signed(b)-signed(a));
    end if;
    if(opcode="0100") then
    	q<=std_logic_vector(signed(a)+signed(b));
    end if;
    if(opcode="0101") then
    	if(cin='1') then
          q<= std_logic_vector(signed(a)+signed(b)+signed(one));
          v<=(('0'& a)+('0'& b)+('0'& one));
          cout<=v(32);
        end if;
        if(cin='0') then
          q<= std_logic_vector(signed(a)+signed(b)+signed(zero));
          v<=(('0'& a)+('0'& b)+('0'& zero));
          cout<=v(32);
        end if;
    end if;
    if(opcode="0110") then
    	if(cin='1') then
          q<= std_logic_vector(signed(a)-signed(b)+signed(one));
          v<=(('0'& a)-('0'& b)+('0'& one));
          cout<=v(32);
        end if;
        if(cin='0') then
          q<= std_logic_vector(signed(a)-signed(b)+signed(zero));
          v<=(('0'& a)-('0'& b)+('0'& zero));
          cout<=v(32);
        end if;
  	end if;
    if(opcode="0111") then
    	if(cin='1') then
          q<= std_logic_vector(signed(b)-signed(a)+signed(one));
          v<=(('0'& b)-('0'& a)+('0'& one));
          cout<=v(32);
        end if;
        if(cin='0') then
          q<= std_logic_vector(signed(b)-signed(a)+signed(zero));
          v<=(('0'& b)-('0'& a)+('0'& zero));
          cout<=v(32);
        end if;
    end if;    
    if(opcode="1000") then
    	q<=a and b;
    end if;
    if(opcode="1001") then
    	q<=a xor b;
    end if;
    if(opcode="1010") then
    	if(signed(a)>signed(b)) then
        	q<="00000000000000000000000000000011";
        end if;
        if(signed(a)<signed(b)) then
        	q<="00000000000000000000000000000000";
        end if;
        if(signed(a)=signed(b)) then
        	q<="00000000000000000000000000000001";
        end if;
 	end if;
    if(opcode="1011") then
    	if(signed(a)+signed(b)>0) then
        	q<="00000000000000000000000000000011";
        end if;
        if(signed(a)+signed(b)<0) then
        	q<="00000000000000000000000000000000";
        end if;
        if(signed(a)+signed(b)=0) then
        	q<="00000000000000000000000000000001";
        end if;
 	end if;
    if(opcode="1100") then
    	q<=a or b;
    end if;
    if(opcode="1101") then
    	q<=a;
    end if;
    if(opcode="1110") then
        q<=a and not(b);
    end if;
    if(opcode="1111") then
    	q<=not a;
    end if;
  end process;
end ALUbeh;



library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.Mytypes.all;

entity datamemory is
port(
 address: in std_logic_vector(5 downto 0);
 datain: in std_logic_vector(31 downto 0);
 clock: in std_logic;
 we1: in std_logic;
 we2: in std_logic;
 we3: in std_logic;
 we4: in std_logic;
 output: out std_logic_vector(31 downto 0)
 );
end datamemory;

architecture dmbeh of datamemory is
	type mFile is array(63 downto 0) of std_logic_vector(31 downto 0);
    signal memory: mFile:=(0 => X"E3A00000",
1 => X"E3A01000",
2 => X"E0800001",
3 => X"E2811001",
4 => X"E3510005",
5 => X"1AFFFFFB",
others => X"00000000");

    signal addr1:integer:=0;
    --signal addr2:integer:=0;
begin
    
	process(address,clock) is
    begin
    	addr1<= conv_integer(address);
--         addr2<= conv_integer(write);
    	output<=memory(addr1);
        if(rising_edge(clock)) then
        	if(we1='1') then
            	memory(addr1)(7 downto 0)<=datain(7 downto 0);
            end if;
            if(we2='1') then
            	memory(addr1)(15 downto 8)<=datain(15 downto 8);
            end if;
            if(we3='1') then
            	memory(addr1)(23 downto 16)<=datain(23 downto 16);
            end if;
            if(we4='1') then
            	memory(addr1)(31 downto 24)<=datain(31 downto 24);
            end if;
        end if;   
    end process;
end dmbeh;