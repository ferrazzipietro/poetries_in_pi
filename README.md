# poetries_in_pi
Is the first "terzina" of Dante's Divina Commedia encoded in the first million of decimal digits of pi?

Pi  is an irrational number with a decimal representation that “never ends” (3.14159265…). 
It means that you can find any arbitrary-long sequence of digits.


Let’s consider the first 4 pairs of digits. If you kind of translate them using the following chart, using the rule one pair=one character:
- 14 = “c”
- 15 = “i”
- 92 = “a”
- 65 = “o”
you will obtain the Italian word “ciao”. 

We can extend the idea to the point of saying that all the poems written in the centuries are contained in the pi's decimals!

In this project I used the first million of decimal digits of pi (`1_milion_decimal_digits.txt`) to find the longest possible sequential part of whatever poem (`poetry.txt`) that exists in pi.

# Requirements
R installed on your machine. To download R go to https://cran.r-project.org.


# How to run

Add the poem text to the `poetry.txt` file. By default, there is the first terzina of Dante's Divina Commedia.

**Run from the command line:**

`% Rscript script.R [ NUMBER_OF_DIGITS ] --default-packages=dplyr, strgr`

NUMBER_OF_DIGITS: how many digits of pi you want to search through (minimum is length of poem, maximum is 1 million).

## Required libraries
The following libraries are required, and will be installed when `script.R` is run
- dplyr
- stringr
- stringi


# Extensions

Adding new decimal digits to the `1_milion_decimal_digits.txt` file will make you able to extend the search domain.
