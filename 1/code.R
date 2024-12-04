library(data.table)

input <- fread(file = "/home/mateusz/Share/adventofcode/1/input.tsv")

input[,  sum(abs(sort(V1) - sort(V2)))]

#Pipe experiments
input[, tab1 := sort(V1),
      ][,tab2 := sort(V2)
        ][, diff := abs(tab1 - tab2)
          ][, sum(diff)]

##Alternative:
input[, tab1 := sort(V1),] |>
  _[,tab2 := sort(V2)] |>
  _[,  sum(abs(tab1 - tab2))]

## PART 2

input <- fread(file = "/home/mateusz/Share/adventofcode/1/input.tsv")

counts <- as.data.table(input[V2 %in% V1, table(V2)])
counts[, V2 := as.integer(V2)][, sum(V2 * N)]

# Other soultion
library(readr)
input2 <- readr::read_delim(
        "/home/mateusz/Share/adventofcode/1/input.tsv",
        col_names = FALSE, delim = "   "
)
counts2 <- table(input2$X2)[as.character(input2$X1)]
counts2 <- na.omit(as.data.frame(counts2))
counts2$Var1 <- as.numeric(as.character(counts2$Var1))
sum(counts2$Var1 * counts2$Freq)
## prop answer22014209
