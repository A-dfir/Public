# HTTP Response Codes:
1.	200 – Indicates a successful GET or POST request known as an OK. You went and got a page and it came back successfully 
2.	201 – Indicates a PUT request has been successful in creating a resource. 
3.	3XX (any 300 code) – Indicates a redirect has occurred. 
4.	4XX (any 400 code) – Indicates an error in the client request  
4.1	400 – Indicates that a request could not be parsed by the server
4.2	401 – Indicates that a request did not supply the authentication credentials4
4.3	403 – Indicates that a request did not have sufficient permissions
4.5	404 – Indicates that a client has requested a non-existent resource
5.	5XX (any 500 code) – Indicates a servers-side issue
5.1	500 – Inidcates a general error on the server-side of the application
5.2	502 – Indicates a bad gateway has occurred when the server is acting as a proxy 
5.3	503 – Indicates an overloading of the server causing service unavailability
5.4	504 – Indicates a gateway timeout which means there’s an issue with the upstream server. 

# Character	Percent Encoding
Null	        %00
Space	        %20
“	            %22
%	            %25
‘	            %27
+	            %2B
.	            %2E
/	            %2F
<	            %3C
=             %3D
>	            %3E
?	            %3F
\	            %5C

# Tools: 
1. BrowsingHistoryViewer 
2. EZ-Viewer
3. Hindsight
4. Splunk
5. Wireshark
6. ELK

# Browsers' history files common paths: 
EDGE: C:\User\%username%\AppData\Local\Microsoft\Edge\User Data\Default\History
CHROME: C:\User\%username%\AppData\Local\Google\Chrome\User Data\Default\History
IE: C:\User\%username%\AppData\Local\Microsoft\Windows\History\History.IE5
FIREFOX: C:\Users\%username%\AppData\Roaming\Mozilla\Firefox\Profiles\
SAFARI: ~/Library/Safari/History.db
