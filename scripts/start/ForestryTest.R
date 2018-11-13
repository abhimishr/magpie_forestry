# (C) 2008-2017 Potsdam Institute for Climate Impact Research (PIK),
# authors, and contributors see AUTHORS file
# This file is part of MAgPIE and licensed under GNU AGPL Version 3
# or later. See LICENSE file or go to http://www.gnu.org/licenses/
# Contact: magpie@pik-potsdam.de


##########################################################
#### Script to MAgPIE test runs ####
##########################################################

library(lucode)
source("scripts/start_functions.R")
source("config/default.cfg")

cfg$input <- c("magpie4.0_default_sep18.tgz","isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev35_c200_690d3718e151be1b450b394c1064b1c5.tgz","private_forestry_dec18.tgz")
cfg$repositories <- append(list("https://rse.pik-potsdam.de/data/magpie/public"=NULL,"/p/projects/landuse/users/mishra/additional_data_private_forestry"=NULL),
                           getOption("magpie_repos"))
#set defaults
codeCheck <- TRUE

### Single runs ###
#general settings
cfg$gms$c_timesteps <- "5year"
cfg$results_folder <- "output/:title:"
cfg<-lucode::setScenario(cfg,"SSP2")

#ALERT:  At the moment this script cannot download new data in case the input files are changed. Has to be set to true.
cfg$force_download <- FALSE
rl_all<-c("rlGTM")
#rl_all<-c("rlGTM","rlFAO_max")
#rl_all<-c("hybrid")
for (rl in rl_all) {
	print(paste("Rotation length:",rl,"-----"))
	t <- gsub(".*_", "", rl)
	t <- gsub("rl","",t)
	cfg$gms$c32_rot_length <- rl
	cfg$title<- paste0(t,"_dec18") #Use the above naming when using two policyScen or using RecCost switch
	start_run(cfg=cfg,codeCheck=codeCheck)
}