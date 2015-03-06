# CS Degree Advisor and Planning Assistant
[![Build Status](http://162.243.137.213/buildStatus/icon?job=cs-degree-advisor-master)](http://162.243.137.213/job/cs-degree-advisor-master/)

This Project uses Ruby version 2.1.1, and Rails version 4.2.0.  

# How To Run Locally
1.  First, make sure you have the correct version of Ruby and Rails installed.
2.  Then, open up a terminal window.
3.  Next, cd into the directory where you have cloned the repository.
4.  Run command 'bundle install'
5.  This will install the gems required in the Gemfile.
6.  If you happen to be working on windows, you might run into into this error
7.  SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
8.  If this happens download this file '''html <a href="https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/AddTrustExternalCARoot-2048.pem">AddTrustExternalCARoot-2048.pem</a>'''
9.  and pasted into yourrubypath\lib\ruby\2..\rubygems\ssl_certs
10.  the re-run 'bundle install'
11.  once that is done executing run 'bundle update'
12.  After that Run bin/rails server
13. Finally, open up a web browser and navigate to localhost:3000 to see the application.
