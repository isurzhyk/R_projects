all <- AU_PRICEZ
dim(all)              #Show the size of the table
data_size <- dim(all) #Create a variable with dimensions of the data table
data_size[2]          #Display the second element of data_size matrix
head(all)             #Show first few rows of the data
names(all)            #Display the variables in the data set
mean(all$SalePrice)   #Get the average price

quantile(all$PRICE)

outlier_1<-(all$PRICE>(mean(all$PRICE)+3*sd(all$PRICE)))*1
all$PRICE[which(outlier_1=='1')]

#Simple histogram
hist(all$PRICE)

#Price plot
ggplot(data=all[!is.na(all$PRICE),], aes(x = DATE, y = PRICE))+
  geom_point(color = 'blue') + geom_smooth(method = "lm", se = FALSE, color = 'black', aes(group = 1)) +
  scale_y_continuous(breaks= seq(0, 2000, by=100))