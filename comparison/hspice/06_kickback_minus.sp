* Input kickback, drive Vinminus through 1k
* f_=Figure 4 case 2; s_=conventional StrongARM.
.include "65nm.pm"
.include "dimensions.inc"
.include "cores.inc"
.param VSUP=1.1 VCM=0.65 VDIFF=0.10 CLOAD=5f DV=1m
.temp 27
.option post=2 probe runlvl=5 delmax=1p ingold=2 measdgt=8
VDD_F fvdd 0 'VSUP'
VDD_S svdd 0 'VSUP'
VCLK clk 0 PULSE(0 'VSUP' 2n 20p 20p 4.98n 10n)
VREF vref 0 'VCM'
CFP f_p 0 'CLOAD'
CFN f_n 0 'CLOAD'
CSP s_p 0 'CLOAD'
CSN s_n 0 'CLOAD'
VDRVP vinp 0 'VCM'
VDRVN vinn 0 PWL(0 'VCM+VDIFF' 20n 'VCM+VDIFF' 20.1n 'VCM-VDIFF' 40n 'VCM-VDIFF')
Rfp vinp finp 1k
Rfn vinn finn 1k
Rsp vinp sinp 1k
Rsn vinn sinn 1k
XF finp finn vref vref clk f_p f_n fvdd 0 fig4
XS sinp sinn clk s_p s_n svdd 0 conventional
.measure tran f_hi_base FIND V(finn,vinn) AT=11.9n
.measure tran f_hi_max MAX V(finn,vinn) FROM=12n TO=12.8n
.measure tran f_hi_min MIN V(finn,vinn) FROM=12n TO=12.8n
.measure tran f_hi_kb PARAM='max(abs(f_hi_max-f_hi_base),abs(f_hi_min-f_hi_base))'
.measure tran f_lo_base FIND V(finn,vinn) AT=21.9n
.measure tran f_lo_max MAX V(finn,vinn) FROM=22n TO=22.8n
.measure tran f_lo_min MIN V(finn,vinn) FROM=22n TO=22.8n
.measure tran f_lo_kb PARAM='max(abs(f_lo_max-f_lo_base),abs(f_lo_min-f_lo_base))'
.measure tran s_hi_base FIND V(sinn,vinn) AT=11.9n
.measure tran s_hi_max MAX V(sinn,vinn) FROM=12n TO=12.8n
.measure tran s_hi_min MIN V(sinn,vinn) FROM=12n TO=12.8n
.measure tran s_hi_kb PARAM='max(abs(s_hi_max-s_hi_base),abs(s_hi_min-s_hi_base))'
.measure tran s_lo_base FIND V(sinn,vinn) AT=21.9n
.measure tran s_lo_max MAX V(sinn,vinn) FROM=22n TO=22.8n
.measure tran s_lo_min MIN V(sinn,vinn) FROM=22n TO=22.8n
.measure tran s_lo_kb PARAM='max(abs(s_lo_max-s_lo_base),abs(s_lo_min-s_lo_base))'
.tran 1p 40n
.probe tran V(clk) V(vinp) V(vinn) V(vref) V(f_p) V(f_n) V(s_p) V(s_n) I(VDD_F) I(VDD_S) V(finp) V(finn) V(sinp) V(sinn)
.end
