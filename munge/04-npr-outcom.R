# Comorbidities -----------------------------------------------------------

ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  opvar = OP_all,
  type = "com",
  name = "dialysiskidneyrep",
  diakod = " Z490| Z491| Z492| Z992",
  opkod = " DR012| DR013| DR014| DR016| DR020| DR024| TJA33| DR055| DR056| DR060| DR061| QF006",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)

ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "cadihd",
  diakod = " 41[0-4]| I2[0-5]",
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "mi",
  diakod = " 410| 412| I21| I22| I252",
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "com",
  name = "pci",
  opkod = " FNG",
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  opvar = OP_all,
  type = "com",
  name = "cabg",
  diakod = " Z951| Z955",
  opkod = " FNA| FNB| FNC| FND| FNE| FNF| FNH",
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "stroke",
  diakod = " 433| 434| 436| I63| I64",
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "strokebroad",
  diakod = " 433| 434| 436| I63| I64| 437X| 438| I679| I693| I694",
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "pad",
  diakod = " 440C| 443X| I702| I739| I702| I73",
  valsclass = "num",
  warnings = FALSE
)

ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "hypertension",
  diakod = " I1[0-5]",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af",
  diakod = " I48",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "copd",
  diakod = " J4[0-4]",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "valvular",
  diakod = " I0[5-8]| I3[4-9]| Q22| Q23[0-3]| Q23[0-3]| Q23[5-9]| Z95[2-4]",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "dcm",
  diakod = " I420",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "sleepapnea",
  diakod = " G473",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "liver",
  diakod = " B18| I85| I864| I982| K70| K710| K711| K71[3-7]| K7[2-4]| K760| K76[2-9]",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = HDIA,
  type = "com",
  name = "cancer",
  diakod = " C",
  stoptime = -3 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "dementiadepression",
  diakod = " F0[0-4]| R54| F3[2-4]",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  evar = ekod_all,
  type = "com",
  name = "alcohol",
  diakod = " E244| E52| F10| G312| G621| G721| I426| K292| K70| K860| O354| P043| Q860| T51| Z502| Z714",
  ekod = " Y90| Y91",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)
ndr <- create_sosvar(
  sosdata = patreg,
  cohortdata = ndr,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  opvar = OP_all,
  type = "com",
  name = "bleed",
  diakod = " S064| S065| S066| I850| I983| K226| K250| K252| K254| K256| K260| K262| K264| K266| K270| K272| K274| K276| K280| K284| K286| K290| K625| K661| K920| K921| K922| H431| N02| R04| R58| T810| D629",
  opkod = " DR029",
  stoptime = -5 * 365.25,
  valsclass = "num",
  warnings = FALSE
)

# Outcomes ----------------------------------------------------------------

hfhosp <- patreg %>%
  filter(sos_source == "sv" & str_detect(DIA_all, " I110| I130| I132| I255| I420| I423| I42[5-9]| I43| I50| J81| K761| R570")) %>%
  group_by(lopnr) %>%
  arrange(INDATUM) %>%
  slice(1) %>%
  ungroup() %>%
  select(lopnr, INDATUM) %>%
  rename(sos_hfhdtm = INDATUM)

ndr <- left_join(ndr, hfhosp, by = "lopnr")

rsdata <- rsdata %>%
  filter(shf_location == "In-patient") %>%
  group_by(lopnr) %>%
  arrange(INDATUM) %>%
  slice(1) %>%
  ungroup() %>%
  select(lopnr, INDATUM, shf_ef) %>%
  rename(shf_hfhdtm = INDATUM)

ndr <- left_join(ndr, rsdata, by = "lopnr")

rm(patreg)
gc()
