### Linux Commands ###
```
Command	                                                                      Description
#!/bin/bash	                                                                    Start of a script 
cut 	                                                                          A command that enables the user to specifiy which text on a line they want removed from the results
cut -c5 syslog.txt 	                                                            Returns only the fifth character in each line from the syslog.txt file.
cut -c5-5 syslog.txt	                                                          Returns only the fifth through tenth characters in each line from the syslog.txt file
cut --d " " --f1-4 syslog.txt 	                                                Returns the first four entries of each line as delimited by the " " space character
df	                                                                            Retrieves how much disk space is being used by all mounted file systems and how much space is available for each
du	                                                                            Retrieves how much disk space each directory is using based on specified directory
du /var/log	                                                                    How much space is var log using on this computer
echo 	                                                                          Shows output on screen
echo "This is an example"	                                                      Displays the text This is an example on screen
free	                                                                          Command in linux showing memory available
grep "192\.168\.1\.10" *	                                                      Searching as string of exact IP address 192.168.1.10 across all files *. While quotes protect from shell intepretation, regex still needs to interpet the data so you have to "escape" for the period to be interpeted correctly
grep "NetworkManager" /var/log/syslog | cut -d " " -f1-5 | sort -t " " -k3 	    Search for the word NetworkManager inside /var/log/syslog piping it to the next command which is going to deliniate based on spaces " " seeing the first 5 columns based on the deliniator. We then sort by spaces -t " "      Looking for the 3rd column -k3
grep "NetworkManager" /var/log/syslog | cut -d " " -f1-5 > test.txt echo "yay"	Looks for networkmanager in /var/log/syslog dileniates anything with a space " " within th first five columns and outputs that into a file called test.txt and says yay after compltet
grep -c	                                                                        Return a count of matching lines
grep -F 192.168.1.10 access.log	Grep -F                                         Means to literally search for this IP address Access.log means to search within file. 
grep -I	                                                                        Return names of files with matching lines
grep -i 	                                                                      Ignore case sensitivity
grep -L	                                                                        Return names of files without matching lines
grep -r 192\.168\.1\.[0-255] .	                                                Since we know IPs don't go above 255 our last query would've included 192.168.1.999 which isn't a valid IP address so [0-255] limits to actual IP address and . means same directory 
grep -r 192\.168\.1\[\d]{1,3} .                                                 Recursive looking inside this file or directory and all subsequent. the '.' at the end indicates what directly which is the current directory we're in. The [\d] specifies I want to see something with digits and {1,3} details how many digits either 1 2 or 3 digits
Grep -r                                                                         Recursive search looking all diectories and sub directories                        
grep -v 	                                                                      Return non-matching lines
grep -w 	                                                                      Match whole words only
head	                                                                          A command that outputs the first 10 lines of a file specified 
head syslog.txt	                                                                First 10 lines of syslog.txt
htop	                                                                          New version of top easier to read
lsof 	                                                                          Retrieves a list of iles on linux 
lsof -u root -a p 1645 	                                                        Show all files by root using process 1645
ps -a	                                                                          Show all processes
ps -A | sort -k 3	                                                              Display process sorted by third column which is execution time
ps -C cron	                                                                    Like findstr looking for cron jobs
ps -e	                                                                          Show all processes
sort	                                                                          A command that can be used to change the output order
sort -k 2 syslog.txt 	                                                          Returns the contents of the syslog.txt file in order based on the conlumn specified 
sort -n syslog.txt	                                                            Returns the contents of the syslog.txt file in numerical order (0-9)
sort -r syslog.txt	                                                            Returns the contents of the syslog.txt file in reverse alphabetical order (z-a)
sort syslog.txt	                                                                Returns the contents of the syslog.txt file in alphabetical order (a-z)
sort --t "," -k 2 syslog.txt	                                                  Returns the contents of the syslog.txt file in order based on the column specified such as the second column while delimiting the columns using command separated values
tail 	                                                                          A command that outputs the last 10 lines of a specified file
tail syslog.txt	                                                                Last 10 lines of syslog.txt 
top	                                                                            Command scrollable table every running process
```
