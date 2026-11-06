* Constant positive input: paper-style comparison/reset average delay
.include "common.inc"
VINP vinp 0 'VCM+VDIFF'
VINN vinn 0 'VCM'
.measure tran case_number PARAM='CASE_ID'
.measure tran td_cmp TRIG V(clk) VAL='VSUP/2' TD=11n RISE=1
+ TARG V(outn) VAL='VSUP/2' TD=12n FALL=1
.measure tran td_rst TRIG V(clk) VAL='VSUP/2' TD=16n FALL=1
+ TARG V(outn) VAL='VSUP/2' TD=17n RISE=1
.measure tran delay_avg PARAM='(td_cmp+td_rst)/2'
.tran 1p 30n
.end
