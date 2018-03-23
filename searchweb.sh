#!/bin/sh
file_result='google-result.txt'

# links2 www.something.com -dump > somethingfile | code somethingfile
  
while getopts q:l:h OPTIONS; do
  # echo "opção ${OPTIONS} - valor ${OPTARG}";

  case $OPTIONS in
    q) echo "Searching ... ${OPTARG}"
      links2 https://www.google.com.br/search?q="${OPTARG}" -dump > "$file_result" | code "$file_result";;
        
    l) echo "Redirecting ... ${OPTARG}"
      links2 $OPTARG -dump > "$file_result" | code "$file_result";;

    h)
      echo "-h --Help"
      echo "-q --query PESQUISA NO GOOGLE"
      echo "-l --link LINK URL";;

    *) echo "Opcao Invalida!";;
    esac
done

exit 0