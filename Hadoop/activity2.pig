inputFile = LOAD 'hdfs:///user/hemavathiv/file01.txt' AS (line);
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;
grpd = GROUP words BY word;
cntd = FOREACH grpd GENERATE group, COUNT(words);
STORE cntd INTO 'hdfs:///user/hemavathiv/pigactivity2';
