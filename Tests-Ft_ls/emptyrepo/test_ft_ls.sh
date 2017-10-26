#echo "=== diff test ===\n"
#./ft_ls -aR ~ > /tmp/ft.txt
#ls -aR ~ >/tmp/ls.txt
#diff /tmp/ft.txt /tmp/ls.txt > diff_aR
#echo "\nif diff_aR empty, test is OK, look comments in the .sh\n"
#./ft_ls -atR ~ > /tmp/ft.txt
#ls -atR ~ >/tmp/ls.txt
#diff /tmp/ft.txt /tmp/ls.txt > diff_atR
#echo "\nif diff_atR empty, test is OK, look comments in the .sh\n"
./ft_ls -atrR ~ > /tmp/ft.txt
ls -atrR ~ >/tmp/ls.txt
diff /tmp/ft.txt /tmp/ls.txt > diff_atrR
echo "\nif diff_atrR empty, test is OK, look comments in the .sh\n"

rm -rf dirlink reglink origin origindir sticky

echo "\n=== no files ===\n"
echo "*** one input"
./ft_ls asd
./ft_ls -l asd
echo "*** two input"
./ft_ls asd opu
./ft_ls -l asd opu

echo "\n\n=== basic ===\n"
mkdir origindir
touch origindir/touch && touch origindir/my && mkdir origindir/tralala
touch origin
echo "*** ft_ls/ls origindir :"
./ft_ls origindir
ls origindir
echo "*** ft_ls/ls -l orirgindir :"
./ft_ls -l origindir
ls -l origindir
echo "*** ft_ls/ls origin :"
./ft_ls origin
ls origin
echo "*** ft_ls/ls -l origin :"
./ft_ls -l origin
ls -l origin
echo "*** ft_ls/ls origin origindir :"
./ft_ls origin origindir
echo "........."
ls origin origindir
echo "*** ft_ls/ls -l origin origindir :"
./ft_ls -l origin origindir
echo "........."
ls -l origin origindir
echo "*** ft_ls/ls . :"
./ft_ls .
ls .
echo "*** ft_ls/ls .. :"
./ft_ls ..
ls ..

echo "\n\n=== no rights ===\n"
chmod 000 origindir
chmod 000 origin
echo "*** ft_ls/ls origindir :"
./ft_ls origindir
ls origindir
echo "*** ft_ls/ls -l orirgindir :"
./ft_ls -l origindir
ls -l origindir
echo "*** ft_ls/ls origin :"
./ft_ls origin
ls origin
echo "*** ft_ls/ls -l origin :"
./ft_ls -l origin
ls -l origin
chmod 755 origindir && chmod 644 origin

echo "\n\n=== sticky_bits ===\n"
touch sticky && chmod 7777 sticky
echo "*** ft_ls/ls -l sticky (7777)"
./ft_ls -l sticky
ls -l sticky
chmod 7666 sticky
echo "*** ft_ls/ls -l sticky (7666)"
./ft_ls -l sticky
ls -l sticky

echo "\n\n=== symlink ===\n"
ln -s origindir dirlink && ln -s origin reglink
echo "*** ft_ls/ls reglink :"
./ft_ls reglink
ls reglink
echo "*** ft_ls/ls -l reglink :"
./ft_ls -l reglink
ls -l reglink
echo "*** ft_ls/ls dirlink :"
./ft_ls dirlink
ls dirlink
echo "*** ft_ls/ls -l dirlink :"
./ft_ls -l dirlink
ls -l dirlink

echo "\n\n=== no rights on symlink ===\n"
chmod -h 000 reglink && chmod -h 000 dirlink
echo "*** ft_ls/ls reglink :"
./ft_ls reglink
ls reglink
echo "*** ft_ls/ls -l reglink :"
./ft_ls -l reglink
ls -l reglink
echo "*** ft_ls/ls dirlink :"
./ft_ls dirlink
ls dirlink
echo "*** ft_ls/ls -l dirlink :"
./ft_ls -l dirlink
ls -l dirlink
chmod -h 755 reglink && chmod -h 755 dirlink

echo "\n\n=== no rights on the dir/file pointing by a symlink ===\n"
chmod 000 origin && chmod 000 origindir
echo "*** ft_ls/ls reglink :"
./ft_ls reglink
ls reglink
echo "*** ft_ls/ls -l reglink :"
./ft_ls -l reglink
ls -l reglink
echo "*** ft_ls/ls dirlink :"
./ft_ls dirlink
ls dirlink
echo "*** ft_ls/ls -l dirlink :"
./ft_ls -l dirlink
ls -l dirlink
chmod 644 origin && chmod 755 origindir

echo "\n\n=== Parsing test ===\n"
touch -- -yaya
echo "*** ft_ls/ls -yaya"
./ft_ls -yaya
ls -yaya
echo "*** ft_ls/ls -- -yaya"
./ft_ls -- -yaya
ls -- -yaya
echo "*** ft_ls/ls -l -- -yaya"
./ft_ls -l -- -yaya
ls -l -- -yaya
echo "*** ft_ls/ls -l origin -yaya"
./ft_ls -l origin -yaya
ls -l origin -yaya


echo "\nDon't forget to test -l on home directory (with -R) and /dev (to check the major and minor) directory"

rm -rf -- -yaya dirlink reglink origin origindir sticky
