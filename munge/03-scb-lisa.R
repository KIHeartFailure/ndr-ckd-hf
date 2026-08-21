# anyDuplicated(demo$lopnr)

demo <- demo %>%
  mutate(
    scb_countryofbirth = factor(case_when(
      fodelseland_EU28 %in% c(
        "Afrika",
        "Asien",
        "Nordamerika",
        "Oceanien",
        "Sovjetunionen",
        "Sydamerika",
        "Statslos"
      ) ~ 3,
      fodelseland_EU28 %in% c(
        "EU28 utom Norden",
        "Europa utom EU28 och Norden",
        "Norden utom Sverige"
      ) ~ 2,
      fodelseland_EU28 == "Sverige" ~ 1
    ), levels = 1:3, labels = c("Sweden", "Europe", "Other"))
  )

ndr <- left_join(
  ndr,
  demo %>% select(scb_countryofbirth, LopNr),
  by = c("lopnr" = "LopNr")
)


ndr <- ndr %>%
  mutate(scbyear = year(indexdtm) - 1)

lisa <- lisa %>%
  mutate(
    scb_famtype = case_when(
      FamTypF %in% c(11, 12, 13, 21, 22, 23, 31, 32, 41, 42) ~ "Cohabitating",
      FamTypF %in% c(50, 60) ~ "Living alone"
    ),
    Sun2000niva = coalesce(Sun2000niva_old, Sun2000niva_Old, Sun2020Niva_Old),
    scb_education = case_when(
      Sun2000niva %in% c(1, 2) ~ "Compulsory school",
      Sun2000niva %in% c(3, 4) ~ "Secondary school",
      Sun2000niva %in% c(5, 6, 7) ~ "University"
    ),
    # DispInk	Disponibel inkomst (individens delkomponent)	1999-2004	LISA
    # DispInk04	Disponibel inkomst (individens delkomponent) - från 2020 ingår lön intjänat i annat nordiskt land	2004-2022	LISA
    # DispInk04_INKLGP	Disponibel inkomst (individens delkomponent) - inkl. lön intjänat i annat nordiskt land	2011-2019	LISA
    scb_dispincome = coalesce(DispInk04_INKLGP, DispInk04, DispInk)
  ) %>%
  select(LopNr, year, starts_with("scb_"))

ndr <- left_join(
  ndr,
  lisa,
  by = c("lopnr" = "LopNr", "scbyear" = "year")
) %>%
  select(-scbyear)

rm(list = c("lisa", "demo"))
gc()
