# TidyTuesday

*Explanotary Data Analysis* on the fly ... 

### Coolest snippets and pearls


#### Analizing Majors

```r
# reordering variables in descending order, nice for graphs, not working if NAs are present
mutate(variable = fct_reorder(variable, reorder_by))
```

#### Horror movie EDA

```r
# extract the dacade out of the release_date
10 * floor(year(movie_profit$release_date) / 10)
```
