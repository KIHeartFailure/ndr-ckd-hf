# Treatments from PDR ----------------------------------------

lm <- read_sas(here("./data/raw-data/lmndr.sas7bdat"))

# within 4 months prior to index

lmsel <- left_join(
  ndr %>%
    select(lopnr, indexdtm),
  lm,
  by = c("lopnr" = "lopnr")
)

lmsel <- lmsel %>%
  mutate(diff = as.numeric(EDATUM - indexdtm)) %>%
  filter(diff >= (-120), diff <= 0) %>%
  select(lopnr, indexdtm, ATC)

ndr <- create_medvar(
  atc = "^(A10BK|A10BD15|A10BD16|A10BD19|A10BD20|A10BD21|A10BD23|A10BD24|A10BD25)",
  medname = "sglt2i",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(A10BJ|A10BX16)",
  medname = "glp1",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(C09A|C09B|C09C|C09D)",
  medname = "rasiarni",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(C03DA)",
  medname = "mra",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(C07)",
  medname = "bbl",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(C03C|C03EB)",
  medname = "loop",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(C03A|C03B|C09BA|C09DA|C07B|C07C|C07D)",
  medname = "thiazide",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(C10)",
  medname = "lipidlowering",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(A10A)",
  medname = "insulin",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(A10BA|A10BD02|A10BD03|A10BD05|A10BD07|A10BD08|A10BD10|A10BD11|A10BD13|A10BD14|A10BD15|A10BD16|A10BD17|A10BD18|A10BD20|A10BD22|A10BD23|A10BD25)",
  medname = "metformin",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(A10BH|A10BD07|A10BD08|A10BD09|A10BD10|A10BD11|A10BD13|A10BD19|A10BD21|A10BD24|A10BD25)",
  medname = "dpp4",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(A10BB|A10BC|A10BD02|A10BD04|A10BD06|A10BX02)",
  medname = "sulfon_meglit",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(A10BF|A10BG|A10BX16)",
  medname = "other_gl",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(B01AC)",
  medname = "antiplatelet",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
ndr <- create_medvar(
  atc = "^(B01AA|B01AE|B01AF)",
  medname = "oralanticoagulants",
  cohortdata = ndr,
  meddata = lmsel,
  id = c("lopnr"),
  metatime = "-120 - 0",
  valsclass = "num"
)
rm(lm)
gc()
