cat freq |
while read x
do
 WORD=`echo "$x" | gsed 's/,.*//'`
 DOCFREQ=`egrep -l " $WORD " *.txt | wc -l | sed 's/^ *//'`
 echo "$x,$DOCFREQ"
done
