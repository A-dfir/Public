🔄️ # HTTP Response Codes:
```
200 - Indicates a successful GET or POST request known as an OK. You went and got a page and it came back successfully 
201 - Indicates a PUT request has been successful in creating a resource. 
3XX - (any 300 code) – Indicates a redirect has occurred. 
4XX - (any 400 code) – Indicates an error in the client request  
400 – Indicates that a request could not be parsed by the server
401 – Indicates that a request did not supply the authentication credentials4
403 – Indicates that a request did not have sufficient permissions
404 – Indicates that a client has requested a non-existent resource
5XX - (any 500 code) – Indicates a servers-side issue
500 – Inidcates a general error on the server-side of the application
502 – Indicates a bad gateway has occurred when the server is acting as a proxy 
503 – Indicates an overloading of the server causing service unavailability
504 – Indicates a gateway timeout which means there’s an issue with the upstream server. 
```
💯 # Character	Percent Encoding
```
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
```
🔨 # Tools: 
1. BrowsingHistoryViewer 
2. EZ-Viewer
3. Hindsight
4. Splunk
5. Wireshark
6. ELK

🔍 # Browsers' history files common paths: 
```
Computer artifact locations: 
EDGE: C:\User\%username%\AppData\Local\Microsoft\Edge\User Data\Default\History
CHROME: C:\User\%username%\AppData\Local\Google\Chrome\User Data\Default\History
IE: C:\User\%username%\AppData\Local\Microsoft\Windows\History\History.IE5
FIREFOX: C:\Users\%username%\AppData\Roaming\Mozilla\Firefox\Profiles\
SAFARI: ~/Library/Safari/History.db

Mobile artifact locations:
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/Caches/com.apple.mobilesafari/ Safari Cache files
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/Caches/com.apple.mobilesafari/Cache.db Safari Cache database
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/Caches/com.apple.WebAppCache/ApplicationCache.db Safari Website cache
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/Cookies/Cookies.binarycookies Safari Cookies
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/Favicons/Favicons/ Safari Website favicons
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/Preferences/com.apple.mobilesafari.plist Safari Configuration
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/Safari/Downloads/Downloads.plist Safari Download History
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/Safari/Thumbnails/ Safari Tabs Screenshots (PNG or KTX format)
/private/var/mobile/Containers/Data/Application/<Apple Safari GUID/Library/WebKit/WebsiteData/LocalStorage/* Safari WebKit Localstorage
/private/var/mobile/Library/Assistant/knowledgeC.db Safari History information
/private/var/mobile/Library/Safari/Bookmarks.db Safari Bookmarks
/private/var/mobile/Library/Safari/BrowserState.db Safari Suspended State Tab
/private/var/mobile/Library/Safari/CloudTabs.db Safari Cloud Tabs 
/private/var/mobile/Library/Safari/History.db Safari History
Userdata /data/com.android.browser/app_databases/* * Internet History
Userdata /data/com.android.browser/app_geolocation/GeolocationPermissions.db * Internet History
Userdata /data/com.android.browser/databases/Browser.db
Userdata /data/com.android.browser/databases/browser2.db * Internet History
Userdata /data/com.android.browser/databases/webview.db * Internet History
Userdata /data/com.android.browser/databases/webviewCache.db * Internet History
Userdata /data/com.android.email/webviewCache.db * Internet History
```
