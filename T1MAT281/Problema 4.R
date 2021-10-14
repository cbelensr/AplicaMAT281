attach(datos_heart_disease) 
vector=c() #vector vacio
for(i in 1:462){
  if(datos_heart_disease$famhist[i]=="Absent"){
    vector[i]=0
  }
  else{
    vector[i]=1
  }
}
modelo_log<-glm(chd~sbp+tobacco+ldl+vector+obesity+alcohol+age,
                family=binomial(link="logit"))
summary(modelo_log)

#Variables menos significativa, z value menor en abs ó mayor Pr(z), mientras más * más significativo es
modelo_log<-glm(chd~sbp+tobacco+ldl+vector+obesity+age,
                family=binomial(link="logit")) #eliminamos alcohol
summary(modelo_log)

modelo_log<-glm(chd~tobacco+ldl+vector+obesity+age,
                family=binomial(link="logit")) #eliminamos sbp
summary(modelo_log)

modelo_log<-glm(chd~tobacco+ldl+vector+age,
                family=binomial(link="logit")) #eliminamos obesity
summary(modelo_log)
