#!/bin/bash
cppclipath=~/cppcli
toptext=~/cppcli/.cppcli_toptext.txt
bottomtext=~/cppcli/.cppcli_bottomtext.txt
runcontrol=~/.bashrc
commands=commands.sh

if [ -d "$cppclipath" ]; then
    echo "$cppclipath exists"
else
	mkdir $cppclipath
fi
touch $toptext
touch $bottomtext
echo -n > $toptext
echo -n > $bottomtext
echo "#include <bits/stdc++.h>">>$toptext
echo "using namespace std;">>$toptext
echo "int main(){">>$toptext
echo "">>$toptext
echo "}">>$bottomtext
echo "">>$runcontrol
echo "source $PWD/$commands">>$runcontrol
echo "Done!"
echo "Enter 'cppcli' to start typing your c++ code snippet."
echo "You cannot create functions or create new classes etc in the cppcli mode."
echo "Enter 'cppcli_full' if you want to type out a whole c++ program."

. $runcontrol