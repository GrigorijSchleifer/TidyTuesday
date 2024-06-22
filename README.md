# TidyTuesday

*Explanotary Data Analysis* on the fly ... 

### Coolest snippets and pearls
```r
# selecting and specifying columns and droping the rest, pretty cool! 
mtcars_spec_cols <- read_csv(file = "mtcars.csv",
                             col_types = cols_only(hp = col_integer(),
                                                   am = col_integer(),
                                                   vs = col_factor(levels = c("1", "0"), 
                                                                   include_na = FALSE)))

```


```r
# nice way to combine data frames on equal dates contained in both data sets
sent_q1 <- sent[as.POSIXct(sent$Date) %in% agg_q1$date,]
```

```r
# changing column names the cool way
survey_dt_associations <- survey_data %>%
    select(questions_table_one_EJA_paper, GDP_PER_CAPITA, digital_index, dichte) %>%
    `colnames<-`(
        c(
            "when_complex",
            "when_simple",
            "accordance_complex",
            "accordance_simple",
            "legal_simple",
            "Re_do",
            "tech_internet",
            "tech_telefone",
            "ensuring_certain",
            "future",
            "pandemic_regulation",
            "GDP_PER_CAPITA", 
            "digital_index", 
            "dichte"
        )
    )
```

# Dates

```r
library(lubridate)
# creates the weeknumber as character that can be counted etc.
table(wday(r_downloads_year$date, label = TRUE))
```

```r
library(lubridate)
# counting by weeks
count(week = floor_date(date, "week"))

```

```r
# reordering variables in descending order, nice for graphs, not working if NAs are present
mutate(variable = fct_reorder(variable, reorder_by))
```

#### Horror movies EDA

![alt text](https://github.com/GrigorijSchleifer/TidyTuesday/blob/master/Images/horror-lines.png)


```r
# filter only 6 most common categories
mutate(distributor = fct_lump(distributor, n = 6)
```

```r
# turn the datafram upside down with row_numbers()
arrange(desc(row_number()))
```

```r
# extract the dacade out of the release_date
10 * floor(year(movie_profit$release_date) / 10)
```

```r
# creates a nice summarisation for multiple variables at once
summarise_at(vars(production_budget:worldwide_gross), median)
```


```r
# adding release year at the end of movies title
mutate(movie = paste0(movie, " (", year(release_date), " )")
```

# Graphs

```r
# custom labeling of the y or x axis ... damn cool 
scale_y_continuous(labels = function(x) paste0(x, "X"))
```

![Profit gross](https://github.com/GrigorijSchleifer/TidyTuesday/blob/master/Images/Best-horror-movies.png)


```r
# 44:14 x axis shoul be on a free scale and not similar for all facets
facet_wrap(~ distributor, scales = "free_x")
```

```r
# plot percents
library(scales)
cale_y_continuous(labels = percent_format())
```

# Country codes

```r
# converting EN, ES etc in readble country names
count(country = countrycode(country, "iso2c", "country.name"), sort = TRUE)
```
