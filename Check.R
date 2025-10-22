# code to check

m=50
l=5
lambda=0.5
u=matrix(0,nrow=l,ncol=l)
for(i in 1:l){
  for(j in 1:l){
    if(i==j){
      u[i,j]=1
    }else if(j==i-1 || j==i+1){
      u[i,j]=lambda
    }else{
      u[i,j]=0
    }
  }
}
x_0=c(2,3,40,3,2)/m
y_0=x_0*m
mat=matrix(0,nrow=1e4,ncol=l)
temp=1
samp=sample(1:5,1e4,replace=TRUE)
for(i in samp){
  vec=u[i,]*y_0/(m+temp-1)
  index=which.max(vec)
  y_0[index]=y_0[index]+1
  mat[temp,]=y_0/(m+temp)
  temp=temp+1
}
mat[1e4,]

