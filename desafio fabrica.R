setwd("C:\\Users\\elain\\OneDrive\\Documents\\UNIPE\\P2\\fabrica\\R")

df = read.csv("ds_salaries.csv", sep=",", encoding = "UTF-8")
View(df)

freq_abs = table(df$salary_in_usd)
View(freq_abs)

freq_rel = prop.table(freq_abs)
View(freq_rel)

p_freq_rel = 100* prop.table(freq_rel)
View(p_freq_rel)

freq_abs = c(freq_abs, sum(freq_abs))
View(freq_abs)
names(freq_abs)[[370]] = "Total"
View(freq_abs)

freq_rel = c(freq_rel, sum(freq_rel))
p_freq_rel = c(p_freq_rel, sum(p_freq_rel))

tabela_final = cbind(freq_abs,
                     freq_rel = round(freq_rel, digits = 5),
                     p_freq_rel = round(p_freq_rel, digits = 2))
View(tabela_final)

k = 1+3.3*log(607)
k

A = (600000 - 2859)/23
A

intervalo_de_classes = seq(2859, 600000, 25962.65)

tabela_de_classes = table(cut(df$salary_in_usd, breaks = intervalo_de_classes, right=FALSE))
View(tabela_de_classes)

summary(df)

hist(df$salary_in_usd, col="purple")

barplot(tabela_de_classes, col = "purple")

df1 = df

excluir1 = c("salary", "salary_currency")
novo_df1 = df1[ , !(names(df1) %in% excluir1)]
View(novo_df1)

write.table(novo_df1, file = "salaries_in_usd.csv", sep = ",")