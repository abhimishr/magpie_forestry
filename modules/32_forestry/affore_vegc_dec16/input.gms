*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de
$setglobal c32_aff_mask  noboreal
* options: unrestricted, noboreal, onlytropical
$setglobal c32_aff_policy  npi
* options: none, npi, ndc

scalars
	s32_max_aff_area 	Maximum global endogenous afforestation (mio. ha)    / Inf /
	s32_planing_horizon Afforestation planing horizon (years)            / 80 /
;

parameter f32_aff_mask(j) Afforestation mask (1)
/
$ondelim
$Ifi "%c32_aff_mask%" == "unrestricted" $include "./modules/32_forestry/input/aff_unrestricted.cs2"
$Ifi "%c32_aff_mask%" == "noboreal" $include "./modules/32_forestry/input/aff_noboreal.cs2"
$Ifi "%c32_aff_mask%" == "onlytropical" $include "./modules/32_forestry/input/aff_onlytropical.cs2"
$offdelim
/;

table f32_fac_req_ha(i,fcosts32) Afforestation factor requirement costs per ha (USD04MER per ha)
$ondelim
$include "./modules/32_forestry/input/f32_fac_req_ha.csv"
$offdelim
;

table f32_aff_pol(t_all,j,pol32) Exogenous afforestation scenario (mio. ha)
$ondelim
$include "./modules/32_forestry/input/npi_ndc_aff_pol.cs3"
$offdelim
;

parameter fm_harvest_cost_ha(i) Harvesting cost (US Dollar 2004 per ha)
/
$ondelim
$include "./modules/32_forestry/input/f32_harvestingcost.csv"
$offdelim
/
;
