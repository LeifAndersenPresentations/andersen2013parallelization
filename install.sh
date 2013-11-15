#!/usr/bin/env bash
raco pkg install slideshow-latex
for i in *.dot; do
    dot -Tsvg $i > `basename $i .dot`.svg
    dot -Tps $i > `basename $i .dot`.pdf
    dot -Tpdf $i > `basename $i .dot`.pdf
    dot -Tpng $i > `basename $i .dot`.png
    xsltproc notugly.xsl `basename $i .dot`.svg > `basename $$i .dot`-notugly.svg
    rsvg-convert -f pdf -o `basename $i .dot`-notugly.pdf `basename $$i .dot`-notugly.svg
    rsvg-convert -f ps -o `basename $i .dot`-notugly.ps `basename $$i .dot`-notugly.svg
    rsvg-convert -f png -o `basename $i .dot`-notugly.png `basename $$i .dot`-notugly.svg
    convert -resize 750 `basename $i .dot`-notugly.png `basename $i .dot`-small.png
done
