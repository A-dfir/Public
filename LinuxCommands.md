### Linux Commands ###
```
grep -F 192.168.1.10 access.log													Grep -F means literally search for this IP address Access.log means where to search within. 
grep "192\.168\.1\.10" *														Searching as string of exact IP address 192.168.1.10 across all files *. While quotes protect from shell intepretation, regex still needs to interpet the data so you have to "escape" for the period to be interpeted correctly
grep -r 192\.168\.1\[\d]{1,3} . 												Grep -r recursive looking inside this file or directory and all subsequent. the '.' at the end indicates what directly which is the current directory we're in. The [\d] specifies see something with digits and {1,3} details how many digits either 1 2 or 3 digits
grep -r 192\.168\.1\.[0-255] .													IPs don't go above 255 so [0-255] limits to actual IP address and . means same directory 
grep -i 																		Ignore case sensitivity
grep -v 																		Return non-matching lines
grep -w 																		Match whole words only
grep -c												 							Return a count of matching lines
grep -I																			Return names of files with matching lines
grep -L																			Return names of files without matching lines
cut 																			A command that enables the user to specifiy which text on a line they want removed from the results
cut -c5 syslog.txt 																Returns only the fifth character in each line from the syslog.txt file.
cut -c5-5 syslog.txt															Returns only the fifth through tenth characters in each line from the syslog.txt file
cut --d " " --f1-4 syslog.txt 													Returns the first four entries of each line as delimited by the " " space character
sort																			A command that can be used to change the output order
sort syslog.txt																	Returns the contents of the syslog.txt file in alphabetical order (a-z)
sort -r syslog.txt											 					Returns the contents of the syslog.txt file in reverse alphabetical order (z-a)
sort -n syslog.txt																Returns the contents of the syslog.txt file in numerical order (0-9)
sort -k 2 syslog.txt 															Returns the contents of the syslog.txt file in order based on the conlumn specified 
sort --t "," -k 2 syslog.txt											 		Returns the contents of the syslog.txt file in order based on the column specified such as the second column while delimiting the columns using command separated values
head																			A command that outputs the first 10 lines of a file specified 
head syslog.txt																	First 10 lines of syslog.txt
tail 																			A command that outputs the last 10 lines of a specified file
tail syslog.txt																	Last 10 lines of syslog.txt 
grep "NetworkManager" /var/log/syslog | cut -d " " -f1-5 | sort -t " " -k3 		Search for the word NetworkManager inside /var/log/syslog piping it to the next command which is going to deliniate based on spaces " " seeing the first 5 columns based on the deliniator. We then sort by spaces -t " " looking for the 3rd column -k3
echo 																			Shows output on screen
echo "This is an example"														Displays the text This is an example on screen
#!/bin/bash																		Start of a script 
grep "NetworkManager" /var/log/syslog | cut -d " " -f1-5 > test.txt	echo "yay"	Looks for networkmanager in /var/log/syslog dileniates anything with a space " " within th first five columns and outputs that into a file called test.txt and says yay after compltet
ps -a						                                                    Same as below or similar
ps -e						                                                    Like ipconfig /all but for processes
ps -C cron					                                                Like findstr looking for cron jobs
ps -A | sort -k 3 			                                            Display process sorted by third column which is execution time
free 						                                                    Command in linux showing memory available
top							                                                    Command scrollable table every running process 
htop						                                                    New version of top easier to read
```
