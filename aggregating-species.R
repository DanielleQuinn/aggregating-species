mydata <- data.frame(sample = LETTERS[1:5],
                     lake.chub = c(1, 1, 0, 1, 0),
                     creek.chub = c(1, 0, 0, 0, 0),
                     unidentified.chub = c(0, 1, 1, 1, 0),
                     golden.shiner = c(0, 0, 1, 0, 1),
                     common.shiner = c(0, 0, 0, 0, 1),
                     unidentified.shiner = c(0, 0, 0, 0, 1))

myfun <- function(match) {rowSums(mydata %>% select(ends_with(match)))}

for(i in c("chub", "shiner")) {
  mydata %<>%
    mutate(!!i := ifelse(myfun(i) > 0, 1, 0)) %>%
    select(-ends_with(paste0(".", i)))
}

mydata


