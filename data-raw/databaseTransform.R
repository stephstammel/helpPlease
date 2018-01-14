## save the file as RDS

require(openxlsx)
defineDB <- read.xlsx("data-raw/database.xlsx", sheet = "defineMe",
                colNames = TRUE)
helpDB <- read.xlsx("data-raw/database.xlsx", sheet = "helpError",
                    colNames = TRUE)
encourageDB <- read.xlsx("data-raw/database.xlsx", sheet = "encouragement",
                        colNames = TRUE)
troubleShootDB <- read.xlsx("data-raw/database.xlsx", sheet = "troubleshooting",
                            colNames = TRUE)


devtools::use_data(defineDB, overwrite = TRUE)
devtools::use_data(helpDB, overwrite = TRUE)
devtools::use_data(encourageDB, overwrite = TRUE)
devtools::use_data(troubleShootDB, overwrite = TRUE)

