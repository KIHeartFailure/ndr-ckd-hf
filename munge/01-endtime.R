# Migration ---------------------------------------------------------------

migration <- inner_join(
  ndrfull %>%
    select(lopnr, regdat),
  migration %>%
    filter(Posttyp == "Utv"),
  by = c("lopnr" = "LopNr")
) %>%
  mutate(tmp_migrationdtm = ymd(Datum)) %>%
  filter(
    tmp_migrationdtm > regdat,
    tmp_migrationdtm <= global_endfu
  ) %>%
  group_by(lopnr, regdat) %>%
  slice(1) %>%
  ungroup() %>%
  select(lopnr, regdat, tmp_migrationdtm)

ndrfull <- left_join(ndrfull,
  migration,
  by = c("lopnr", "regdat")
)

# Death -------------------------------------------------------------------

ndrfull <- left_join(
  ndrfull,
  dors %>% select(lopnr, sos_deathcause, sos_deathdtm),
  by = "lopnr"
)

ndrfull <- ndrfull %>%
  mutate(
    censdtm = pmin(sos_deathdtm, tmp_migrationdtm, na.rm = TRUE),
    censdtm = pmin(censdtm, global_endfu, na.rm = TRUE)
  ) %>%
  select(-tmp_migrationdtm)

rm(migration)
rm(dors)
gc()
