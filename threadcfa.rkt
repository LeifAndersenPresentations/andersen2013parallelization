#lang slideshow

(require slideshow/play
         slideshow/code
         slideshow/latex
         slideshow/pict
         (for-syntax syntax/stx)
         "slideshow-macros.rkt")

(require "snippits.rkt")

(title-slide
 (medium-large-text "Parallelization of")
 (medium-large-text "Abstracted Abstract Machines")
 (colorize (medium-text "Leif Andersen") "blue")
 (colorize (medium-text "Matthew Might") "blue")
 (colorize (t "University of Utah") "red"))

(pretty-slide
 (item "What is Control Flow Analysis?")
 'next
 (item "What is CESK?")
 'next
 (item "How can k-CFA be parallelized?"))

(start-pretty-slide
 (large-text "Control")
 (large-text "Environment")
 (large-text "Store")
 (large-text "Kontinuation"))

(transition-acronym-slide
 #:reversed #t
 #:acronym (double-massive-text "CESK")
 (large-text "Control")
 (large-text "Environment")
 (large-text "Store")
 (large-text "Kontinuation"))

(slide
 (double-massive-text "CESK"))

(shrink-transition-slide
 #:start-size double-massive-size
 #:end-size large-size
 (t "CESK"))

(transition-slide
 #:header (large-text "CESK")
 (scale (dot "x86") 5))

(slide
 (vc-append 0
            (large-text "CESK")
            (scale (dot "x86") 5)))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (vc-append 0
               (large-text "CESK")
               (scale
                (scale (dot "x86") 5)
                (max 0.001 (- 1 n1)) 1))))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (vc-append 0
               (large-text "CESK")
               (scale
                (scale (dot "lambda") 5)
                (max 0.001 n1) 1))))

(end-pretty-slide
 (vc-append 0
            (large-text "CESK")
            (scale (dot "lambda") 5)))

(play-n
 #:skip-first? #t
 (λ (n1)
    (ct-superimpose
     (inset
      (inset/clip
       (dot "concretestop")
       0 0
       (- (* 750 n1) 750)
       0)
      (- (* 750 n1) 750) 0 0 0)
     (ghost (dot "concreteloop")))))

(play-n
 #:skip-first? #t
 (λ (n1)
    (ct-superimpose
     (dot "concretestop")
     (inset
      (inset/clip
       (dot "concreteloop")
       (- (* 750 n1) 750)
       0 0 0)
      0 0 (- (* 750 n1) 750) 0))))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (ct-superimpose
     (dot "concretestop")
     (inset
      (inset/clip
       (dot "concreteloop")
       (- (* 750 n1))
       0 0 0)
      0 0 (- (* 750 n1)) 0))))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (ct-superimpose
     (inset/clip
      (dot "concreteforever")
      0 0
      (- (* 200 n1) 200)
      0)
     (ghost (dot "concreteloop")))))

(picture-slide
 #:fade-in #f
 #:fade-out #t
 (ct-superimpose
  (dot "concreteforever")
  (ghost (dot "concreteloop")))
 (scale (dot "abstract") 1.2))

(start-pretty-slide
 (double-massive-text "CESK"))

(transition-slide
 #:reversed #t
 #:append 'left
 #:header (double-massive-text "CES")
 (double-massive-text "K"))

(pretty->flip-slide
 #:fade-in #f
 (double-massive-text "CES"))

(flip->pretty-slide
 (vc-append 100
            (medium-text "Continuation Passing Style")
            (scode "<cexp> ::= (<aexp> <aexp>*)
<aexp> ::= (λ (<var>*) <cexp>)
        |  <var>
        |  <halt>")))

(start-pretty-slide
 (large-text "Control")
 (large-$$ "\\varsigma: \\mathsf{EXP}\\times\\mathit{ENV}\\times\\mathit{Store}"))

(transition-slide
 #:distance 25
 #:reversed #t
 #:header (large-text "Control")
 (large-$$ "\\varsigma: \\mathsf{EXP}\\times\\mathit{ENV}\\times\\mathit{Store}"))

(transition-slide
 #:distance 25
 #:header (large-text "Control")
 (large-$$ "\\varsigma: \\mathsf{EXP}\\times\\widehat{\\mathit{ENV}}\\times\\widehat{\\mathit{Store}}"))

(end-pretty-slide
 (large-text "Control")
 (large-$$ "\\varsigma: \\mathsf{EXP}\\times\\widehat{\\mathit{ENV}}\\times\\widehat{\\mathit{Store}}"))

(start-pretty-slide
 (large-text "Environment")
 (large-$$ "\\rho: \\mathsf{VAR}\\rightarrow\\mathit{Addr}"))

(transition-slide
 #:reversed #t
 #:distance 25
 #:header (large-text "Environment")
 (large-$$ "\\rho: \\mathsf{VAR}\\rightarrow\\mathit{Addr}"))

(transition-slide
 #:distance 25
 #:header (large-text "Environment")
 (large-$$ "\\rho: \\mathsf{VAR}\\rightarrow\\widehat{\\mathit{Addr}}"))

(end-pretty-slide
 (large-text "Environment")
 (large-$$ "\\rho: \\mathsf{VAR}\\rightarrow\\widehat{\\mathit{Addr}}"))

(start-pretty-slide
 (large-text "Store")
 (large-$$ "\\sigma: Addr \\rightarrow \\mathit{CLO} + \\mathbf{halt}"))

(transition-slide
 #:reversed #t
 #:distance 25
 #:header (large-text "Store")
 (large-$$ "\\sigma: Addr \\rightarrow \\mathit{CLO} + \\mathbf{halt}"))

(transition-slide
 #:distance 25
 #:header (large-text "Store")
 (large-$$ "\\sigma: \\widehat{Addr} \\rightarrow \\mathcal{P}(\\widehat{\\mathit{CLO}} + \\mathbf{halt})"))

(end-pretty-slide
 (large-text "Store")
 (large-$$ "\\sigma: \\widehat{Addr} \\rightarrow \\mathcal{P}(\\widehat{\\mathit{CLO}} + \\mathbf{halt})"))

(pretty->flip-slide
 (double-massive-text "CES"))

(flip->pretty-slide
 (double-massive-$$ "\\widehat{\\mathbf{CES}}"))

(pretty->flip-slide
 (medium-text "What is wrong with Control Flow Analysis"))

(flip->pretty-slide
 #:fade-out #f
 (colorize (double-massive-text "SLOW") "red"))

(transition-slide
 #:header (colorize (double-massive-text "SLOW") "red")
 (large-text "Use Widening"))

(transition-slide
 #:reversed #t
 #:append 'bottom
 (colorize (double-massive-text "SLOW") "red")
 #:header (large-text "Use Widening"))

(pretty->flip-slide
 #:fade-in #f
 (large-text "Use Widening"))

(flip->pretty-slide
 #:fade-out #f
 (massive-text "Loses Precision"))

(picture-slide
 #:fade-in #f
 #:fade-out #f
 (massive-text "Loses Precision")
 (large-text "Solution:"))

(transition-slide
 #:distance 25
 #:header (large-text "Solution:")
 (massive-text "Parallelization"))

(end-pretty-slide
 (large-text "Solution:")
 (massive-text "Parallelization"))

(pretty-slide
 (massive-text "Where?"))

(pretty-slide
 #:title "Where?"
 (item "Explore")
 'next
 (item "Function Application"))

(pretty-slide
 (large-$$ "\\mathit{explore} : \\Sigma \\to \\mathcal{P}(\\Sigma)")
 ;(large-$$ "\\mathit{explore}(\\varsigma) = \\{ \\varsigma' \\mathrel{|} \\varsigma \\Rightarrow^* \\varsigma' \\}"))
 ;(large-$$ "\\mathit{explore}(\\varsigma) = \\{ \\varsigma' \\mathrel{|} \\varsigma \\leadsto^* \\varsigma' \\}"))
 (large-$$ "\\mathit{explore}(\\varsigma) = \\{ \\varsigma' \\mathrel{|} \\varsigma \\rightarrow^* \\varsigma' \\}"))

(pretty-slide
 (medium-$$ "\\mathcal{A}: \\mathsf{ENV}\\times\\widehat{\\mathit{ENV}}\\times\\widehat{\\mathit{Store}}")
 ;(medium-$$ "\\sembr({(\\lambda\\; (v_1 \\ldots v_n)\\; \\mathit{ce})},\\rho') = \\mathcal{A}(f,\\rho,\\sigma)"))
 (medium-$$ "[({(\\lambda\\; (v_1 \\ldots v_n)\\; \\mathit{ce})}],\\rho') = \\mathcal{A}(f,\\rho,\\sigma)"))

(pretty->flip-slide
 (scale (dot "split") 3))

(transition-insert-slide
 #:insert (scale (dot "actors") 1.5))

(picture-slide
 #:fade-in #f
 #:fade-out #f
 (scale (dot "actors") 1.5)
 (vc-append 25
            (medium-$$ "\\mathcal{I} : \\mathsf{Prog} \\to \\widehat{\\Sigma}")
            (medium-$$ "\\mathcal{I}(\\mathit{pr}) = (\\mathit{pr}, [], [])"))
 anaivefix)

(transition-insert-slide
 #:reversed #t
 #:insert anaivefix)

(transition-insert-slide
 #:insert afix)

(picture-slide
 #:fade-in #f
 #:fade-out #f
 afix
 anaiveapply)

(transition-insert-slide
 #:reversed #t
 #:insert anaiveapply)

(transition-insert-slide
 #:insert aapply)

(end-pretty-slide
 aapply)

(pretty-slide
 (massive-text "Results"))

(pretty->flip-slide
 (massive-text "Omega"))

(flip->pretty-slide
 #:fade-out #f
 (scale (code ((λ (x) (x x))
               (λ (x) (x x)))) 2))

(transition-slide
 #:distance 25
 #:header (scale (code ((λ (x) (x x))
                        (λ (x) (x x)))) 2)
 (scale (dot "omega") 1.5))

(picture-slide
 #:fade-in #f
 #:fade-out #t
 (vc-append 25
            (scale (code ((λ (x) (x x))
                          (λ (x) (x x)))) 2)
            (scale (dot "omega") 1.5))
 (massive-text "Speedup: 1"))

(pretty->flip-slide
 (massive-text "Factorial"))

(flip->pretty-slide
 (scale (code (letrec ((f (λ (n)
         (if (= n 0)
              1
              (* n (f (- n 1)))))))
  (f 5))) 1))

(pretty-slide
 (frame
  (inset
   (table 2
          (list (t "Factorial Size") (t "Speedup")
                (t "0")              (t "4.75")
                (t "5")              (t "8.87")
                (t "10")             (t "7.32")
                (t "15")             (t "7.39")
                (t "20")             (t "7.42"))
          (list* cc-superimpose)  ; left-align first column
                 ; cc-superimpose) ; h-center the rest
          cc-superimpose ; v-center all rows
          40 ; separate all columns by gap-size
          10) ; separate all rows by gap-size
  10)))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (inset
     (inset/clip
      (dot #:small #t "fact5")
      0 0
      (- (* 750 n1) 750)
       0)
     (- (* 750 n1) 750) 0 0 0)))

(end-pretty-slide
 (dot #:small #t "fact5"))

(pretty->flip-slide
 (large-text "Hailstone Sequence"))

(flip->pretty-slide
 hailstone)

(pretty-slide
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
(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (inset
     (inset/clip
      (dot #:small #t "hail5")
      0 0
      (- (* 750 n1) 750)
       0)
     (- (* 750 n1) 750) 0 0 0)))

(end-pretty-slide
 (dot #:small #t "hail5"))

(header-slide
 #:header (massive-text "Implementation")
 (t "https://github.com/LeifAndersen/CPSLambdaCalc"))

(pretty-slide
 (massive-text "Questions?"))

