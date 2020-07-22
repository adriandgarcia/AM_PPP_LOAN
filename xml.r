library(tidyverse)
library(xml2)

doc <- read_xml("~/Data/ppp_loans/data/SEC/IA_FIRM_SEC_Feed_07_15_2020.xml")

doc <- as_list(read_xml("~/Data/ppp_loans/data/SEC/IA_FIRM_SEC_Feed_07_15_2020.xml"))
b <- xml_name(doc)
c <- xml_children(doc)

d <- xml_find_all(doc, ".//Info")
e <- xml_find_all(doc, ".//Rgstn")
g <- xml_find_all(doc, ".//MainAddr")

f <- xml_path(d)

df <- tibble(SECRgnCD = xml_attr(d, "SECRgnCD"))
df$FirmCrdNb <- tibble(FirmCrdNb = xml_attr(d, "FirmCrdNb"))
df$SECNb <- tibble(SECNb = xml_attr(d, "SECNb"))
df$BusNm <- tibble(BusNm = xml_attr(d, "BusNm"))
df$LegalNm <- tibble(LegalNm = xml_attr(d, "LegalNm"))
df$Strt1 <- tibble(Strt1 = xml_attr(g, "Strt1"))
df$Strt2 <- tibble(Strt2 = xml_attr(g, "Strt2"))
df$City <- tibble(City = xml_attr(g, "City"))
df$State <- tibble(State = xml_attr(g, "State"))
df$FirmType <- tibble(FirmType = xml_attr(e, "FirmType"))
df$St <- tibble(St = xml_attr(e, "St"))
df$Dt <- tibble(Dt = xml_attr(e, "Dt"))


f1 <- as.data.frame(f)
f1 <- tibble(f)


