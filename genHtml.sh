#!/bin/bash

# Copyright (c) 2016 Maxwell Dreytser

for D in `find . -type d`;
do
	if [[ $D != *'.git'* ]]; then
		SubDir=${D/\.\//};
		
		echo ${SubDir};
		
		(
			cd $SubDir;
			
			echo '<html>' > index.html;
			echo '    <head>' >> index.html;
			echo "        <title>crypto-js - ${SubDir}</title>" >> index.html
			echo '    </head>' >> index.html;
			echo '    <body>' >> index.html;
			echo '        <h1>File List</h1>' >> index.html;
			echo "        <h3>${SubDir}</h3>" >> index.html;
			if [[ $SubDir != '.' ]]; then
				echo '        <h5><a href="../">Go to Parent Directory</a></h5>' >> index.html;
			fi
			echo '        <table border="1">' >> index.html;
			echo '            <tr>' >> index.html;
			echo '                <th>Item Name</th>' >> index.html;
			echo '                <th>Type</th>' >> index.html;
			echo '            </tr>' >> index.html;
			
			for SubD in `find -mindepth 1 -maxdepth 1 -type d`; do
				MySubD=${SubD/\.\//};
				echo "    $MySubD";
				
				if [[ $MySubD != *'.git'* ]]; then
			echo '            <tr>' >> index.html;
			echo "                <td><a href=\"$MySubD\\\">$MySubD</a></td>" >> index.html;
			echo '                <td>Folder</td>' >> index.html;
			echo '            </tr>' >> index.html;
				fi
			done;
			
			for SubFile in `find -mindepth 1 -maxdepth 1 -not -path '*/\.*' -type f`; do
				MySubFile=${SubFile/\.\//};
				
                                if [[ $MySubFile != 'index.html' && $MySubFile != 'genHtml.sh' ]]; then
					echo "    $MySubFile";
				
			echo '            <tr>' >> index.html;
			echo "                <td><a href=\"$MySubFile\">$MySubFile</a></td>" >> index.html;
			echo '                <td>File</td>' >> index.html;
			echo '            </tr>' >> index.html;
				
				fi
				
			done;
			
			echo '        </table>' >> index.html;
			echo '    </body>' >> index.html;
			echo '</html>' >> index.html;
		)
	fi
done;
