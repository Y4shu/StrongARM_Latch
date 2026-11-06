* Explicit interpretation: rail-to-rail triangle, 5ns up and 5ns down
.include "common.inc"
VINP vinp 0 PWL(0n 0 5n 'VSUP' 10n 0 15n 'VSUP' 20n 0 25n 'VSUP'
+ 30n 0 35n 'VSUP' 40n 0 45n 'VSUP' 50n 0 55n 'VSUP'
+ 60n 0 65n 'VSUP' 70n 0 75n 'VSUP' 80n 0)
VINN vinn 0 'VCM'
.measure tran case_number PARAM='CASE_ID'
.measure tran iavg AVG I(VDD) FROM=10n TO=70n
.measure tran pavg PARAM='-VSUP*iavg'
.measure tran energy_cycle PARAM='pavg*TPER'
.tran 2p 80n
.end
