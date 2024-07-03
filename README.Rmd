---
title: "README"

output: html_notebook
---

### Tutorials

__Tutorial for beginners__

w3school - https://www.w3schools.com/r/default.asp

w3school 中文 - https://www.w3cschool.cn/r/

geeksforgeeks - https://www.geeksforgeeks.org/r-tutorial/?ref=lbp

### Setup R and IDE

Two steps, install R and install IDE. 

Refer to https://posit.co/download/rstudio-desktop/


### The diffrences among basic types

```{r}
# the vector: the basic type in R, every element is the same datatype
vector1 <- c(1,2,3)
class(vector1)  # numeric

# the most flexible and complex datatype, quite similar as JavaScript's object
list1 <- list(c(1,2,3)) # it could also be a list-like datatype
class(list1)          # list
sublist1 <- list1[1]  # [1] returns a sublist, instead of a element
element1 <- list1[[1]]  # [[1]] returns a element


# the matrix and the array are similar in some means. Its is J*K, or J*K*L one-dimension elements, logically organized as the dimension c(J, K) or c(J, K, L)
matrix()

array()

# the data frame is a table, with columns
df1 <- data.frame(id = c(1:3), name = c("Michael", "Jeffery", "Catty"))
class(df1)  # data type is "data.frame"

df1["id"] # get one column, "id"
df1[1]  # get one row, first row
df1[1, "name"]  # get one cell, "Michael"

df1 <- cbind(df1, data.frame(score = c(95, 60.1, 97.89))) # add one clone
df1 <- rbind(df1, c(id=5, name="NewB", score=12.3456789)) # add one row
df1

# A N-item factor is both a N-length vector and a M-length-unique-value vector(levels)  
fact1 <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz")) # N items
class(fact1)    # factor
levels(fact1)   # M unique values, ordered
fact1

# customized levels, add "other"
fact2 <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"), levels = c("Classic", "Jazz", "Pop", "Rock", "Other"))   # N items
fact2
```


### How to handle json object

```{r}
# define an object
data_list <- list(
  name = "John Doe",
  age = 30,
  interests = c("Photography", "Reading", "Mountain Biking"),
  address = list(
    street = "123 Elm St",
    city = "Somewhere",
    zip = "90210"
  )
)

# Convert a json object to a pretty string
pretty_json_string <- toJSON(data_list, pretty=2, auto_unbox = TRUE)
# pretty_json_string <- toJSON(data_list, pretty = TRUE)

# show json string
cat(pretty_json_string)

# read a json object from a string
json_obj <- toJSON(pretty_json_string)

# read a json object from a file
a_file_path <- ""
json_obj <- fromJSON(a_file_path)

# get object's property
print(json_obj$interests[[1]])

# write string to a file
writeLines(pretty_json_string, a_file_path)
```

### How to use regexp

```{r}
# solution 1
filename <- "abc_003.json"
digits <- sub(".*_([0-9]+)\\..*", "\\1", filename)
print(digits)

# solution 2
filename <- "abc_003.json"
match_info <- regexpr("[0-9]+", filename)
digits <- regmatches(filename, match_info)
print(digits)

# solution 3 - stringr library
library(stringr)
filename <- "abc_003.json"
digits <- str_extract(filename, "[0-9]+")
print(digits)

```

### Find all files in a folder 

```{r}
folder_path <- "."
pattern <- "\\.py$"

# List all files that match the pattern in the specified directory
txt_files <- list.files(path = folder_path, pattern = pattern, full.names = FALSE)
print(txt_files)
```

### How to use a library
```{r}
if (!require(dplyr)) {
  install.packages("dplyr")
  library(dplyr)
} else {
  library(dplyr)
}
```

### Use library `dplyr` to process `data frame` as a table
```{r}

```

 