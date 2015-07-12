Sparse Data Parser (SDP)
========================

## Objective
The goal of this project is to build a beautiful parser of data that can interpret matrix data (with a specific use-case being gene expression matrices) and construct basic interactive plots for data exploration and preliminary analyses.

## Organization
The application is organized into separate files as follows:

* `app.R` : The top-level application that sources the rest of the necessary files to build the app
* `header.R` : constructs the header bar
* `sidebar.R` : constructs the sidebar; specific pages are delineated here via the `tabName` function, and are similarly defined in `body.R`
* `body.R` : page-level construction of each `tabName` specified in `sidebar.R`
* `server.R` : provides interactivity and backend calculations to run SDP

## Acknowledgements
Stefan Avey constructed the underlying base, and Rob Amezquita applied a slick coat of paint on it.
