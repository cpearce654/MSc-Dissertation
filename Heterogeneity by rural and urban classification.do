* Estimate the fixed effects model for Petrol, in Rural and Urban Postcodes
xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE" & rural == 1, fe vce(cluster vehicle_id)

xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE" & rural == 0, fe vce(cluster vehicle_id)

**********************************************************************************************

* Estimate the fixed effects model for Diesel, in Rural and Urban Postcodes
xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI" & rural == 1, fe vce(cluster vehicle_id)

xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI" & rural == 0, fe vce(cluster vehicle_id)