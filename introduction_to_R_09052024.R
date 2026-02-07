# Clean up
rm(list = ls())
# R installation
# Choose the mirror: https://mirrors.tuna.tsinghua.edu.cn/CRAN/
# R Studio
# https://posit.co/download/rstudio-desktop/

## basic math operations
# plus
6000 + 312
# same
6000+312
# minus
6000 - 312 
# multiplication
6000 * 312
# divide
6312 / 3
# power
6312 ^ 3
# with bracket
3 * 100 + 4
3 * (100 + 4)
# square root
sqrt(81)
# same
81 ^ (1 / 2)

## object
# use "<-" (recommended) or "=" to assign value
result_1 <- 6000 + 312
# use "print" to display result
print(result_1)
# or just type "result_1"
result_1
# can use other name
output_1 <- 6000 + 312
print(output_1)
# use result to do further operation
output_2 <- output_1 / 3
print(output_2)
# not recommended: using number (at the start) or special characters such as $
# empty object
result_2

## the class of the object: character vs. number
# character
fdu <- "university"
print(fdu)
month_1 <- "September"
print(month_1)
month_2 <- "9"
print(month_2)
# cannot use math operation
month_2 / 3
sqrt(month_2)
# use class function
class(fdu)
class(output_1)
class(sqrt)

## vector
# use concatenate c()
# say we are interested in the real gdp growth rate of the following countries in 2023
country_name <- c("Albania", "Belgium", "Cambodia", "Dominican Republic", "Egypt", "France")
print(country_name)
# combine vectors
country_name_1 <- c("Albania", "Belgium", "Cambodia")
country_name_1
country_name_2 <- c("Dominican Republic", "Egypt", "France")
country_name_2
country_name_1_2 <- c(country_name_1, country_name_2)
country_name_1_2
# real gdp growth
real_gdp_growth_1 <- c(3.3, 1.5, 5)
real_gdp_growth_1
real_gdp_growth_2 <- c(2.4, 3.8, 0.9)
real_gdp_growth_2
# combine vectors
real_gdp_growth_1_2 <- c(real_gdp_growth_1, real_gdp_growth_2)
real_gdp_growth_1_2
# real gdp growth rate of Dominican Republic in 2023
real_gdp_growth_2[1]
real_gdp_growth_1_2[4]
# real gdp growth rates of Albania and France 
real_gdp_growth_1_2[c(1, 6)]
real_gdp_growth_1_2[c(6, 1)]
# exclude Albania
real_gdp_growth_1_2[-1]
# exclude France
real_gdp_growth_1_2[-6]
# exclude Albania and France
real_gdp_growth_1_2[c(-1, -6)]
# math operation
# divided by 100
real_gdp_growth_1_2_divided <- real_gdp_growth_1_2 / 100
print(real_gdp_growth_1_2_divided)

## some basic functions
# length: number of elements in a vector
length(country_name_1_2)
length(real_gdp_growth_1_2)
# minimum
min(real_gdp_growth_1_2)
# maximum
max(real_gdp_growth_1_2)
# range
range(real_gdp_growth_1_2)
# average
mean(real_gdp_growth_1_2)
# round
mean_real_gdp_growth_1_2 <- mean(real_gdp_growth_1_2)
round(mean_real_gdp_growth_1_2, 1)
# sum
sum(real_gdp_growth_1_2)
# mean
sum(real_gdp_growth_1_2) / length(real_gdp_growth_1_2)
mean_real_gdp_growth_1_2
# median
median(real_gdp_growth_1_2)
# sequence
seq_1_10_by_1 <- seq(from = 1, to = 10, by = 1)
seq_1_10_by_1
# same when use c()
c_1_10_by_1 <- c(1:10)
c_1_10_by_1
# odd number from 1 to 10
seq_1_10_by_2 <- seq(from = 1, to = 10, by = 2)
seq_1_10_by_2
# reversed order
seq_1_10_by_1_reversed <- seq(from = 10, to = 1, by = -1)
seq_1_10_by_1_reversed

# create your function
my_summary <- function(x){# this function takes one input
  sum_out <- sum(x)
  length_out <- length(x)
  mean_out <- sum_out / length_out
  median_out <- median(x)
  all_out <- c(sum_out, length_out, mean_out, median_out) # put all things together
  names(all_out) <- c("Sum", "N", "Average", "Median")
  return(all_out)
}

my_summary(seq_1_10_by_2)

# combine two vectors
# cbind
mat_real_gdp_growth <- cbind(country_name_1_2, real_gdp_growth_1_2)
mat_real_gdp_growth
# first row first column
mat_real_gdp_growth[1, 1]
# second row second column
mat_real_gdp_growth[2, 2]
# convert to data frame
dat_real_gdp_growth <- as.data.frame(mat_real_gdp_growth)
dat_real_gdp_growth
# use head and tail function to view the data frame
head(dat_real_gdp_growth, 2)
tail(dat_real_gdp_growth, 2)
# set working directory
setwd("G:/QSS")
getwd()
# save as csv and rds
write.csv(dat_real_gdp_growth, file = "dat_real_gdp_growth_09102024.csv")
saveRDS(dat_real_gdp_growth, file = "dat_real_gdp_growth_09102024.rds")
# read data
dat_real_gdp_growth <- readRDS("dat_real_gdp_growth_09102024.rds")
# three ways of calling column
dat_real_gdp_growth[, 1]
dat_real_gdp_growth[, "country_name_1_2"]
dat_real_gdp_growth$country_name_1_2
# calling row
dat_real_gdp_growth[2, ]
# check the class of the second column
class(dat_real_gdp_growth$real_gdp_growth_1_2)
# we need convert it back to number
dat_real_gdp_growth$real_gdp_growth_1_2 <- as.numeric(dat_real_gdp_growth$real_gdp_growth_1_2)
# now it is numeric
class(dat_real_gdp_growth$real_gdp_growth_1_2)
# column names of the data frame
colnames(dat_real_gdp_growth)
names(dat_real_gdp_growth)
# you can change the column names
colnames(dat_real_gdp_growth) <- c("country_name", "real_gdp_growth")
names(dat_real_gdp_growth)
# number of rows
nrow(dat_real_gdp_growth)
# number of columns
ncol(dat_real_gdp_growth)
# check the dimension of the data frame
dim(dat_real_gdp_growth)
dim(dat_real_gdp_growth)[1]
dim(dat_real_gdp_growth)[2]
# get the summary statistics
summary(dat_real_gdp_growth)
summary(dat_real_gdp_growth$real_gdp_growth)
# about missing values
real_gdp_growth_na <- c(dat_real_gdp_growth$real_gdp_growth, NA)
mean(real_gdp_growth_na)
mean(real_gdp_growth_na, na.rm = TRUE)

# about package
# install haven package so that you can load STATA or SPSS files
library("haven")
cgss_2021 <- read_dta("cgss_2021.dta")
head(cgss_2021)
tail(cgss_2021)

# logical operators
class(TRUE)
class(FALSE)
# convert to numeric values
as.numeric(TRUE)
as.numeric(FALSE)
# logical operators with math operators
6000 > 312
6000 >= 312
# equal to
"FDU" == "fdu"
"FDU" == "FDU"
x <- dat_real_gdp_growth$real_gdp_growth
x > 2
x != 1.5

# read unvoting data
unvoting <- read.csv("unvoting.csv")

# check the head and the tail of data
head(unvoting)
tail(unvoting)
# how many observations in the data
nrow(unvoting)
# how many countries in the data
length(unique(unvoting$CountryName))
# how many years in the data
length(unique(unvoting$Year))
# average percentage agree with the USA (China)
mean(unvoting$PctAgreeUS[unvoting$CountryName == "China"])
# or you can subset China first
China <- unvoting[unvoting$CountryName == "China", ]
head(China)
tail(China)
mean(China$PctAgreeUS)
# you can also use subset
China_2 <- subset(unvoting, CountryName == "China")
head(China_2)
tail(China_2)
mean(China_2$PctAgreeUS)
summary(China_2$PctAgreeUS)
quantile(China_2$PctAgreeUS)
# interquartile range, iqr
iqr_China <- IQR(China_2$PctAgreeUS)
iqr_China
# use subset with select
China_3 <- subset(unvoting, select = c("Year", "CountryName", "PctAgreeUS", "PctAgreeRUSSIA"), 
                  subset = (CountryName == "China"))
head(China_3)
tail(China_3)
# average percentage agree with the USA (Canada)
mean(unvoting$PctAgreeUS[unvoting$CountryName == "Canada"])
# Iran before 1980
mean(unvoting$PctAgreeUS[unvoting$CountryName == "Iran" & unvoting$Year < 1980])
# Iran after 1980
mean(unvoting$PctAgreeUS[unvoting$CountryName == "Iran" & unvoting$Year >= 1980])
# create new variable
unvoting$pro_usa <- rep(NA)
unvoting$pro_usa[unvoting$PctAgreeUS > 0.5] <- 1
unvoting$pro_usa[unvoting$PctAgreeUS <= 0.5] <- 0
table(unvoting$pro_usa, exclude = NULL)
# check the case of China
table(unvoting$pro_usa[unvoting$CountryName == "China"], exclude = NULL)
# check the case of Iran
table(unvoting$pro_usa[unvoting$CountryName == "Iran"], exclude = NULL)
table(unvoting$pro_usa[unvoting$CountryName == "Iran" & unvoting$Year < 1980], exclude = NULL)
# plot
Iran <- subset(unvoting, unvoting$CountryName == "Iran")
plot(x = Iran$Year, y = Iran$PctAgreeUS, col = "black", type = "l",
     xlim = c(1946, 2012), ylim = c(0, 1), xlab = "Year",
     ylab = "% Agree with USA",
     main = "UN Voting: Iran")
# add a vertical line indicating the year of 1979
abline(v = 1979, lty = 2)

# we can also use ggplot
library("ggplot2")
plot_Iran <- ggplot() +
  geom_point(data = Iran, 
             aes(x = Year, 
                 y = PctAgreeUS),
             size = 3) +
  geom_line(data = Iran, 
            aes(x = Year, 
                y = PctAgreeUS),
            linewidth = 1.2) +
  ylab("% Agree with USA") +
  xlab("Year") +
  ylim(c(0, 1)) +
  ggtitle(NULL, subtitle = NULL) +
  theme_light(base_size = 14) +
  scale_x_continuous(breaks = seq(1946, 2012, by = 4)) +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title = element_text(size = 22),
        axis.text = element_text(size = 20))
plot_Iran


# now we use barplot
barplot(Iran$PctAgreeUS, names.arg = Iran$Year, col = "blue",
        ylim = c(0, 1))

