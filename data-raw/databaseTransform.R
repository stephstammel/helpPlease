## save the file as RDS

require(openxlsx)
defineDB <- read.xlsx("database.xlsx", sheet = "defineMe",
                colNames = TRUE)
helpDB <- read.xlsx("database.xlsx", sheet = "helpError",
                    colNames = TRUE)
encourageDB <- read.xlsx("database.xlsx", sheet = "encouragement",
                        colNames = TRUE)
troubleShootDB <- read.xlsx("database.xlsx", sheet = "troubleshooting",
                            colNames = TRUE)


devtools::use_data(defineDB)
devtools::use_data(helpDB)
devtools::use_data(encourageDB)
devtools::use_data(troubleShootDB)

