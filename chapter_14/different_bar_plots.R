library("ggplot2")

cyl.freq.matrix <- table(mtcars$am, mtcars$cyl)
barplot(
  cyl.freq.matrix,
  beside = TRUE,
  horiz = TRUE,
  las = 1,
  main = "Performance car counts\nby transmission and cylinders",
  names.arg = c("4", "6", "8"),
  legend.text = c("auto", "manual"),
  args.legend = list(x = "bottomright")
)

qplot(
  factor(mtcars$cyl),
  geom = "blank",
  fill = factor(mtcars$am),
  xlab = "",
  ylab = "",
  main = "Performance car count\nby transmission and cylinders"
) + geom_bar(position = "dodge") + scale_x_discrete(labels = c("4", "6", "8")) + scale_y_continuous(breaks =
                                                                                                      seq(0, 12, 2))  + theme_bw() + coord_flip() + scale_fill_grey(name = "Transmission", labels =
                                                                                                                                                            c("auto", "manual"))

