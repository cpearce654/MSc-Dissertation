encode test_date, gen(test_date_num)

* Data transformations (log)
gen lnVMT = log(VMT)
gen lnPP = log(PP)
gen lnDP = log(DP)
gen lnRGDP = log(RGDP)
gen lnHDM = log(HDM)
gen lnMPRCP = log(PRCP)
gen lnDPOP = log(DPOP)
gen lnRY = log(RY)
gen lnAGE = log(AGE)
gen lnBSP = log(bsp)

* Set Panel Variables
xtset vehicle_id test_date_num

*Check for Collinearity
regress lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE"
vif

regress lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI"
vif

* Estimate the fixed effects model for Petrol
xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe vce(cluster vehicle_id)

* Estimate the fixed effects model for Diesel
xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe vce(cluster vehicle_id)

********************************************************************************************

*Two-Stage Least Squares Regression for Petrol
xtivreg lnVMT (lnPP = lnBSP) lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe vce(cluster vehicle_id)

*Two-Stage Least Squares Regression for Diesel
xtivreg lnVMT (lnDP = lnBSP) lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe vce(cluster vehicle_id)



*********************************************************************************************Removing Variables to check for robust results
xtreg lnVMT lnPP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe vce(cluster vehicle_id)

xtreg lnVMT lnPP lnGDP lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe vce(cluster vehicle_id)

xtreg lnVMT lnPP lnGDP lnY lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe vce(cluster vehicle_id)

xtreg lnVMT lnDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe vce(cluster vehicle_id)

xtreg lnVMT lnDP lnGDP lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe vce(cluster vehicle_id)

xtreg lnVMT lnDP lnGDP lnY lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe vce(cluster vehicle_id)






