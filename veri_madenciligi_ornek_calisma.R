
data("USArrests")#ABD’deki tutuklamaların bulunduğu veri seti


#Bu komutla veri çerçevesinin yapısını görürssünüz. Bu, veri çerçevesindeki her sütunun adını, türünü ve ilk birkaç değerini içerir. Ayrıca, veri çerçevesinde kaç tane gözlem (satır) ve değişken (sütun) olduğunu da gösterir.





#USArrests veri çerçevesindeki her sütun için bu özet istatistikleri alırsınız.
summary(USArrests)



#numeric olan değerleri integer'a çevirdik sonradan kullanacak olursak diye
murder<-as.integer(USArrests$Murder)
rape<-as.integer(USArrests$Rape)



#Kodumuz, USArrests veri setindeki Assault sütununu x adlı bir değişkene atar
x<- USArrests$Assault




#minimum x değeri
minx<-min(x)




#maximum x değeri
maxx<-max(x)



#USArrests veri setindeki Assault sütununu Min-Max normalizasyonu yöntemiyle normalleştirir. (0 ile 1 arasında)
minmax_x<- ((x-min(x))/(max(x)-min(x)))
print(minmax_x)

#USArrests veri setindeki Assault sütununu Z-Skor normalizasyonu yöntemiyle normalleştirir.
zscorex<- ((x-mean(x))/(sd(x)))
zscorex

#x, minmax_x ve zscorex değişkenlerini içeren bir veri çerçevesi oluşturur. Bu veri çerçevesi, USArrests veri setindeki Assault sütununun orijinal değerlerini (x), Min-Max normalleştirilmiş değerlerini (minmax_x) ve Z-Skor normalleştirilmiş değerlerini (zscorex) içerir.

df<-data.frame(x,minmax_x,zscorex)
df

#USArrests veri setindeki Assault sütununu clusterSim paketinin data.Normalization() fonksiyonu ile normalleştirir.
library(clusterSim)
attach(USArrests)
normalization_assault<-data.Normalization(Assault,type = "n1",normalization = "column")
normalization_assault

data.frame(Assault,normalization_assault)

library(caret)
df_assault<-data.frame(Assault = USArrests$Assault)
caret_norm <- preProcess(df_assault, method = c("center", "scale"))
normalized_df <- predict(caret_norm, newdata = df_assault)

data.frame(Assault,normalized_df)







