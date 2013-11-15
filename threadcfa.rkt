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
 (item "What is Abstract Interpretation?")
 'next
 'alts
 `((,(item "How can Control Flow Analysis be parallelized?"))
   (,(item "How can Control Flow Analysis be parallelized? (Using Scala)"))))

(pretty-slide
 (medium-text "What is Control Flow Analysis?"))

(start-pretty-slide
 (scale rand-code 0.8))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (inset
     (scale rand-code (+ (* n1 0.1) (* (- 1 n1) 0.8)))
     (- (* n1 650)) (- (* n1 250)) 0 0)))

(play-n
 #:skip-first? #t
 (λ (n1)
    (vl-append
     (scale rand-code 0.1)
     (ct-superimpose
      (inset
       (inset/clip
        (dot "concretestop")
        0 0
        (- (* 750 n1) 750)
        0)
       (- (* 750 n1) 750) 0 0 0)
      (ghost (dot "concreteloop")))
     (ghost (scale rand-code 0.1)))))

(play-n
 #:skip-first? #t
 (λ (n1)
    (vl-append
     (scale rand-code 0.1)
     (ct-superimpose
      (dot "concretestop")
      (inset
       (inset/clip
        (dot "concreteloop")
        (- (* 750 n1) 750)
        0 0 0)
       0 0 (- (* 750 n1) 750) 0))
     (ghost (scale rand-code 0.1)))))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (vl-append
     (scale rand-code 0.1)
     (ct-superimpose
      (dot "concretestop")
      (inset
       (inset/clip
        (dot "concreteloop")
        (- (* 750 n1))
        0 0 0)
       0 0 (- (* 750 n1)) 0))
     (ghost (scale rand-code 0.1)))))

(play-n
 #:skip-first? #t
 (λ (n1)
    (vl-append
     (scale rand-code 0.1)
     (ct-superimpose
      (inset/clip
       (dot "concreteforever")
       0 0
       (- (* 200 n1) 200)
       0)
      (ghost (dot "concreteloop")))
     (ghost (scale rand-code 0.1)))))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (vl-append
     (scale rand-code 0.1)
     (ct-superimpose
      (inset/clip
       (dot "concreteforever")
       0 0
       (- (* 200 (- 1 n1)) 200)
       0)
      (ghost (dot "concreteloop")))
     (ghost (scale rand-code 0.1)))))

(end-pretty-slide
 (vl-append
  (scale rand-code 0.1)
  (ct-superimpose
     (dot "concretestop")
     (ghost (dot "concreteloop")))
  (ghost (scale rand-code 0.1))))

(pretty-slide
 (scale (bitmap "exploreallquestion.jpg") 2))

(acronym-slide
 #:fade-out #f
 #:acronym (double-massive-text "CESK")
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

(pretty->flip-slide
 (large-text "Control"))

(flip->pretty-slide
 #:fade-out #f
 (large-text "Expression"))

(transition-slide
 #:header (large-text "Expression")
 (large-text "Environment"))

(play-n
 #:skip-last? #t
 (λ (n1)
    (vc-append 0
               (large-text "Expression")
               (scale
                (large-text "Environment")
                (max 0.001 (- 1 n1)) 1))))

(play-n
 #:skip-first? #t
 (λ (n1)
    (vc-append 0
               (large-text "Expression")
               (scale
                (large-text "Registers")
                (max 0.001 n1) 1))))

(transition-slide
 #:header (vc-append 0
                     (large-text "Expression")
                     (large-text "Registers"))
 (large-text "Store"))

(play-n
 #:skip-last? #t
 (λ (n1)
    (vc-append 0
               (large-text "Expression")
               (large-text "Registers")
               (scale
                (large-text "Store")
                (max 0.001 (- 1 n1)) 1))))

(play-n
 #:skip-first? #t
 (λ (n1)
    (vc-append 0
               (large-text "Expression")
               (large-text "Registers")
               (scale
                (large-text "Heap")
                (max 0.001 n1) 1))))

(transition-slide
 #:header (vc-append 0
                     (large-text "Expression")
                     (large-text "Registers")
                     (large-text "Heap"))
 (large-text "Kontinuation"))

(play-n
 #:skip-last? #t
 (λ (n1)
    (vc-append 0
               (large-text "Expression")
               (large-text "Registers")
               (large-text "Heap")
               (scale
                (large-text "Kontinuation")
                (max 0.001 (- 1 n1)) 1))))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (vc-append 0
               (large-text "Expression")
               (large-text "Registers")
               (large-text "Heap")
               (scale
                (large-text "Stack")
                (max 0.001 n1) 1))))

(end-pretty-slide
 (vc-append 0
            (large-text "Expression")
            (large-text "Registers")
            (large-text "Heap")
            (large-text "Stack")))

(start-pretty-slide
 (scale 7lines 0.9))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (fade-pict n1
               (scale 7lines 0.9)
               (double-massive-text "CE"))))

(header-slide
 #:fade-in #f
 #:fade-out #f
 #:append 'left
 #:header (double-massive-text "CE")
 (double-massive-text "K"))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
   (fade-pict n1
              (double-massive-text "CEK")
              (double-massive-text "E"))))

(shrink-transition-slide
 #:start-size double-massive-size
 #:end-size  large-size
 (t "E"))

(transition-slide
 #:append 'left
 #:header (large-text "E")
 (large-text "nvironment"))

(header-slide
 #:fade-in #f
 #:distance 25
 #:header (large-text "Environment")
 (vc-append 50
            (large-$$ "\\mathsf{VAR}\\rightarrow\\mathit{CLO} + \\mathbf{halt}")
            (vc-append 0
                       (medium-text "Where:")
                       (medium-$$ "\\mathit{CLO}=\\mathbf{Lambda}\\times\\mathit{Env}"))))

(insert-slide
 #:left   (double-massive-text "CE")
 #:right  (double-massive-text "K")
 #:insert (double-massive-text "S"))

(pretty-slide
 (vc-append 100
            (vc-append 0
                       (large-text "Environment")
                       (large-$$ "\\rho: \\mathsf{VAR}\\rightarrow\\mathit{Addr}"))
            (vc-append 0
                       (large-text "Store")
                       (large-$$ "\\sigma: Addr \\rightarrow \\mathit{CLO} + \\mathbf{halt}"))))

(start-pretty-slide
 (double-massive-text "CESK"))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (fade-pict n1
               (double-massive-text "CESK")
               (scale (dot #:small #t "singlestate") 1))))

(slide
 (scale (dot #:small #t "singlestate") 1))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (fade-pict n1
               (scale (dot #:small #t "singlestate") 1)
               (double-massive-text "CESK"))))

(slide
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
  (scale (code (λ (x) x)) 5))

(play-n
 #:skip-first? #t
 (λ (n1)
    (cc-superimpose
     (scale (code (λ (x) x)) 5)
     (cellophane (colorize (uber-massive-text "X") "red") n1))))

(play-n
 #:skip-first? #t
 (λ (n1)
    (fade-pict n1
               (cc-superimpose
                (scale (code (λ (x) x)) 5)
                (colorize (uber-massive-text "X") "red"))
               (scale (code (λ (x k)
                               (k x))) 5))))

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

(start-pretty-slide
 (double-massive-text "CES"))

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (vc-append 0
               (scale (double-massive-$$ "\\widehat{\\: \\: \\: \\: \\: \\: }") n1)
               (double-massive-text "CES"))))

(picture-slide
 #:fade-in #f
 #:fade-out #t
 (vc-append 0
            (double-massive-$$ "\\widehat{\\: \\: \\: \\: \\: \\: }")
            (double-massive-text "CES"))
 (scale (dot "abstract") 1.2)
 (scale (bitmap "exploreall.jpg") 2))

(pretty->flip-slide
 (medium-text "What is wrong with Control Flow Analysis?"))

(flip->pretty-slide
 (colorize (double-massive-text "SLOW") "red"))

(pretty-slide
 for-loop)

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (inset
     (inset/clip
      (scale (bitmap "before_screenshot.png") 0.8)
      0 0
      (- (* 750 n1) 750)
      0)
     (- (* 750 n1) 750) 0 0 0)))

(pretty->flip-slide
 #:fade-in #f
 (scale (bitmap "before_screenshot.png") 0.8))

(flip-slide
 (scale (bitmap "over9000.jpg") 1.25))

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

(pretty->flip-slide
 (massive-text "Where?"))

(transition-insert-slide
 #:insert (scale (dot "split") 3))

(picture-slide
 #:fade-in #f
 #:fade-out #t
 (scale (dot "split") 3)
 (scale (dot "split2") 2)
 (scale (dot "split3") 2))

(picture-slide
 #:fade-in #t
 #:fade-out #f
 (vc-append 25
            (medium-$$ "\\mathcal{I} : \\mathsf{Prog} \\to \\widehat{\\Sigma}")
            (medium-$$ "\\mathcal{I}(\\mathit{pr}) = (\\mathit{pr}, [], [])"))
 (scale (dot "actors1") 1.5)
 (scale (dot "actors2") 1.5)
 (scale (dot "actors3") 1.2)
 (scale (dot "actors") 1.2))

(start-pretty-slide
 anaivefix)

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
    (fade-pict n1
               anaivefix
               afix)))

(picture-slide
 #:fade-in #f
 #:fade-out #f
 afix
 anaiveapply)

(play-n
 #:skip-first? #t
 #:skip-last? #t
 (λ (n1)
   (fade-pict n1
              anaiveapply
              aapply)))

(end-pretty-slide
 aapply)

(pretty-slide
 (massive-text "Results"))

(start-pretty-slide
 (massive-text "Worst Case:"))

(transition-slide
 #:distance 25
 #:header (massive-text "Worst Case:")
 (massive-text "Omega"))

(pretty->flip-slide
 #:fade-in #f
 (massive-text "Worst Case:")
 (massive-text "Omega"))

(transition-insert-slide
 #:insert (scale (code ((λ (x) (x x))
                        (λ (x) (x x)))) 2))

(picture-slide
 #:fade-in #f
 #:fade-out #f
 (scale (code ((λ (x) (x x))
               (λ (x) (x x)))) 2)
 (massive-text "No Speedup"))

(transition-slide
 #:distance 25
 #:header (massive-text "No Speedup")
 (scale (dot "omega") 1.5))

(end-pretty-slide
 (massive-text "No Speedup")
 (scale (dot "omega") 1.5))

(start-pretty-slide
 (massive-text "Best Case:"))

(transition-slide
 #:distance 25
 #:header (massive-text "Best Case:")
 (massive-text "Factorial"))

(pretty->flip-slide
 #:fade-in #f
 (massive-text "Best Case:")
 (massive-text "Factorial"))

(flip->pretty-slide
 (scale (code (letrec ((f (λ (n)
         (if (= n 0)
              1
              (* n (f (- n 1)))))))
  (f 5))) 1))

(header-slide
 #:distance 25
 #:header fact5-table
 (scale (dot #:small #t "fact5") 1.3))

(start-pretty-slide
 (massive-text "Average Case:"))

(transition-slide
 #:distance 25
 #:header (massive-text "Average Case:")
 (large-text "Collatz Conjecture"))

(pretty->flip-slide
 #:fade-in #f
 (massive-text "Average Case:")
 (large-text "Collatz Conjecture"))

(flip->pretty-slide
 hailstone)

(header-slide
 #:distance 25
 #:header hail5-table
 (scale (dot #:small #t "hail5") 1.3))

(header-slide
 #:header (massive-text "Implementation")
 (t "https://github.com/LeifAndersen/CPSLambdaCalc"))

(pretty-slide
 (scale (bitmap "idontalways.jpg") 1.1))

(pretty-slide
 (massive-text "Questions?"))

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

