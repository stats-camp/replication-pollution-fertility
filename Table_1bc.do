clear
set more off

use womenpanel.dta, clear

gen asset_high = asset_l > 4
gen edu_high = edu > 2

tab b_age, gen(_a)
gen time = year

eststo clear

// FE - Table 1B col. 1 
eststo z0: areg births L.search_PM25 i.b_age c.year, vce(cluster province) absorb(wmid)

// IV - Table 1B col. 2-7 
eststo x0: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time, cluster(province) first fe
eststo x1: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if b_age <= 20, cluster(province) first fe
eststo x2: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if b_age <= 25 & b_age > 20, cluster(province) first fe
eststo x3: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if b_age <= 30 & b_age > 25, cluster(province) first fe
eststo x4: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if b_age <= 35 & b_age > 30, cluster(province) first fe
eststo x5: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time  if b_age > 35, cluster(province) first fe

// IV - Table 1C 
eststo j1: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if rural == 0, cluster(province) first fe
eststo j2: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if rural == 1, cluster(province) first fe
eststo j3: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if edu_high == 1, cluster(province) first fe
eststo j4: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if edu_high == 0, cluster(province) first fe
eststo j5: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if asset_high == 1, cluster(province) first fe
eststo j6: xtivreg2 births (L.search_PM25 = L.fire_count_300) _a* time if asset_high == 0, cluster(province) first fe

//// Result tables
// FE - Table 1B col. 1 
esttab z*, p star(* .1 ** .05 *** .01) indicate("Age FE = *.b_age" "Time trend = year")  noomit 

// IV - Table 1B col. 2-7 
esttab x*, p star(* .1 ** .05 *** .01) indicate("Age FE = _a*")  noomit mtitle("All" "<=20" "20-25" "25-30" "30 - 35" ">35" )

// IV - Table 1C 
esttab j*, p star(* .1 ** .05 *** .01) indicate("Age FE = _a*")  noomit mtitle("Urban" "Rural" "High edu" "Low edu" "High assets"  "Low assets")




