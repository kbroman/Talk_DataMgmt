library(broman)


# batch effect
il3 <- readRDS("il3.rds")
pdf("../Figs/il3.pdf", height=6.5, width=10, pointsize=14)
#par(bg=brocolors("bg"), fg="white", col.axis="white", col.lab="white")
par(mar=c(3.1, 3.6, 0.6, 0.6))
grayplot(il3, xlab="Mouse index", ylab="IL3",
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1,0.25,0))
dev.off()


pdf("../Figs/il3_log.pdf", height=6.5, width=10, pointsize=14)
par(mar=c(3.1, 3.6, 0.6, 0.6))
#par(bg=brocolors("bg"), fg="white", col.axis="white", col.lab="white")
grayplot(log10(il3+0.1), xlab="Mouse index", ylab="log10 IL3",
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1,0.25,0))
dev.off()


# outlier due to error re units
adipose_wt <- readRDS("adipose_weight.rds")

pdf("../Figs/adipose_weight.pdf", height=6.5, width=10, pointsize=14)
par(mar=c(3.1, 3.6, 0.6, 0.6))
#par(bg=brocolors("bg"), fg="white", col.axis="white", col.lab="white")
grayplot(adipose_wt, xlab="Mouse index", ylab="Adipose weight (mg)",
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1,0.25,0))
dev.off()


# body weight
set.seed(201809005)
pdf("../Figs/body_weight.pdf", height=6.5, width=6.5, pointsize=14)
par(mar=c(3.6, 3.6, 0.6, 0.6))
#par(bg=brocolors("bg"), fg="white", col.axis="white", col.lab="white")
before <- rnorm(100, 20, 3.5)
after <- before + rnorm(100, 3, 2)
after[25:26] <- after[26:25]
grayplot(before, after,
         xlab="6 wk body weight (g)",
         ylab="10 wk body weight (g)")
dev.off()
