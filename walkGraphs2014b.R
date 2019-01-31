walk<-read.csv("walk1_15forR.csv",header=T)
head(walk)
par(pch=22, col="black")
plot(walk$Site,walk$SegSites_WTa,type="n")
lines(walk$Site,walk$SegSites_WT, type="l")
par(pch=22, col="gray") 
lines(walk$Site,walk$SegSites_WTa, type="l")
par(pch=22, col="red") 
lines(walk$Site,walk$SegSites_Hb8, type="l")
par(pch=22, col="blue") 
lines(walk$Site,walk$SegSites_Hbs1, type="l")

########## PI

## trial
par(pch=22, col="black")
plot(walk$Site,walk$Pi_WTa,type="n")
lines(walk$Site,walk$Pi_WT, type="l")
par(pch=22, col="gray") 
lines(walk$Site,walk$Pi_WTa, type="l")
par(pch=22, col="red") 
lines(walk$Site,walk$Pi_Hb8, type="l")


### final PI
pdf("walkPiThLD3.pdf")

tiff("Plot7.tiff", height = 7, width = 7, units = "in", res=300)

par(mfrow=c(3,1))
par(pch=22, col="black")
plot(walk$Site,walk$Pi_WTa,type="n",xaxt='n',ann=FALSE)
mtext("A",side=3,line= 1,adj=0,cex.lab=1.5)
mtext(expression(pi), side=2, line=2, cex.lab=1.2)
par(pch=22, col="gray") 
lines(walk$Site,walk$Pi_WTa, type="l")
par(pch=22, col="black")
lines(walk$Site,walk$Pi_Hb8, type="l")
legend("topright", inset=.05, title="Haplotypes",
  c(expression(paste("Hb8",Delta)),"wt"), fill=c("black","gray"), horiz=TRUE)
par(pch=22, col="black")
points(3292,0.002,pch=19)
points(3602,0.002,pch=19)

### final Theta

par(pch=22, col="black")
plot(walk$Site,walk$Theta_WTa,type="n",xaxt='n',ann=FALSE)
mtext("B",side=3,line= 1,adj=0,cex.lab=1.5)
mtext(expression(theta), side=2, line=2, cex.lab=1.2)
par(pch=22, col="gray") 
lines(walk$Site,walk$Theta_WTa, type="l")
par(pch=22, col="black")
lines(walk$Site,walk$Theta_Hb8, type="l")
legend("topright", inset=.05, title="Haplotypes",
   c(expression(paste("Hb8",Delta)),"wt"), fill=c("black","gray"), horiz=TRUE)
par(pch=22, col="black")
points(3292,0.003,pch=19)
points(3602,0.003,pch=19)


par(pch=22, col="black")
plot(LD3$ChromoPosition1,LD3$R2,type="n",xaxt='n',ann=FALSE)
mtext("C",side=3,line= 1,adj=0,cex.lab=1.5)
mtext(expression(paste(italic(eve), "region")),side=1,line= 1.5,cex.lab=1.2)
mtext(expression(paste("R"^"2")), side=2, line=2, cex.lab=1.2)
lines(LD3$ChromoPosition1,LD3$R2, type="l")

dev.off()


######### plotting LD also ###########

LD<-read.csv("LDwalkForGraph.csv",header=T)
head(LD)


LD2<-read.csv("site1_combinedLD.csv",header=T)
head(LD2)

par(pch=22, col="black")
plot(LD3$ChromoPosition1,LD3$R2,type="n",ylab="LD (R2)",xlab="eve region",main="LD")
lines(LD3$ChromoPosition1,LD3$R2, type="l")

### comparing with LD to the combined hb8 and hbs1 - SITE1
## very similar, the strongest LD is to the 3+UTR snps in eve

LD3<-merge(LD,LD2)
head(LD3,30)
dim(LD)
dim(LD2)
dim(LD3)
LD3

par(pch=22, col="black")
plot(LD3$ChromoPosition1,LD3$R2,type="n",xaxt='n',ann=FALSE)
mtext("C",side=3,line= 1,adj=0,cex.lab=1.5)
mtext(expression(paste(italic(eve), "region")),side=1,line= 1.5,cex.lab=1.2)
mtext(expression(paste("r"^"2",sep="")), side=2, line=2, cex.lab=1.2)
lines(LD3$ChromoPosition1,LD3$R2, type="l")
par(pch=22, col="gray")
lines(LD3$ChromoPosition1,LD3$S1_r2, type="l")

LD3[LD3$S1_r2 == "0.765625",]

plot(LD3$R2,LD3$S1_r2)
