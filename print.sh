#!/bin/bash

source lib.sh

# for landscape just insert page as is it
# for portrait insert page after rotation

# File name
PDF_FILE="input/print.pdf"

# Get page count
PAGE_COUNT=$(qpdf --show-npages "$PDF_FILE")

echo "" | ps2pdf - tmp/empty.pdf

# Check if even or odd
if [ $((PAGE_COUNT % 2)) -eq 0 ]; then
    echo "The PDF has an even number of pages: $PAGE_COUNT"
    
    PPDF_FILE="$PDF_FILE"
    
else
    echo "The PDF has an odd number of pages: $PAGE_COUNT"
    pdfunite "$PDF_FILE" tmp/empty.pdf tmp/print_d.pdf
    PPDF_FILE=tmp/print_d.pdf
fi


echo Final_q_pdf $PPDF_FILE

qpdf $PPDF_FILE --pages . 1-z:odd -- final/aside1.pdf
qpdf $PPDF_FILE --pages . 1-z:even -- final/aside2.pdf
#qpdf $PPDF_FILE --pages . z-1:odd -- final/aside2.pdf

ln -sfT aside1.pdf final/output_odd.pdf
ln -sfT aside2.pdf final/output_even.pdf
#ln -sfT aside2.pdf final/output_even_reversed.pdf

echo Final_q_pdfs generated
