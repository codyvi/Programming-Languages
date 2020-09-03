#lang racket

(define (sumList x)
  (if (null? x)
      0
      (if (number? (car x))
          (+ (car x) (sumList (cdr x)))
          (sumList (cdr x))
      )
  )
)


(sumList '(1 2 a 4))

(define (palindrome? x)
  (equal? x(reverse x))
)

(palindrome? '(a b c d e f))
(palindrome? '(a b c c b a))

(define (reversing x)
  (if (null? x)
      null
      (append (reversing (cdr x)) (list (car x)))
      )
)

(reversing '(1 2 3 4))

(define (access x y)
   (if (or (< y 0) (> y (length x)))
       null
      (if (= y 0)
          (car x)
          (access (cdr x) (- y 1))
          )
       )
  )

(access '(1 2 3) -1)

(define (oddPositionAux x y)
  (if (null? x)
      null
      (if(equal? #t y)
         (cons (car x) (oddPositionAux (cdr x) (not y)))
         (oddPositionAux (cdr x) (not y))
         )
      
     )
  )

(define(extract x)
  (oddPositionAux x #f)
)

(extract '(a 1 2 3 4 5 6))
