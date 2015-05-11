
;;;; This function starts the program ;;;;
(define (dealer)
  (stayOrLoss (enterHand))
)

;;;; Defining all the card values as dotted pairs ;;;;
(define cardvalues '((ace . 11) (two . 2) (three . 3) (four . 4) (five . 5) (six . 6) (seven . 7)
              (eight . 8) (nine . 9) (ten . 10) (jack . 10) (queen . 10) (king . 10)  (ace1 . 1)))


;;;; This function will determine the maximum permitted value of a hand by 'weakening' strong
;;;; aces until there aren't any left to weaken or the hand value is under 22 ;;;;
(define (handValue n)
  (cond
    ((containsStrongAce? n)
      (cond
        ((> 22 (simpleHandValue n)) (simpleHandValue n))
        (else (handValue (replaceOne 'ace 'ace1 n)))
        )
      )
    (else (simpleHandValue n))
    )
  )

;;;; This function determines the value of a hand. Aces are passed in as Ace which evaluates to 11 or 1 ;;;;
(define (simpleHandValue n)
  (cond
    ((equal? n '()) 0)
    (else (+ (cdr (assoc (car n) cardvalues)) (simpleHandValue (cdr n))))
  )
)

;;;; This function searches a list and replaces the first 'target' with the 'new'. Used by handValue to weaken aces. ;;;;
(define (replaceOne target new n)
  (cond
    ((equal? n '()) '())
    ((eq? (car n) target) (cons new (cdr n)))
    (else (cons (car n) (replaceOne target new (cdr n))))
  )
)

;;;; This function searches a list to see if it contains a strong ace ('ace'). ;;;;
(define (containsStrongAce? n)
  (cond
    ((equal? n '()) #f)
    ((eq? 'ace (car n)) #t)
    (else (containsStrongAce? (cdr n)))
  )
)


;;;; This function prompts the user to input two cards. User is expected to input two correct card names ;;;;
(define (enterHand)
  (display '(Enter a blackjack hand: ))(newline)
  (let ((inp (read)))
    (cons inp (enterCard))
    )
  )

;;;; Stores the user input ;;;;
(define (enterCard)
  (let ((inp (read)))
    (cons inp '())
  )
)

;;;; This function displays the total value of the hand and the cards in the hand.
;;;; The user can then choose to enter another valid card or "stay" to end the program ;;;;
;;;; If the value of the hand exceeds 21, then the program says "you lost" and quits ;;;;
(define (stayOrLoss n)
  (display (handValue n)) (newline)
  (display n) (newline)
  (display '(enter a card or stay to quit:))(newline)
  (cond
    ((> 22 (handValue n)) (let ((inp (read)))
      (cond
        ((eq? inp 'stay) (display (handValue n)) (newline) (display n) (newline))
        (else (stayOrLoss (joinLists n (cons inp '()) ) ) )
      )
      )
    )
    (else (display 'you_lost ))
  )
)

;;;; Takes two lists and joins them together ;;;;
(define (joinLists n m)
    (cond
    ((equal? n '()) m)
    (else (cons (car n) (joinLists (cdr n) m)))
  )
)







;;;; This function starts the same program but with suggested moves for the player ;;;;
(define (niceDealer)
  (stayOrLossWise (enterHand))
)

;;;; This function checks the value of the hand entered and advises the user to stay or hit ;;;;
;;;; depending on the value of the hand. The user can then choose to stay and end the program
;;;; or enter another card. After each hit, the user is shown the total value of the hand and advised again ;;;;
;;;; If the value of the hand exceeds 21, the program will quit and the user will be told "you lost" ;;;;
(define (stayOrLossWise n)
  (display (handValue n)) (newline)
  (display n) (newline)
  (display '(enter a card or stay to quit:))(newline)
  (cond
    ((> 17 (handValue n)) (display 'hit) (newline))
    (else (display 'stay)(newline))
  )
  (cond
    ((> 22 (handValue n ) ) (let ((inp (read)))
      (cond
        ((eq? inp 'stay) (display (handValue n))(newline)(display n) (newline))
        (else (stayOrLossWise (joinLists n (cons inp '()) )))
      )
    )
    )
    (else (display 'you_lost ))
  )
)
