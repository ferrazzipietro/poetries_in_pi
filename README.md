# divina_commedia_in_pi
Is the first "terzina" of Dante's Divina Commedia encoded in the first million of decimal digits of pi?

Pi  is an irrational number with a decimal representation that “never ends” (3.14159265…). 
It means that you can find any arbitrary-long sequence of digits. In other words, you can find inside it whatever just encoding little sets of digits in the right way.

Let’s consider the first 4 pairs of digits. If you kind of translate them using the following chart, using the rule one pair=one character:
- 14 = “c”
- 15 = “i”
- 92 = “a”
- 65 = “o”
you will obtain the Italian word “ciao”. 

This was easy and naive, but we can extend the idea to the point of saying that the full Divina Commedia was contained in the pi decimals even before being written by Dante!

According to [1], in Dante’s masterpiece there are 408 476 characters (not considering the spaces). 
Assuming that we are not interested in finding capital letters, spaces, new lines, punctuation marks nor accents, we can use pairs of digits (100 in total) to identify the 21 Italian letters. Each letter will be encoded by 4 different pairs. In this way, the probability of having at each time the right letter is 4/100.

The probability of finding the full text starting from a random point in the sequence of decimals will be (4/100)^408 476 > 0. Difficult to find, but still possible!

At this point, what about finding the first mega-famous “terzina” 
(Nel mezzo del cammin di nostra vita/mi ritrovai per una selva oscura/ché la diritta via era smarrita) in the first million of decimals? Is it there?
The answer is __, as you can check at 

running from the command line: Rscript script.R 1000 --default-packages=dplyr, strgr