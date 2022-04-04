
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.Mytypes.all;



entity multi_cycle_processor is
  port(
  clock: in std_logic
  );
end multi_cycle_processor;

architecture mcprocessor of multi_cycle_processor is

component Shifter is
port(
  shift_amount: in std_logic_vector(31 downto 0);
  datain : in std_logic_vector(31 downto 0);
  shtype: in Shift_type;
  cout:out std_logic;
  dataout: out std_logic_vector(31 downto 0)
);
end component; 

component fsmcontrol is
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
end component;

component mux32_4 is
port(
r1:in std_logic_vector(31 downto 0);
r2,r3,r4: in std_logic_vector(31 downto 0);
sel : in std_logic_vector(1 downto 0);
output: out std_logic_vector(31 downto 0)
);
end component;

component mux6_2 is
port(
r1:in std_logic_vector(5 downto 0);
r2: in std_logic_vector(5 downto 0);
sel : in std_logic;
output: out std_logic_vector(5 downto 0)
);
end component;

component mux32_2 is
port(
r1:in std_logic_vector(31 downto 0);
r2: in std_logic_vector(31 downto 0);
sel : in std_logic;
output: out std_logic_vector(31 downto 0)
);
end component;

component mux4_2 is
port(
r1:in std_logic_vector(3 downto 0);
r2: in std_logic_vector(3 downto 0);
sel : in std_logic;
output: out std_logic_vector(3 downto 0)
);
end component;



component intermediateregister is
port(
iw:in std_logic;
input: in std_logic_vector(31 downto 0);
clock: in std_logic;
output: out std_logic_vector(31 downto 0)
);
end component;

component ALU is
port(
  a: in std_logic_vector(31 downto 0);
  b: in std_logic_vector(31 downto 0);
  opcode: in std_logic_vector(3 downto 0);
  cin: in std_logic;
  cout:out std_logic;
  q: out std_logic_vector(31 downto 0));
end component;

component RegisterFile is
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
end component;

-- component programmemory is
-- port(
--   read: in std_logic_vector(5 downto 0);
--   --b: in std_logic;
--   output: out std_logic_vector(31 downto 0));
-- end component;

component datamemory is
port(
 address: in std_logic_vector(5 downto 0);
 datain: in std_logic_vector(31 downto 0);
 clock: in std_logic;
 we1: in std_logic;
 we2: in std_logic;
 we3: in std_logic;
 we4: in std_logic;
 output: out std_logic_vector(31 downto 0));
end component;

component programcounter is
port(
reset: in std_logic;
we:in std_logic;
input: in std_logic_vector(31 downto 0);
clock: in std_logic;
output: out std_logic_vector(31 downto 0)
);
end component;

component flagset is
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
Z:out std_logic);
end component;

component conditionchecker is
port(
Zflag: in std_logic;
Nflag: in std_logic;
Cflag: in std_logic;
Vflag: in std_logic;
condition: in std_logic_vector(3 downto 0);
outputeq: out std_logic
);
end component;

component Decoder is
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
end component;

component mux4_4 is
port(
r1:in std_logic_vector(3 downto 0);
r2: in std_logic_vector(3 downto 0);
r3: in std_logic_vector(3 downto 0);
r4 : in std_logic_vector(3 downto 0);
sel : in std_logic_vector(1 downto 0);
output: out std_logic_vector(3 downto 0)
);
end component;

signal conditionout:  std_logic;
signal pw:  std_logic;
signal iw:  std_logic;
signal dw:  std_logic;
signal rw:  std_logic;
signal aw:  std_logic;
signal bw:  std_logic;
signal iord:  std_logic;
signal rsrc:  std_logic_vector(1 downto 0);
signal asrc1: std_logic;
signal asrc2: std_logic_vector(1 downto 0);
signal fset:  std_logic;
signal op:  std_logic_vector(3 downto 0);
signal rew:  std_logic;
signal m2r:  std_logic;
signal resout,aroutput,broutput,droutput,iordoutput: std_logic_vector(31 downto 0);  
signal shiftoutput,Rin: std_logic_vector(31 downto 0);
signal multresact: std_logic_vector(1 downto 0);
signal Z,N,C,V,reset,we,we1,we2,we3,we4,cout,cin,alucout,S_bit:std_logic; 
signal flag:std_logic:='1';
signal dmaddress:std_logic_vector(5 downto 0);
signal pcoutput,pcinput,exoffset,eximm:std_logic_vector(31 downto 0);
signal registerread1,registerread2,registerwrite1,opcode,condition: std_logic_vector(3 downto 0);
signal a,b,registerdatain,registerdataout1,registerdataout2,q,dmdatain1,dmoutput,instruction: std_logic_vector(31 downto 0);
signal instr_class:instr_class_type;
signal DP_subclass:DP_subclass_type;
signal DP_operand_src:DP_operand_src_type;
signal DT_offset_sign:DT_offset_sign_type;
signal sign1: std_logic_vector(19 downto 0):="11111111111111111111";
signal sign0: std_logic_vector(19 downto 0):="00000000000000000000";
signal sign18: std_logic_vector(7 downto 0):="11111111";
signal sign08: std_logic_vector(7 downto 0):="00000000";
signal sign15: std_logic_vector(26 downto 0):="111111111111111111111111111";
signal sign05: std_logic_vector(26 downto 0):="000000000000000000000000000";
signal bit4vector: std_logic_vector(3 downto 0):="0000";
signal four,dmread: std_logic_vector(31 downto 0):="00000000000000000000000000000100";
signal load_store: load_store_type;
signal shiftamount: std_logic_vector(31 downto 0);
signal shtype: Shift_type;
signal shift_src: Shift_operand_src;

begin
componentPC:programcounter port map(reset,pw,q,clock,pcoutput);

componentfsmcontrol:fsmcontrol port map(registerdataout1,droutput,q(1 downto 0),Rin,dmdatain1,clock,instruction,instr_class,load_store,DP_operand_src,DT_offset_sign,flag,shift_src,shtype,multresact,pw,we1,we2,we3,we4,iw,dw,rw,aw,bw,iord,rsrc,asrc1,asrc2,fset,op,rew,m2r);

Iordmultiplexer: mux32_2 port map(pcoutput,dmread,iord,iordoutput);

IR:intermediateregister port map(iw,dmoutput,clock,instruction);

dr:intermediateregister port map(dw,dmoutput,clock,droutput);

ar:intermediateregister port map(aw,registerdataout1,clock,aroutput);

br:intermediateregister port map(bw,registerdataout2,clock,broutput);

res:intermediateregister port map(rew,q,clock,resout);

rsrcmultiplexer:mux4_4 port map(instruction(3 downto 0),instruction(15 downto 12),instruction(11 downto 8),bit4vector, rsrc,registerread2);

multires: mux32_4 port map(sign05 & instruction(11 downto 7),registerdataout2,sign0 & instruction(7 downto 0),four, multresact,shiftamount );

m2rmulti:mux32_2 port map(Rin,resout,m2r,registerdatain);

asrc1multiplexer:mux32_2 port map(pcoutput,aroutput,asrc1,a);

asrc2multiplexer:mux32_4 port map(shiftoutput,four,eximm,exoffset,asrc2,b);

componentdecoder:Decoder port map(instruction,instr_class,opcode,DP_subclass,DP_operand_src,load_store,S_bit,condition, DT_offset_sign,shtype,shift_src);

componentRegister:RegisterFile port map(registerread1,registerread2,instruction(15 downto 12),registerdatain,clock,rw,registerdataout1,registerdataout2);

componentALU:ALU port map(a,b,op,cin,cout,q);

componenetDatamemory: datamemory port map(iordoutput(7 downto 2),dmdatain1,clock,we1,we2,we3,we4,dmoutput);

componentconditionchecker: conditionchecker port map(Z,N,C,V,condition,flag);

componenetflagset:flagset port map(a,b,q,cout,clock,S_bit,instr_class,DP_subclass,N,C,V,Z);

componentShifter: Shifter port map(shiftamount,broutput,shtype,C,shiftoutput);  

process(clock)
begin
	if(rising_edge(clock)) then
    	we1<='0';
        we2<='0';
        we3<='0';
        we4<='0';
        we<='0';
    	reset<='0';
        cin<='0';
        flag<='0';
        if(instruction(24)='0')then
        	dmread<=registerdataout2;
        else
        	dmread<=broutput;
        end if;
        if(instruction(11)='0')then
        	eximm<=sign0 & instruction(11 downto 0);
        end if;
        if(instruction(11)='1')then
        	eximm<=sign1 & instruction(11 downto 0);
        end if;
        
        if(instruction(23)='0')then
        	exoffset<=sign08 & instruction(23 downto 0);
        end if;
        if(instruction(23)='1')then
        	exoffset<=sign18 & instruction(23 downto 0);
        end if;
        --offset<=instruction(23 downto 0);
           
        	
    end if;   
        
         
end process;
end mcprocessor;
