ndr <- ndr %>%
  mutate(
    debutar = pmin(debutar_reg, debutar, na.rm = T),
    debutar = pmin(debutar, year(indexdtm), na.rm = T),
    sex = if_else(sex == 1, "Male", "Female")
  ) %>%
  select(-fodelsedatum, -contains("_tmp"), -contains("klin_diab_typ"), -debutar_reg)
