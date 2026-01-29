#!/bin/bash

# for landscape just insert page as is it
# for portrait insert page after rotation

# File name
PDF_FILE="print.pdf"

# Get page count
PAGE_COUNT=$(qpdf --show-npages "$PDF_FILE")

echo "" | ps2pdf - empty.pdf

# Check if even or odd
if [ $((PAGE_COUNT % 2)) -eq 0 ]; then
    echo "The PDF has an even number of pages: $PAGE_COUNT"
    
    PPDF_FILE="$PDF_FILE"
    
else
    echo "The PDF has an odd number of pages: $PAGE_COUNT"
    pdfunite "$PDF_FILE" empty.pdf print_d.pdf
    PPDF_FILE=print_d.pdf
fi


echo Final_q_pdf $PPDF_FILE

qpdf $PPDF_FILE --pages . 1-z:odd -- output_odd.pdf
qpdf $PPDF_FILE --pages . z-1:odd -- output_even_reversed.pdf


echo Final_q_pdfs generated


