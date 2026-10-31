clear
set more off

use provincepanel.dta, clear

eststo clear

//////// Regressions //////////
// How PM2.5 affects the search for PM25
eststo z1: areg search_PM25 pm25 area_sh_urban HHexp AvgAge Pop edush, absorb(province) cluster(province)
eststo z2: areg search_PM25 pm25 area_sh_urban HHexp AvgAge Pop edush i.year i.mo, absorb(province) cluster(province)
eststo z3: xtivreg2 search_PM25 (pm25 = fire_ct_300) area_sh_urban HHexp AvgAge Pop edush, cluster(province) first fe

// How PM2.5 affects the search for air purifiers
eststo z4: areg search_AirP pm25 area_sh_urban HHexp AvgAge Pop edush, absorb(province) cluster(province)
eststo z5: areg search_AirP pm25 area_sh_urban HHexp AvgAge Pop edush i.year i.mo, absorb(province) cluster(province)
eststo z6: xtivreg2 search_AirP (pm25 = fire_ct_300) area_sh_urban HHexp AvgAge Pop edush, cluster(province) first fe

esttab z*, p order(*pm25) star(* .1 ** .05 *** .01) indicate( "Year FE = *.year" "Month FE = *.mo") noomit

log close