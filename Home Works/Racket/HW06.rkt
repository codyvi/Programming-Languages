#lang racket

;; ====================
;; Complete the following functions and submit your file to Canvas.
;; ====================
;; Do not change the names of the functions. 
;; Do not change the number of arguments in the functions.
;; If your file cannot be loaded by the Racket interpreted, your submission may be cancelled. Then, submit only code that works.
;; ====================
;; Grading instructions:
;; There is a series of test cases for each function. In order to state that your function "works as described", your output must be similar to the expected one in each case.

;; === sum ===

(define (sum matrix)
	(apply + (map (lambda (mat) (apply + mat)) matrix))
)

(display "=== sum ===\n")
(sum '((1 2 3) (4 5 6) (7 8 9))) ;; 45
(sum '((1 2) (30 40) (5 6) (70 80))) ;; 234
(sum '((8 9 5 6 7) (3 4 5 4 2))) ;; 53

;; === complete? ===

(define (help graph len)
  (filter (lambda (x) (not (equal? x len))) graph)
  )


(define (complete? graph)
  (null? (help (map (lambda (x) (length x)) graph) (length graph)))
)

(display "=== complete? ===\n")
(complete? '((a b c) (b a c) (c a b) (d e) (e d))) ;; #f
(complete? '((a b) (b a))) ;; #t
(complete? '( (a c) (b a) (c a))) ;; #f

;; === msort ===

(define (merge list1 list2)
  (cond
    ((null? list1)
     list2)
    ((null? list2)
     list1)
    (else
      (let ((head1 (car list1))
            (head2 (car list2)))
        
        (if (<= head1 head2)
          (cons
            head1
            
            (merge (cdr list1) list2))
          (cons
            head2
            
            (merge list1 (cdr list2))))))))

(define (split lst)
  (cons (take lst (quotient (length lst)2)) (drop lst (quotient (length lst)2)))
  )

(define (msort lst)
        (if (null? lst)
            lst
             (if (null? (cdr lst))
                 lst
                 (merge (msort (car (split lst))) (msort (cdr (split lst))))
                 )
            )          
)

(display "=== msort ===\n")
(msort '()) ;; '()
(msort '(1)) ;; '(1)
(msort '(10 35 8 2.6 4.7 12)) ;; '(2.6 4.7 8 10 12 35)
(msort '(1 4 7 9 3 4 8 10)) ;; '(1 3 4 4 7 8 9 10)

;; === sold-units ===

;; This should not be done! (but it helps)
(define sales 
  '(
    (105 (10 3) (4 2) (9 3))
    (106 (6 4) (8 1) (4 6))
    (107 (9 7) (12 1) (14 1) (10 4))
    (108 (4 1))
    (109 (7 21) (10 4) (14 6) (5 3))
  )
)

(define (sold-units id sales)
  	(apply + (map (lambda (p) (cadar p)) (filter  (lambda (z) (not(null? z))) (map (lambda (x) (filter (lambda (y) (equal? id (car y))) (cdr x))) sales))))
)

(display "=== sold-units ===\n")
(sold-units 2 sales) ;; 0
(sold-units 9 sales) ;; 10
(sold-units 10 sales) ;; 11
(sold-units 14 sales) ;; 7

;; === insert ===

(define (insert x tree)
  (cond
    ((null? tree) (list x '() '()))
     ((< x (car tree))(list (car tree) (insert x (cadr tree))(caddr tree)))
     ((> x (car tree))(list (car tree) (cadr tree)(insert x (caddr tree))))
    )
)

(display "=== insert ===\n")
(insert 1 '()) ;; '(1 () ())
(insert 3 '(1 () (5 () ()))) ;; '(1 () (5 (3 () ()) ()))
(insert 0 '(1 () (5 (3 () ()) (6 () ())))) ;; '(1 (0 () ()) (5 (3 () ()) (6 () ())))

;; == set ===
(define (helper lst)
  (if (null? lst)
      '()
      (if (not (exist? (car lst) (cdr lst)))
          (cons (car lst) (helper (cdr lst)))
          (helper (cdr lst))
              )
      )
) 


(define (exist? x lst)
 (if (equal? #f (member x lst))
      #f
      #t
      )
)

(define (set lst)
  (helper (filter number? lst))
)

(display "=== set ===\n")
(set '(1 2 3 2 4 a (1 2) 5 2 3)) ;; '(1 4 5 2 3)
(set '(a b 3 4)) ;; '(3 4)
(set '(10 (a b 3) 4 (8) c d (a b 3) d c 11)) ;; '(10 4 11)

(define (union x y)
  	(set(append x y))
)

(display "=== union ===\n")
(union '(1 2 3 4) '(3 4 5 6)) ;; '(1 2 3 4 5 6)
(union '(10 2 8 4) '()) ;; '(10 2 8 4)
(union '(2 a 8 4) '(b c d)) ;; '(2 8 4)

(define (helper2 lst)
  (if (null? lst)
      '()
      (if (exist? (car lst) (cdr lst))
          (cons (car lst) (helper2 (cdr lst)))
          (helper2 (cdr lst))
              )
      )
) 

(define (intersection x y)
  	 (helper2 (append x y))
)

(display "=== intersection ===\n")
(intersection '(1 2 3 4) '(3 4 5 6)) ;; '(3 4)
(intersection '(10 2 8 4) '()) ;; '()
(intersection '(2 a 8 4) '(b c 8 d)) ;; '(8)
