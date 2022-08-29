for d in packages/*/
do
     (cd "$d" && flutter clean)
done


flutter clean