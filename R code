# code for picture 1
# picture 1

# Have to repeat 6 times

m=50
l=5
x_0=c(10,10,10,10,10)/m
y_0=x_0*m
mat=matrix(0,nrow=1e3,ncol=l)
temp=1
samp=sample(1:5,1e3,replace = TRUE)
for(i in samp){
  y_0[i]=y_0[i]+1
  mat[temp,]=y_0/(m+temp)
  temp=temp+1
}

head(mat)
mat1=mat
mat2=mat
mat3=mat
mat4=mat
mat5=mat
mat6=mat

install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")


library(ggplot2)

library(dplyr)
library(tidyr)

# Assume mat1 to mat6 already exist and are 1000 x 6 matrices

# Create a list of matrices
mat_list <- list(mat1, mat2, mat3, mat4, mat5, mat6)
names(mat_list) <- paste0("case", 1:6)

# Convert to long data frame
long_data <- lapply(seq_along(mat_list), function(i) {
  mat <- mat_list[[i]]
  df <- as.data.frame(mat[, 1:5])  # Use only columns 1 to 5
  df$Time <- 1:nrow(df)
  df_long <- pivot_longer(df, cols = 1:5, names_to = "Series", values_to = "Value")
  df_long$Matrix <- names(mat_list)[i]
  return(df_long)
}) %>% bind_rows()

# Plot using ggplot
ggplot(long_data, aes(x = Time, y = Value, color = Series)) +
  geom_line() +
  facet_wrap(~ Matrix, nrow = 2, ncol = 3) +
  theme_minimal() +
  labs(x = "Time", y = "Value")



mat_list <- list(mat1, mat2, mat3, mat4, mat5, mat6)
row_list_list <- lapply(mat_list, function(mat) as.list(mat[1000, ]))
names(row_list_list) <- paste0("mat", 1:length(mat_list))
row_list_list
