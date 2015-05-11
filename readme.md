This program is a classic game of BlackJack written Scheme (a dialect of Lisp). The cards can
be represented using the symbols:
  - ace
  - two
  - three
  - four
  - five
  - six
  - seven
  - eight
  - nine
  - ten
  - jack
  - queen
  - king

Aces are worth 1 or 11, jacks queens and kings are worth 10 everything else is worth its own number value.
When the hand has one ace, the program counts it as 11 as long as the whole hand value is 21 or less count it as 1 otherwise. When the hand has more than one ace, only one of the aces can count as either 11 or 1, all other aces must count as 1 (since 11+11 is 22 which is > 21, clearly a maximum of one ace can be counted as 11). So, count one ace as 11 and all others as 1 if the whole hand value is 21 or less however, if that results in a whole hand value of 22 or more, then count all aces as 1.

----

The **dealer** program works by reading in a 2 card blackjack hand from the user. Then the user can choose to "stay" with the hand that they have, or they can enter another card and the program will compute the new value of the hand. The user can enter more cards until either the total is greater than 21 or the user entered the word "stay".


---

The **niceDealer** program works exactly the same way, but offers suggestions to the user whether s/he should hit or stay based on the value of the current hand. Regardless of the suggestion to the player, the user may enter another card or enter stay just like in the previous program.
