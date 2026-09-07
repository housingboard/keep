#!/bin/bash
PDF_FILE="book.pdf"
PAGE_COUNT=$(qpdf --show-npages "$PDF_FILE")
PAGE_ORDER=$(php book.php "$PAGE_COUNT")
#php book.php $PAGE_COUNT

pdfjam book.pdf "$PAGE_ORDER" -o print.pdf

