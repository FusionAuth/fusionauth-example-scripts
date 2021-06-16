#!/bin/bash

API_KEY=bf69486b-4733-4470-a592-f1bfce7af580

filename=myusers.txt
max_total=0
fa_hostname=http://localhost:9011

# ES is not case sensitive

for fc in {a..z} {0..9}; do
    #echo "$f"
    printf "."
    total=`curl -s -H "Authorization: $API_KEY" $fa_hostname'/api/user/search/?queryString=email:'$fc'*&accurateTotal=true' | jq '.total'`
    if [ $total -gt $max_total ]; then
      max_total=$total
    fi
done

tmpdir=tmp.$$
mkdir $tmpdir

if [ $max_total -lt 10000 ]; then
  # all of our segments are less than 10k
  for fc in {a..z} {0..9}; do
    printf "."
    curl -s -H "Authorization: $API_KEY" $fa_hostname'/api/user/search/?queryString=email:'$fc'*&numberOfResults=10000' > $tmpdir/file.$fc
  done
else 
  # we handle two characters here, but you could do the same count check and go deeper
  for fc in {a..z} {0..9}; do
    for sc in {a..z} {0..9}; do
      printf "."
      curl -s -H "Authorization: $API_KEY" $fa_hostname'/api/user/search/?queryString=email:'$fc$sc'*&numberOfResults=10000' > $tmpdir/file.$fc
    done
  done
fi

jq 'reduce inputs as $i (.; .users += $i.users)| del(.total)' $tmpdir/file* > users.json

rm -rf $tmpdir
