#!/bin/bash

cat corpus.txt | apertium -d . kfy-morph | apertium-cleanstream -n > corpus_ana.txt

total=`cat corpus_ana.txt | wc -l`
known=`grep -vc '*' corpus_ana.txt`
unk=`grep -c '*' corpus_ana.txt`
percent=`echo "100 * $known / $total" | bc`

echo "coverage: ${percent}% ($known/$total)" 

echo ""
echo "unknown forms: $unk"

echo ""
echo "top unknown forms:"

cat corpus_ana.txt | grep '*' | sort | uniq -c | sort -nr | head -n25

