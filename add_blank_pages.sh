#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Usage example: ./bashscript src.pdf"
  exit $E_BADARGS
else
  NUM=$(pdftk $1 dump_data | grep 'NumberOfPages' | awk '{split($0,a,": "); print a[2]}')
  echo $NUM
  COMMSTR=''
  NUM_BLANK_PAGES=$2
  PAGE_START=$3
  echo $NUM_BLANK_PAGES

  for i in $(seq 1 "$(($PAGE_START-1))");
  do
    COMMSTR="$COMMSTR A$i"
  done

  for i in $(seq $PAGE_START $NUM);
  do
    COMMSTR="$COMMSTR A$i"
    for blank_page in $(seq 1 $NUM_BLANK_PAGES);
    do
      COMMSTR="$COMMSTR B1"
    done
  done
  echo $COMMSTR

  FILE=$(basename $1)
  $(echo "" | ps2pdf -sPAPERSIZE=a4 - pageblanche.pdf)
  $(pdftk A=$1 B=pageblanche.pdf cat $COMMSTR output 'mod_'$FILE)
  (pdfjam 'mod_'$FILE --no-landscape --outfile 'print_'$FILE)
  $(rm pageblanche.pdf && rm 'mod_'$FILE)

fi

#for f in *.pdf; do ./bashscript.sh $f; done 2> /dev/null
