#!/bin/bash


source lib.sh

PDF_FILE="input/book.pdf"
PAGE_COUNT=$(qpdf --show-npages "$PDF_FILE")
PAGE_ORDER=$(php book.php "$PAGE_COUNT")
#php book.php $PAGE_COUNT

pdfjam $PDF_FILE "$PAGE_ORDER" -o tmp/booked.pdf

#pdfjam --nup 2x1 --landscape --delta "1cm 0cm" --pagecommand '\thispagestyle{plain}'  booked.pdf -o print.pdf
pdfjam --nup 2x1 --landscape --delta "1cm 0cm" --pagecommand '' \
  tmp/booked.pdf -o input/print.pdf


./print.sh

#pdfjam --nup 2x1 --landscape --paper a4paper --scale 0.9 --delta "1cm 0cm" \
 # --pagecommand '\rule{0.4pt}{\paperheight}\thispagestyle{plain}' \
 # booked.pdf -o print.pdf


#pdfjam --nup 2x1 --landscape --paper a4paper --scale 0.9 --delta "1cm 0cm" \
 # --pagecommand '\thispagestyle{plain}' \
  #booked.pdf -o print.pdf

