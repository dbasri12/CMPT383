#lang racket
(require "part1-rkt.rkt")

(define (insert-num x y)
  (if (null? x) y
      (if (null? y) x
	  (if (< (car x) (car y))
	        (cons (car x) (insert-num (cdr x) y))
		(cons (car y) (insert-num (cdr y) x))))))

(define (insertionsort-num x)
	(if (null? x) '()
		(insert-num (list (car x)) (insertionsort-num (cdr x)))))

(define (insert-str x y)
  (if (null? x) y
      (if (null? y) x
	  (if (string<=? (car x) (car y))
	        (cons (car x) (insert-str (cdr x) y))
		(cons (car y) (insert-str (cdr y) x))))))


(define (insertionsort-str x)
	(if (null? x) '()
		(insert-str (list (car x)) (insertionsort-str (cdr x)))))


(define (insert-rat x y)
  (if (null? x) y
      (if (null? y) x
          (if (r< (car x) (car y))
              (cons (car x) (insert-rat (cdr x) y))
              (cons (car y) (insert-rat (cdr y) x))))))

(define (insertionsort-rat x)
	(if (null? x) '()
		(insert-rat (list (car x)) (insertionsort-rat (cdr x)))))


;;RANDOM LIST NUMBER
(define (randomlist-num n mx)
  (cond
    [(= n 0) empty]
    [else
     (cons (- 10000 (random mx))
           (randomlist-num (- n 1) mx))]))

;;RANDOM LIST STRING

(define charset "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

(define (pick-random seq)
  (sequence-ref seq (random (sequence-length seq))))

(define (random-string [len 10])
  (list->string
    (map (lambda (x) (pick-random charset))
         (make-list len 10))))

(define (randomlist-str n)
  (cond
    [(= n 0) empty]
    [else
     (cons (random-string)
           (randomlist-str (- n 1)))]))

;;RANDOM LIST RATIONALS

(define (randomlist-rat n mx)
  (cond
    [(= n 0) empty]
    [else
     (cons (make-rational (random mx) (+ 1(random mx)))
           (randomlist-rat (- n 1) mx ))]))

(define (time-rat)
  (time void(insertionsort-rat (randomlist-rat 1000 10000)))
  (time void(insertionsort-rat (randomlist-rat 2000 10000)))
  (time void(insertionsort-rat (randomlist-rat 3000 10000)))
  (time void(insertionsort-rat (randomlist-rat 4000 10000)))
  (time void(insertionsort-rat (randomlist-rat 5000 10000)))
  (time void(insertionsort-rat (randomlist-rat 6000 10000)))
  (time void(insertionsort-rat (randomlist-rat 7000 10000)))
  (time void(insertionsort-rat (randomlist-rat 8000 10000)))
  (time void(insertionsort-rat (randomlist-rat 9000 10000)))
  (time void(insertionsort-rat (randomlist-rat 10000 10000))))

(define (time-num)
  (time void(insertionsort-num (randomlist-num 1000 10000)))
  (time void(insertionsort-num (randomlist-num 2000 10000)))
  (time void(insertionsort-num (randomlist-num 3000 10000)))
  (time void(insertionsort-num (randomlist-num 4000 10000)))
  (time void(insertionsort-num (randomlist-num 5000 10000)))
  (time void(insertionsort-num (randomlist-num 6000 10000)))
  (time void(insertionsort-num (randomlist-num 7000 10000)))
  (time void(insertionsort-num (randomlist-num 8000 10000)))
  (time void(insertionsort-num (randomlist-num 9000 10000)))
  (time void(insertionsort-num (randomlist-num 10000 10000))))

(define (time-str)
  (time (insertionsort-str (randomlist-str 1000)))
  (time (insertionsort-str (randomlist-str 2000)))
  (time (insertionsort-str (randomlist-str 3000)))
  (time (insertionsort-str (randomlist-str 4000)))
  (time (insertionsort-str (randomlist-str 5000)))
  (time (insertionsort-str (randomlist-str 6000)))
  (time (insertionsort-str (randomlist-str 7000)))
  (time (insertionsort-str (randomlist-str 8000)))
  (time (insertionsort-str (randomlist-str 9000)))
  (time (insertionsort-str (randomlist-str 10000))))









