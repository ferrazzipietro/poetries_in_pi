# divina_commedia_in_pi
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

In this project I used the first million of decimal digits of pi (1_milion_decimal_digits.txt) to find the longest possible part of whatever poem (poetry.txt).

# How to run

Add the poem text to the poetry.txt file. By default there is the first terzina of Dante's Divina Commedia.

**Run from the command line:**

% Rscript script.R NUMBER_OF_DIGITS --default-packages=dplyr, strgr

NUMBER_OF_DIGITS: how many digits you want to search in (maximum is 1 million).


# Extensions

Adding new decimal digits to the 1_milion_decimal_digits.txt file will make you able to extend the search domain.
