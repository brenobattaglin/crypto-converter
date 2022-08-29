for d in packages/*/
do
     (cd "$d" && flutter pub get)
done


flutter pub get