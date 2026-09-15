#!/bin/bash
PDF_FILE="book.pdf"
PAGE_COUNT=$(qpdf --show-npages "$PDF_FILE")
PAGE_ORDER=$(php book.php "$PAGE_COUNT")
#php book.php $PAGE_COUNT

pdfjam book.pdf "$PAGE_ORDER" -o booked.pdf

pdfjam --nup 2x1 --landscape --delta "1cm 0cm" --pagecommand '\thispagestyle{plain}'  booked.pdf -o print.pdf

./print.sh

#pdfjam --nup 2x1 --landscape --paper a4paper --scale 0.9 --delta "1cm 0cm" \
 # --pagecommand '\rule{0.4pt}{\paperheight}\thispagestyle{plain}' \
 # booked.pdf -o print.pdf


#pdfjam --nup 2x1 --landscape --paper a4paper --scale 0.9 --delta "1cm 0cm" \
 # --pagecommand '\thispagestyle{plain}' \
  #booked.pdf -o print.pdf
