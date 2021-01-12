#!/bin/bash

AGENDACONFIG=~/scripts/agenda.vars
OLDAGENDACONFIG=~/scripts/old-agenda.vars
if [ -r ${AGENDACONFIG} ]
then
  # Read the file if it's existing and readable
  source ${AGENDACONFIG}
fi

if [ -r ${OLDAGENDACONFIG} ]
then
  source ${OLDAGENDACONFIG}
fi

agenda=$agenda
echo -e "\n****PREVIOUS****\n$old\n****************\n"
echo -e "\n*****UP NEXT*****\n$agenda\n*****************\n\nupdate agenda?"
read update
echo -e "\n"

if [ -z $update ] || [ $update == 'n' ]
then 
  echo "MTFBWY"
  exit 1
elif [ $update == 'y' ]
then
  echo "*****UPDATE*****"
  read newAgenda
  old=$agenda
  echo agenda="'$newAgenda'" > ${AGENDACONFIG}
  echo old="'$old'" > ${OLDAGENDACONFIG}
  echo "agenda updated!"
else
  echo "wat?"
fi
