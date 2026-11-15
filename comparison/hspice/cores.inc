* MOS terminal order: D G S B. Same source-bulk convention in both.
.subckt fig4 vinp vinn vrefp vrefn clk outp outn vdd g
M1 nl vinp sl sl nmos W='W_IN' L='LCH'
M2 nr vinn sr sr nmos W='W_IN' L='LCH'
M3 nl vrefn sl sl nmos W='W_IN' L='LCH'
M4 nr vrefp sr sr nmos W='W_IN' L='LCH'
M5 tail clk g g nmos W='W_TAIL' L='LCH'
M6 outn clk vdd vdd pmos W='W_RST' L='LCH'
M7 outp clk vdd vdd pmos W='W_RST' L='LCH'
M8 outn outp vdd vdd pmos W='W_PREG' L='LCH'
M9 outn clk nl nl nmos W='W_CAS' L='LCH'
M10 outp clk nr nr nmos W='W_CAS' L='LCH'
M11 outp outn vdd vdd pmos W='W_PREG' L='LCH'
M12 sl outp tail tail nmos W='W_NREG' L='LCH'
M13 sr outn tail tail nmos W='W_NREG' L='LCH'
.ends fig4

.subckt conventional vinp vinn clk outp outn vdd g
* Conventional StrongARM reference, Razavi (2015) Fig 1(b).
* Left input discharges internal node nleft under Out-.
M1 nleft  vinp tail   tail   nmos W='W_IN'   L='LCH'
M2 nright vinn tail   tail   nmos W='W_IN'   L='LCH'
M3 tail   clk  g      g      nmos W='W_TAIL' L='LCH'
M4 outn   outp nleft  nleft  nmos W='W_NREG' L='LCH'
M5 outp   outn nright nright nmos W='W_NREG' L='LCH'
M6 outn   outp vdd    vdd    pmos W='W_PREG' L='LCH'
M7 outp   outn vdd    vdd    pmos W='W_PREG' L='LCH'
M8 outn   clk  vdd    vdd    pmos W='W_RST'  L='LCH'
M9 outp   clk  vdd    vdd    pmos W='W_RST'  L='LCH'
M10 nleft clk  vdd    vdd    pmos W='W_RST'  L='LCH'
M11 nright clk vdd    vdd    pmos W='W_RST'  L='LCH'
.ends conventional
