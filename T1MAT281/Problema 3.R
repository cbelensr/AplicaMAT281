matriz=matrix(ncol=10,nrow=10)
for (i in 1:10){
  if (gustos_musicales$pinkfloyd[i] == "no"){
    matriz[i,1] = 0
  }
  else{
    matriz[i,1] = 1
  }
  if (gustos_musicales$thebeatles[i] == "no"){
    matriz[i,2] = 0
  }
  else{
    matriz[i,2] = 1
  }
  if (gustos_musicales$queen[i] == "no"){
    matriz[i,3] = 0
  }
  else{
    matriz[i,3] = 1
  }
  if (gustos_musicales$oasis[i] == "no"){
    matriz[i,4] = 0
  }
  else{
    matriz[i,4] = 1
  }
  if (gustos_musicales$radiohead[i] == "no"){
    matriz[i,5] = 0
  }
  else{
    matriz[i,5] = 1
  }
  if (gustos_musicales$greenday[i] == "no"){
    matriz[i,6] = 0
  }
  else{
    matriz[i,6] = 1
  }
  if (gustos_musicales$thestrokes[i] == "no"){
    matriz[i,7] = 0
  }
  else{
    matriz[i,7] = 1
  }
  if (gustos_musicales$linkinpark[i] == "no"){
    matriz[i,8] = 0
  }
  else{
    matriz[i,8] = 1
  }
  if (gustos_musicales$foofighters[i] == "no"){
    matriz[i,9] = 0
  }
  else{
    matriz[i,9] = 1
  }
  if (gustos_musicales$coldplay[i] == "no"){
    matriz[i,10] = 0
  }
  else{
    matriz[i,10] = 1
  }
}

library("naivebayes")
### Train the Bernoulli Naive Bayes
colnames(matriz)=c("pinkfloyd","thebeatles","queen","oasis","radiohead","greenday",
                   "thestrokes","linkinpark","foofighters","coldplay")

### Train the Bernoulli Naive Bayes
y=as.factor(gustos_musicales$etiqueta)
modelo_pred <- bernoulli_naive_bayes(x = matriz, y = y)

#plot
plot(modelo_pred)
#Distribución marginal
coef(modelo_pred)

#mis gustos
mi_gusto=matrix(nrow=1,ncol=10)
colnames(mi_gusto)=c("pinkfloyd","thebeatles","queen","oasis","radiohead","greenday",
                   "thestrokes","linkinpark","foofighters","coldplay")

mi_gusto[1,1]=1
mi_gusto[1,2]=1
mi_gusto[1,3]=1
mi_gusto[1,4]=1
mi_gusto[1,5]=1
mi_gusto[1,6]=0
mi_gusto[1,7]=1
mi_gusto[1,8]=1
mi_gusto[1,9]=0
mi_gusto[1,10]=1

#predicción
predict(modelo_pred,newdata=mi_gusto,type = "prob")
