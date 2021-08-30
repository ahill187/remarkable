#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage example: ./bashscript src.pdf"
  exit $E_BADARGS
else
  NUM=$(pdftk $1 dump_data | grep 'NumberOfPages' | awk '{split($0,a,": "); print a[2]}')
  echo $NUM
  COMMSTR=''

  for i in $(seq 1 $NUM);
  do
    COMMSTR="$COMMSTR A$i B1 "
  done
  echo $COMMSTR
  $(echo "" | ps2pdf -sPAPERSIZE=a4 - pageblanche.pdf)
  # $(pdftk A=$1 B=pageblanche.pdf cat $COMMSTR output 'mod_'$1)
  # (pdfjam 'mod_'$1 --nup 2x1 --landscape --outfile 'print_'$1)
  # $(rm pageblanche.pdf && rm 'mod_'$1)

fi

#for f in *.pdf; do ./bashscript.sh $f; done 2> /dev/null
