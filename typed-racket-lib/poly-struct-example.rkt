#lang racket

(module a "typed/racket.rkt"
  (struct: (A) Queue ([l : (Listof (Pair A A))]))

  (: enqueue (All (A) (A (Queue A) -> (Queue A))))
  (define (enqueue a q) (Queue (cons (cons a a) (Queue-l q))))

  (provide Queue Queue-l enqueue))

(require 'a)

(time
 (length
  (Queue-l
   (for/fold ([acc (Queue '())])
             ([i (range 10000)])
     (enqueue i acc)))))