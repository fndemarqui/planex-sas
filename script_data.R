

library(planex)
library(tidyverse)

# data("capacidade")
# readr::write_delim(capacidade, "data/capacidade.csv")
  
# data("baterias")
# readr::write_delim(baterias, "data/baterias.csv")

data("fornecedores")
readr::write_delim(fornecedores, "data/fornecedores.csv")

refrigerantes <- refrigerantes %>%
  rename(
    A = carbonatacao,
    B = pressao,
    C = velocidade
  )
head(refrigerantes)

readr::write_delim(refrigerantes, "data/refrigerantes.csv")


data("turbinas")
readr::write_delim(turbinas, "data/turbinas.csv")
