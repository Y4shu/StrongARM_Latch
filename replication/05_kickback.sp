* Kickback: identical 1kohm source resistors, repeat with other driven input
.include "common.inc"
.param SIDE=0 RSOURCE=1k
VINP srcp 0 PWL(0 'VCM+(1-SIDE)*VDIFF' 20n 'VCM+(1-SIDE)*VDIFF'
+ 20.1n 'VCM-(1-SIDE)*VDIFF' 40n 'VCM-(1-SIDE)*VDIFF')
VINN srcn 0 PWL(0 'VCM+SIDE*VDIFF' 20n 'VCM+SIDE*VDIFF'
+ 20.1n 'VCM-SIDE*VDIFF' 40n 'VCM-SIDE*VDIFF')
RINP srcp vinp 'RSOURCE'
RINN srcn vinn 'RSOURCE'
.probe tran V(srcp) V(srcn) V(vinp,srcp) V(vinn,srcn)
.measure tran case_number PARAM='CASE_ID'
.measure tran driven_side PARAM='SIDE'
.measure tran base_p_high FIND V(vinp,srcp) AT=11.9n
.measure tran mx_p_high MAX V(vinp,srcp) FROM=12n TO=12.8n
.measure tran mn_p_high MIN V(vinp,srcp) FROM=12n TO=12.8n
.measure tran kb_p_high PARAM='max(abs(mx_p_high-base_p_high),abs(mn_p_high-base_p_high))'
.measure tran base_p_low FIND V(vinp,srcp) AT=21.9n
.measure tran mx_p_low MAX V(vinp,srcp) FROM=22n TO=22.8n
.measure tran mn_p_low MIN V(vinp,srcp) FROM=22n TO=22.8n
.measure tran kb_p_low PARAM='max(abs(mx_p_low-base_p_low),abs(mn_p_low-base_p_low))'
.measure tran base_n_high FIND V(vinn,srcn) AT=11.9n
.measure tran mx_n_high MAX V(vinn,srcn) FROM=12n TO=12.8n
.measure tran mn_n_high MIN V(vinn,srcn) FROM=12n TO=12.8n
.measure tran kb_n_high PARAM='max(abs(mx_n_high-base_n_high),abs(mn_n_high-base_n_high))'
.measure tran base_n_low FIND V(vinn,srcn) AT=21.9n
.measure tran mx_n_low MAX V(vinn,srcn) FROM=22n TO=22.8n
.measure tran mn_n_low MIN V(vinn,srcn) FROM=22n TO=22.8n
.measure tran kb_n_low PARAM='max(abs(mx_n_low-base_n_low),abs(mn_n_low-base_n_low))'
.tran 1p 40n
.alter repeat_with_negative_input
.param SIDE=1
.end
