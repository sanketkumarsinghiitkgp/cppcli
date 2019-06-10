#!/bin/bash
# prints the input

function cppcli(){
	cppclipath=~/cppcli
	toptext=~/cppcli/.cppcli_toptext.txt
	bottomtext=~/cppcli/.cppcli_bottomtext.txt
	runcontrol=~/.bashrc
	touch $cppclipath/.cppcli.txt
	echo -n > $cppclipath/.cppcli.txt

	echo "Welcome to Command Line C++"
	echo "Enter a code snippet in c++."
	echo "Remember! only enter the part within the main function"
	echo "When you are done, enter 'end'on a separate line"
	echo "enter 'man' for information about other commands"
	while true; do
		read -p "c++>> " Line
		if [ "$Line" == "end" ]; then
			break
		fi
		if [ "$Line" == "dl" ]; then
			sed -i '$d' $cppclipath/.cppcli.txt
			continue
		fi
		if [ "$Line" == "saf" ]; then
			echo -n > $cppclipath/.cppcli.txt
			continue
		fi
		if [ "$Line" == "show" ]; then
			less $cppclipath/.cppcli.txt
			continue
		fi
		if [ "$Line" == "man" ]; then
			echo "end  -- start compilation"
			echo "dl   -- delete a line"
			echo "saf  -- deletes all previous lines (start afresh)"
			echo "show -- show all lines input so far"
			echo "man  -- show the list of all commands"
			echo "A command should be entered on a separate line"
			continue
		fi
		echo "$Line">>$cppclipath/.cppcli.txt
	done
	cat $toptext $cppclipath/.cppcli.txt $bottomtext >$cppclipath/.cppcli_final.cpp
	g++ -o $cppclipath/a.out $cppclipath/.cppcli_final.cpp
	$cppclipath/./a.out
	

}
