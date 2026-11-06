* Deterministic nominal decision boundary; no random mismatch model supplied
.include "common.inc"
.param DV=1m
VINP vinp 0 'VCM+DV'
VINN vinn 0 'VCM'
.measure tran case_number PARAM='CASE_ID'
.measure tran dv_input PARAM='DV'
.measure tran supply_v PARAM='VSUP'
.measure tran op16 FIND V(outp) AT=16n
.measure tran on16 FIND V(outn) AT=16n
.measure tran op26 FIND V(outp) AT=26n
.measure tran on26 FIND V(outn) AT=26n
.tran 2p 30n SWEEP DV -10m 10m 0.5m
.end
