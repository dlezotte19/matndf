#Inputting the data:
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly","Hillary", "Bernie")
ABC  <- c(4, 62, 51, 21, 2, 14, 15)
CBS <- c(12, 75, 43, 19, 1, 21, 19)

#Using the columnbind function to make a matrix
Polls <- cbind(Name, ABC, CBS)

#Creating a data frame from the data
Polls.df <- data.frame(Name, ABC, CBS)

#Finding the average results for each candidate
CandidateAvg <- cbind(Name,"results"=rowMeans(Polls.df[,2:3]))

#Finding the average votes per poll
PollAvg <- colMeans(Polls.df[,2:3])

#creating the info for a double bar graph
Names <- c(Name,Name)
bothPolls <- c(ABC,CBS)
poll2 <- data.frame("Candidates" = Names, "poll" = c(rep("ABC",7),rep("NBC",7)),"votes" = bothPolls)
library(ggplot2)
ggplot(poll2, aes(x=Names, y=bothPolls, fill=poll2[,2]))+geom_bar(position=position_dodge(), stat="identity")+ggtitle("Poll results for 2016 Election")+ylab("Votes")+xlab("Candidates")+scale_fill_discrete("Poll")
