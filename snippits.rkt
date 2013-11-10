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
    var next = in;
    for(i <- in.values; j <- i
        if(!next.contains(j))) {
      val step = anaivestep(j);
      next += (j -> step);
    }
    if(in == next) {
      return next;
    } else {
      return anaivefix(next);
    }
  }") 0.6))

(define afix
  (scale (scode "def afix(in: Map[State,Set[State]]):
    Map[State,Set[State]] = {
  var next = in
  var producers =
    new Iterator[(State,StateProducer)]
      { ... }
  def getProducers(in: Set[State]) {
    val t = for(j <- in
                if (!next.contains(j)))
        yield (j -> new StateProducer(j))
    producers.extend(t)
  }
  for(i <- in) getProducers(i._2)
  for(i <- producers) {
    var tmpStep = Set[State]()
    for(j <- i._2.iterator) tmpStep ++= j
    next += (i._1 -> tmpStep)
    getProducers(tmpStep)
  }
  if(in == next)
    return next else return afix(next
}") 0.6))

(define anaiveapply
  (scale (scode "case ApplyState(f, x, s) => {
  val b = for (c <- x) yield aevalState(c)
  for(a <- aevalState(f)
      if (a.e.isInstanceOf[LambExp])
      if (a.e.asInstanceOf[
        LambExp].param.length == b.length))
    yield aapply(a, b, s);
}") 0.8))

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
}") 0.8))

(define hailstone
 (scale (code (letrec ((even? (λ (n)
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
