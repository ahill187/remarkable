# Remarkable

Welcome! This is a general repository for some functions related to the Remarkable Tablet. This is minimally maintained, and developed on Mac, so may not work on Linux or Windows (but feel free to submit PRs if you want)!

## Adding Blank Pages

One feature many users have requested for the Remarkable Tablet is to be able to add new blank pages when reading a PDF or EPUB document in real time. This would allow you to take notes while you are reading. Currently, you can mark up the document, but you are limited to layers on a given page and thus only the margins.

In ``add_blank_pages.sh``, I have modified some code from this post: https://stackoverflow.com/questions/12942486/insert-a-blank-page-between-each-existing-page-in-a-pdf-document. Given a PDF file, this script will add N blank pages after each page of the PDF.

To run:

```
bash add_blank_pages.sh my_file.pdf
```
