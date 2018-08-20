time < large-compressed.txt.gz cat | 
gzip -d | grep -v '-' > output.txt
#$ real    0m2.124s

< large-compressed.txt.gz cat | gzip -d |
grep -v '-' |
awk -F, '($7 >= 2) && ($5 > 1)' | 
wc -l
#$ 21

< large-compressed.txt.gz cat | gzip -d | grep '-' | 
awk -F, '($1 >= 2) || ($2 < 0) {print $3","$4","$5+$6","$7*$8}' | 
header -a a,b,c,d | head | csvlook

< large-compressed.txt.gz cat | gzip -d |
grep -v '-' |
awk -F, '($7 >= 2) && ($5 > 1)' > smaller_file.csv

< large-compressed.txt.gz cat | gzip -d |
csvcut -c 7,8,9,10 |  header -a g,h,i,j |
csvsql --query 'SELECT SUM(g) AS sum_a, AVG(h) AS mean_h, MIN(i) AS min_i, MAX(j) AS max_j FROM stdin'

