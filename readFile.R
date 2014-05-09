readFile <- function(){
   fileName <- "household_power_consumption.txt";
   
   require(sqldf);
   data <- read.table(fileName,sep=";",fill=TRUE, na.strings="?",header=TRUE,stringsAsFactors=FALSE);
   df <- sqldf("Select * from data where Date ='1/2/2007' or Date = '2/2/2007'");
    
   return(df);
   
}