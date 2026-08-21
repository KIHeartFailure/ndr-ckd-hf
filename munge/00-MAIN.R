# Project specific packages, functions and settings -----------------------

source(here::here("setup/setup.R"))

# Load data ---------------------------------------------------------------

ndrfull <- read_sas(here(shfdbpath, "raw-data/NDR/20220908/lb_lev_ndr.sas7bdat"))
# ndrunique <- ndrfull %>% distinct(lopnr) # create dataset with unique patients used to extract data from LM reg
# write.table(ndrunique, "./data/ndrpats.txt", row.names = F)
load(file = here(shfdbpath, "/data/", datadate, "/patreg.RData"))
load(file = here(shfdbpath, "/data/v423/rsdatafull423.RData"))

rsdata <- rsdatafull423 %>%
  filter(casecontrol == "Case SwedeHF") %>%
  mutate(INDATUM = shf_indexdtm - coalesce(shf_indexhosptime, 0)) %>%
  select(lopnr, INDATUM, shf_ef, shf_indexdtm, shf_location)
rm(rsdatafull423)

load(here(shfdbpath, "/data/", datadate, "/prepdors.RData"))
load(here(shfdbpath, "/data/", datadate, "/rawData_scb.RData"))
rm(list = c(
  "postnr", "fall_och_kontroller_1", "fall_och_kontroller_2",
  "fall_utan_kontroller_1", "fall_utan_kontroller_2", "fall_ej_i_register", "barnbio", "barnadop"
))

# Munge data --------------------------------------------------------------

# swedehf
source(here("munge/01-endtime.R"))
source(here("munge/02-pop-selection.R"))
source(here("munge/03-scb-lisa.R"))
source(here("munge/04-npr-outcom.R"))
source(here("munge/05-npdr-meds.R"))
source(here("munge/06-fix-vars.R"))

# Cache/save data ---------------------------------------------------------

save(
  file = here("data/clean-data/ndrdata.RData"),
  list = c(
    "ndr",
    "flow",
    "metalm",
    "metaout"
  )
)


write_dta(ndr,
  path = here(paste0("data/clean-data/ndrdata_", Sys.Date(), ".dta")),
  version = 14
)
