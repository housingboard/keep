#!/bin/bash


set -exu 

PDF_FILE="sbook.pdf"
PAGE_COUNT=$(qpdf --show-npages "$PDF_FILE")
PAGE_ORDER=$(php book.php "$PAGE_COUNT" sbook)
#php book.php $PAGE_COUNT

pdfjam sbook.pdf "$PAGE_ORDER" -o sbooked.pdf

#pdfjam --nup 2x1 --landscape --delta "1cm 0cm" --pagecommand '\thispagestyle{plain}'  booked.pdf -o print.pdf
pdfjam --nup 2x2 --pagecommand '' \
  sbooked.pdf -o book.pdf


./book.sh

