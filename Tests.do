xtset vehicle_id test_date_num

* Hasuman Test

* Petrol
*Run Fixed Effects Regression
xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe 
*Store Estimates
estimates store Pfixed

*Run Random Effects Regression
xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", re 
*Store Estimates
estimates store Prandom

*Run Hasuman Test
hausman Pfixed Prandom, sigmamore

*Diesel
*Run Fixed Effects Regression
xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe 
*Store Estimates
estimates store Dfixed

*Run Random Effects Regression
xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", re 
*Store Estimates
estimates store Drandom

*Run Hasuman Test
hausman Dfixed Drandom, sigmamore


********************************************************************************************
* breusch pagan test for heteroskedasticity in an FE model
ssc install xttest3
*Petrol
xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe 
xttest3
*Diesel
xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe 
xttest3


********************************************************************************************
*Wooldridge test for serial correlation (Do not include lags)
search xtserial
. net sj 3-2 st0039
. net install st0039
xtset vehicle_id test_year
xtserial lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE"
xtserial lnVMT lnDP rural lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI"
xtset vehicle_id test_date_num

******************************************************************************************
 *panel summary of dependent
 xtsum lnVMT if fuel_type == "PE"
 xtsum lnVMT if fuel_type == "DI"
 ****************************************************************************************
 *Test for cross sectional dependence
ssc install xtcsd

preserve
xtset vehicle_id test_year
xtbalance, range(2018 2023)
keep if _n <= 10000
xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe
xtcsd, pesaran abs
restore

preserve
xtset vehicle_id test_year
xtbalance, range(2018 2023)
keep if _n <= 10000
xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe
xtcsd, pesaran abs
restore
***************************************************************************************
*Ramsay RESET Test
reg lnVMT lnPP lnGDP lnY lnAGE lnBSP lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE"
ovtest

xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", fe vce(cluster vehicle_id)
predict fitted_values, xb
gen fitted_values_sq = fitted_values^2
gen fitted_values_cu = fitted_values^3
xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR fitted_values_sq fitted_values_cu if fuel_type == "PE", fe
test fitted_values_sq fitted_values_cu

xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", fe vce(cluster vehicle_id)
predict Dfitted_values, xb
gen fitted_values_2 = Dfitted_values^2
gen fitted_values_3 = Dfitted_values^3
xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR fitted_values_2 fitted_values_3 if fuel_type == "DI", fe
test fitted_values_2 fitted_values_3


********************************************************************************************
*Instrument Tests
*Cragg-Donald Wald Statistic
ssc install ivreg2
ssc install ranktest

ivreg2 lnVMT (lnPP = lnBSP) lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE", first

ivreg2 lnVMT (lnDP = lnBSP) lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI", first
******************************************************************************************
*Collinearity and Multicollinearity
regress lnVMT lnPP rural lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE"
vif

regress lnVMT lnDP rural urban lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI"
vif







