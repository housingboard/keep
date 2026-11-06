#!/bin/bash


source lib.sh
PDF_FILE="input/sbook.pdf"
PAGE_COUNT=$(qpdf --show-npages "$PDF_FILE")

case $1 in
    s4)

	cp input/sbook.pdf input/book.pdf   
	./book.sh
	PAGE_COUNT=$(qpdf --show-npages input/print.pdf)
	PAGE_ORDER=$(php book.php "$PAGE_COUNT" s4)
	pdfjam input/print.pdf "$PAGE_ORDER" --fitpaper true -o tmp/sbooked.pdf
	
	pdfjam --nup 1x2 --pagecommand '' \
	  tmp/sbooked.pdf -o input/print.pdf
	  
	./print.sh

        ;;
    s8)
        cp input/sbook.pdf input/book.pdf   
	./book.sh
	PAGE_COUNT=$(qpdf --show-npages input/print.pdf)
	PAGE_ORDER=$(php book.php "$PAGE_COUNT" s8)
	pdfjam input/print.pdf "$PAGE_ORDER" --fitpaper true -o tmp/sbooked.pdf
	
	pdfjam --nup 2x2 --landscape --pagecommand '' \
	  tmp/sbooked.pdf -o input/print.pdf
	  
	./print.sh
        ;;
    *)
      
      # 1 3
      # 2 4
      	PAGE_COUNT=$(qpdf --show-npages "$PDF_FILE")
	PAGE_ORDER=$(php book.php "$PAGE_COUNT" sbook)
	#php book.php $PAGE_COUNT

	pdfjam sbook.pdf "$PAGE_ORDER" -o tmp/sbooked.pdf

	#pdfjam --nup 2x1 --landscape --delta "1cm 0cm" --pagecommand '\thispagestyle{plain}'  booked.pdf -o print.pdf
	pdfjam --nup 2x2 --pagecommand '' \
	  tmp/sbooked.pdf -o book.pdf


	./book.sh
       
        ;;
esac



