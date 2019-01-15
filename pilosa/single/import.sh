#!/bin/bash
curl -O https://raw.githubusercontent.com/pilosa/getting-started/master/stargazer.csv
curl -O https://raw.githubusercontent.com/pilosa/getting-started/master/language.csv
docker cp stargazer.csv pilosa:/stargazer.csv
docker exec -it pilosa /pilosa import -i repository -f stargazer /stargazer.csv
docker cp language.csv pilosa:/language.csv
docker exec -it pilosa /pilosa import -i repository -f language /language.csv
rm -rf stargazer.csv
rm -rf language.csv
