# Inclusion/exclusion criteria --------------------------------------------------------

flow <- tibble(Criteria = "Posts recieved from the NDR", N = nrow(ndrfull))
heightimp <- ndrfull %>%
  filter(!is.na(langd)) %>%
  group_by(lopnr) %>%
  arrange(regdat) %>%
  slice(n()) %>%
  ungroup() %>%
  rename(langd_imp = langd) %>%
  select(lopnr, langd_imp)

ndrfull <- left_join(ndrfull,
  heightimp,
  by = "lopnr"
) %>%
  mutate(
    langd = coalesce(langd, langd_imp),
    bmi = coalesce(bmi, round(vikt / (langd / 100)^2, 1))
  ) %>%
  select(-langd_imp)

rm(heightimp)

ndr <- ndrfull %>%
  select(
    -dodsdatum,
    -fot_datum, -ogon_datum,
    -PumpIndikation, -PumpPagaendeModell, -PumpPagaendeSerienummer, -PumpAvslutOrsak,
    -retinopati, -ogonlaser, -synnedsattning, -fotundersokning, -fotrisk,
    -retinopathyDiagnosis, -eyeTreated, -isRemote, -alder
  ) %>%
  filter(regdat >= ymd("2010-01-01") & regdat <= ymd("2021-12-31"))

rm(ndrfull)

flow <- flow %>%
  add_row(
    Criteria = "Included 2010-01-01 - 2021-12-31",
    N = nrow(ndr)
  )

ndr <- ndr %>%
  mutate(klin_diab_typ_tmp = coalesce(klin_diab_typ_reg, klin_diab_typ)) %>%
  filter(klin_diab_typ_tmp == 2)

flow <- flow %>%
  add_row(
    Criteria = "Posts with Type II DM",
    N = nrow(ndr)
  )

ndr <- ndr %>%
  mutate(age = floor((as.numeric(regdat - ymd(fodelsedatum)) / 365.25))) %>%
  filter(age >= 18)

flow <- flow %>%
  add_row(
    Criteria = "Posts Age >= 18",
    N = nrow(ndr)
  )

ndr <- anti_join(ndr,
  ateranvpnr,
  by = c("lopnr" = "LopNr")
)
rm(ateranvpnr)
flow <- flow %>%
  add_row(
    Criteria = "Exclude patients with re-used personal identification numbers",
    N = nrow(ndr)
  )

ndr <- ndr %>%
  filter(!is.na(bmi))
flow <- flow %>%
  add_row(
    Criteria = "Exclude post with missing bmi",
    N = nrow(ndr)
  )

ndr <- ndr %>%
  filter(!is.na(GFR))

flow <- flow %>%
  add_row(
    Criteria = "Exclude post with missing egfr",
    N = nrow(ndr)
  )


hfpop <- patreg %>%
  filter(str_detect(DIA_all, " I110| I130| I132| I255| I420| I423| I42[5-9]| I43| I50| J81| K761| R570| 414W| 425E| 425F| 425G| 425H| 425W| 425X| 428")) %>%
  group_by(lopnr) %>%
  arrange(INDATUM) %>%
  slice(1) %>%
  ungroup() %>%
  select(lopnr, INDATUM)
hfpop <- bind_rows(
  hfpop,
  rsdata %>% select(lopnr, INDATUM)
) %>%
  group_by(lopnr) %>%
  arrange(INDATUM) %>%
  slice(1) %>%
  ungroup()

ndr <- left_join(ndr, hfpop, by = "lopnr") %>%
  filter(regdat <= INDATUM | is.na(INDATUM)) %>%
  select(-INDATUM)
flow <- flow %>%
  add_row(
    Criteria = "Exclude posts with previous HF diagnosis in SwedeHF or NPR",
    N = nrow(ndr)
  )
rm(hfpop)

ndr <- ndr %>%
  group_by(lopnr) %>%
  arrange(regdat) %>%
  slice(1) %>%
  ungroup() %>%
  rename(indexdtm = regdat)

flow <- flow %>%
  add_row(
    Criteria = "First registration / patient",
    N = nrow(ndr)
  )
