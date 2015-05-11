This program that determines the value of a Blackjack hand. The cards can
be represented using the symbols below:
(ace two three four five six seven eight nine ten jack queen king)

;; Aces are worth 1 or 11, jacks queens and kings are worth 10
;; everything else is worth its own number value. Create an association
;; list (a list of the dotted pairs) to match the card names with the
;; values which are:
;; 1 2 3 4 5 6 7 8 9 10 10 10 10
;; but ace can be 1 or 11 (handle that any way you like)

;; You must have a function that takes in a hand as a list (of any length) like:
;; (jack three five) and in this case should return the value 18.

;; When the hand has one ace, count it as 11 as long as the whole hand
;; value is 21 or less count it as 1 otherwise.

;; When the hand has more than one ace, only one of the aces can count as
;; either 11 or 1, all other aces must count as 1 (since 11+11 is 22 which is > 21,
;; clearly a maximum of one ace can be counted as 11). So, count one ace as 11 and
;; all others as 1 if the whole hand value is 21 or less however, if that
;; results in a whole hand value of 22 or more, then count all aces as 1

;; examples with aces:
;; (ace two ace five)
;; should return 19 (one ace is counted as 11 the other as 1)

;; (ace five ace ten)
;; should return 17 (both aces counted as 1 because if either was counted as 11,
;; hand value would be > 21)

;; (ten ace)
;; should return 21

;; (five jack ace)
;; should return 16



;;13) Use the function(s) you created above and add more function(s) to create a
;; complete program that does the following: read in a 2 card blackjack hand
;; from the user then read the following from the user: if the user enters another
;; card, add it to the list of cards in the hand and compute and print the new value
;; and display the hand. If the user enters the word "stay", then end the program.
;; Allow the user to enter more cards until either the total is greater than 21 or
;; the user entered the word "stay"




;;14) Use the function(s) you created above and add more function(s) to create
;; a complete program that does the following: read in a 2 card blackjack
;; hand from the user then suggest to the user whether s/he should hit or stay
;; (output "hit" if the total is 16 or less, output "stay" otherwise). Regardless
;; of what your program suggests to the player, the user may enter another card
;; or enter stay and it should act just like in problem 13, except after each
;; added card, suggest whether or not to hit/stay.
