.include "65nm.pm"
.include "settings.inc"
.include "sizing.inc"
.option post=2 probe ingold=2 numdgt=8 measdgt=8
.option runlvl=5 delmax=1p
.temp 27
VDD vdd 0 'VSUP'
VCLK clk 0 PULSE(0 'VSUP' 2n 'TRISE' 'TFALL' 'TPER/2-TRISE' 'TPER')
VREFP vrefp 0 'VCM'
VREFN vrefn 0 'VCM'
CLP outp 0 'CLOAD'
CLN outn 0 'CLOAD'
.include "core.inc"
.probe tran V(clk) V(vinp) V(vinn) V(vrefp) V(vrefn)
+ V(outp) V(outn) V(nl) V(nr) V(sl) V(sr) V(tail) I(VDD)
