* Paper Fig 7 / Fig 8 / Fig 9 style slow triangular ramp
.include "common.inc"
.option delmax=10p
VINP vinp 0 PWL(0 0 2.5u 'VSUP' 5u 0)
VINN vinn 0 'VCM'
.measure tran case_number PARAM='CASE_ID'
.measure tran peak_p MAX V(outp) FROM=10n TO=5u
.measure tran peak_n MAX V(outn) FROM=10n TO=5u
.measure tran overshoot_p PARAM='max(0,peak_p-VSUP)'
.measure tran overshoot_n PARAM='max(0,peak_n-VSUP)'
.measure tran overshoot_max PARAM='max(overshoot_p,overshoot_n)'
.tran 10p 5u
.end
