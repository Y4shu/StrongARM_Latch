.measure tran case_number PARAM='CASE_ID'
.measure tran supply_v PARAM='VSUP'
.measure tran commonmode_v PARAM='VCM'
.measure tran input_delta_v PARAM='VDIFF'
.measure tran td_high TRIG V(clk) VAL='VSUP/2' TD=11n RISE=1
+ TARG V(outn) VAL='VSUP/2' TD=12n FALL=1
.measure tran td_low TRIG V(clk) VAL='VSUP/2' TD=21n RISE=1
+ TARG V(outp) VAL='VSUP/2' TD=22n FALL=1
.measure tran reset_high TRIG V(clk) VAL='VSUP/2' TD=16n FALL=1
+ TARG V(outn) VAL='VSUP/2' TD=17n RISE=1
.measure tran reset_low TRIG V(clk) VAL='VSUP/2' TD=26n FALL=1
+ TARG V(outp) VAL='VSUP/2' TD=27n RISE=1
.measure tran avg_high PARAM='(td_high+reset_high)/2'
.measure tran avg_low PARAM='(td_low+reset_low)/2'
.measure tran iavg AVG I(VDD) FROM=10n TO=70n
.measure tran pavg PARAM='-VSUP*iavg'
.measure tran pdp_check PARAM='pavg*avg_high'
.measure tran energy_cycle PARAM='pavg*TPER'
.measure tran outp_at16 FIND V(outp) AT=16n
.measure tran outn_at16 FIND V(outn) AT=16n
.measure tran outp_at19 FIND V(outp) AT=19n
.measure tran outn_at19 FIND V(outn) AT=19n
.measure tran outp_at26 FIND V(outp) AT=26n
.measure tran outn_at26 FIND V(outn) AT=26n
.measure tran outp_at29 FIND V(outp) AT=29n
.measure tran outn_at29 FIND V(outn) AT=29n
.measure tran outp_at46 FIND V(outp) AT=46n
.measure tran outn_at46 FIND V(outn) AT=46n
.measure tran outp_at66 FIND V(outp) AT=66n
.measure tran outn_at66 FIND V(outn) AT=66n
