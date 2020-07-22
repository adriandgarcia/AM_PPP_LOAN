library(tidyverse)
library(lubridate)

READ <- function(FILE, OUTPUT) {
  read_csv(FILE,
           trim_ws = TRUE,
           guess_max = nrow(read_csv(FILE)) -12,
           n_max = nrow(read_csv(FILE)) -12
  )
}

Data1 <- READ("~/Data/ppp_loans/data/Morningstar/MS_Info_Report_071020_5000.csv")
Data2 <- READ("~/Data/ppp_loans/data/Morningstar/MS_Info_Report_071020_10000.csv")
Data3 <- READ("~/Data/ppp_loans/data/Morningstar/MS_Info_Report_071020_15000.csv")
Data4 <- READ("~/Data/ppp_loans/data/Morningstar/MS_Info_Report_071020_20000.csv")
Data5 <- READ("~/Data/ppp_loans/data/Morningstar/MS_Info_Report_071020_25000.csv")
Data6 <- READ("~/Data/ppp_loans/data/Morningstar/MS_Info_Report_071020_25569.csv")

Full_DATA <- full_join(Data1, Data2) %>%
  full_join(., Data3) %>% 
  full_join(., Data4) %>% 
  full_join(., Data5) %>% 
  full_join(., Data6)


write_csv(Full_DATA, "~/Data/ppp_loans/data/Morningstar/MS_Info_Report_071020_Full.csv")

rm(list=c("Data1","Data2","Data3","Data4","Data5","Data6","READ","Full_DATA"))
