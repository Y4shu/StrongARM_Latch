* Supplied model / declared width / body-source tied / 27C
.include "65nm.pm"
.option post=2 ingold=2 numdgt=8
.width out=132
.temp 27
.param WCHAR=1u LCHAR=130n VDSCHAR=0.5
VD d 0 'VDSCHAR'
VG g 0 0
MDUT d g 0 0 nmos W='WCHAR' L='LCHAR'
.dc VG 0 1 0.005
.print dc V(g) LX4(MDUT) LX7(MDUT) LX8(MDUT)
.end
