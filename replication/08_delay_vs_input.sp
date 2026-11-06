* Input-difference sensitivity at selected sizing
.include "common.inc"
.include "functional_inputs.inc"
.include "functional_measure.inc"
.data DIFF_GRID VDIFF
1m
2m
5m
10m
20m
50m
100m
.enddata DIFF_GRID
.tran 1p 80n SWEEP DATA=DIFF_GRID
.end
