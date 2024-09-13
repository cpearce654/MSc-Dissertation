tab vehicle_type

* Estimate the fixed effects model for Petrol and each Vehicle Type
 xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE" & vehicle_type == "City", fe vce(cluster vehicle_id)
 
 xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE" & vehicle_type == "Medium", fe vce(cluster vehicle_id)

 xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE" & vehicle_type == "SUV/MPV", fe vce(cluster vehicle_id)
 
 xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE" & vehicle_type == "Small SUV", fe vce(cluster vehicle_id)
 
  xtreg lnVMT lnPP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "PE" & vehicle_type == "Small Sedan", fe vce(cluster vehicle_id)
  
///////////////////////////////////////////////////////////////////////////////////////////
* Estimate the fixed effects model for Diesel and each Vehicle Type
xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI" & vehicle_type == "City", fe vce(cluster vehicle_id)

xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI" & vehicle_type == "Medium", fe vce(cluster vehicle_id)

xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI" & vehicle_type == "SUV/MPV", fe vce(cluster vehicle_id)

xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI" & vehicle_type == "Small SUV", fe vce(cluster vehicle_id)

xtreg lnVMT lnDP lnGDP lnY lnAGE lnHDM lnPRCP lnDPOP LOCK WAR if fuel_type == "DI" & vehicle_type == "Small Sedan", fe vce(cluster vehicle_id)

