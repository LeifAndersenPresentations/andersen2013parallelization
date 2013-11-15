#lang slideshow

(require slideshow/play
         slideshow/code
         slideshow/latex
         slideshow/pict
         (for-syntax syntax/stx)
         "slideshow-macros.rkt")

(provide (all-defined-out))

(define anaivefix
  (scale (scode "def anaivefix(in: Map[State,Set[State]]):
      Map[State,Set[State]] = {
    var next = in
    for(i <- in.values; j <- i
        if(!next.contains(j))) {
      val step = anaivestep(j)
      next += (j -> step)
    }
    if(in == next) return next
    else           return anaivefix(next)
  }") 1))

(define afix
  (scale (scode "def aexplore(in: Map[State,Set[State]]):
    Map[State,Set[State]] = {
  var next = in
  var producers =
    new StateIterator[(State,StateProducer)]
  for(i <- in) getProducers(producers, i._2)
  for(i <- producers) {
    var tmpStep = Set[State]()
    for(j <- i._2.iterator) tmpStep ++= j
    next += (i._1 -> tmpStep)
    getProducers(producers, tmpStep)
  }
  return next
}") 1))

(define anaiveapply
  (scale (scode "case ApplyState(f, x, s) => {
  val b = for (c <- x) yield aevalState(c)
  for(a <- aevalState(f)
      if (a.e.isInstanceOf[LambExp])
      if (a.e.asInstanceOf[
        LambExp].param.length == b.length))
    yield aapply(a, b, s);
}") 1))

(define aapply
  (scale (scode "case ApplyState(f, x, s) => {
  val tmpProducers =
    for(c <- x) yield new EvalProducer(c);
  val b = for (c <- tmpProducers) yield {
    var tmpSet = Set[Closure]()
    for(i <- c.iterator) tmpSet ++= i
    tmpSet
  }
  for(a <- aevalState(f))
    yield closureToEval(aapply(a, b, s), s)
}") 1))

(define hailstone
 (scale (code
(letrec ((even? (λ (n)
    (if (= n 0)
      #t
      (if (= n 1)
        #f
        (even? (- n 2)))))))
  (letrec ((div2* (λ (n s)
      (if (= (* 2 n) s)
        n
        (if (= (+ (* 2 n) 1) s)
          n
          (div2* (- n 1) s))))))
    (letrec ((div2 (λ (n)
        (div2* n n))))
      (letrec ((hailstone* (λ (n count)
          (if (= n 1)
            count
            (if (even? n)
              (hailstone*
                (div2 n) (+ count 1))
              (hailstone*
                (+ (* 3 n) 1)
                (+ count 1)))))))
        (letrec ((hailstone (λ (n)
            (hailstone* n 0))))
          (hailstone 5))))))) 0.55))

(define rand-code
 (code
  (define (output t)
    (if (token? t)
        (let ([n (token-name t)]
              [v (token-value t)])
          (match n
            ['KEYWORD (display (format "(~a ~a)\n" n v))]
            ['LIT (display (format "(~a ~a)\n" n v))]
            [else (display (format "(~a \"~a\")\n" n v))]))
        (display (format "(~a)\n" t))))
  (define (call-lexer lexer ς port)
    (let ([ς* (lexer ς port)])
      (when ς* (call-lexer lexer ς* port))))
  (call-lexer lexer-code 'start
              (input-port-append
               #f (open-input-string "\n")
               (current-input-port)))))

(define fact5-table
  (frame
   (inset
    (table 2
           (list (t "Factorial Size") (t "Speedup")
                 (t "10")             (t "7.32")
                 (t "15")             (t "7.39")
                 (t "20")             (t "7.42"))
           (list* cc-superimpose)  ; left-align first column
                  ; cc-superimpose) ; h-center the rest
           cc-superimpose ; v-center all rows
           40 ; separate all columns by gap-size
           10) ; separate all rows by gap-size
    10)))

(define hail5-table
  (frame
   (inset
    (table 2
           (list (t "Hailstone Size") (t "Speedup")
                 (t "5")              (t "2.3"))
;22652

;52465
           (list* cc-superimpose)  ; left-align first column
                 ; cc-superimpose) ; h-center the rest
           cc-superimpose ; v-center all rows
           40 ; separate all columns by gap-size
           10) ; separate all rows by gap-size
    10)))

(define 7lines
  (code
   ; eval takes an expression and an environment to a value
(define (eval e env)
  (cond
    ((symbol? e)       (cadr (assq e env)))
    ((eq? (car e) 'λ)  (cons e env))
    (else              (apply (eval (car e) env)
                              (eval (cadr e) env)))))

; apply takes a function and an argument to a value
(define (apply f x)
  (eval (cddr (car f)) (cons (list (cadr (car f)) x)
                             (cdr f))))

; read and parse stdin, then evaluate:
(display (eval (read) '())) (newline)
))

(define for-loop
  (code (letrec ((lp1 (λ (i x)
                   (if (= 0 i) x
                       (letrec ((lp2
                                 (λ (j f y)
                                    (if (= 0 j)
                                        (lp1 (- i 1) y)
                                        (lp2 (- j 1) f
                                             (f y))))))
                         (lp2 10 (λ (n) (+ n i)) x))))))
          (lp1 10 0))))

