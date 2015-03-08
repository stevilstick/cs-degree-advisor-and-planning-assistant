# CS Degree Advisor and Planning Assistant
[![Build Status](http://162.243.137.213/buildStatus/icon?job=cs-degree-advisor-master)](http://162.243.137.213/job/cs-degree-advisor-master/)

This Project uses Ruby version 2.1.1, and Rails version 4.2.0.  

## How To Run Locally
### Ruby Version
Install Ruby version 2.1.1

### Bundle
Install dependencies specified in the Gemfile by running 
`bundle install`

### Caveat for Windows users
If you happen to be working on windows, you might run into into this error:
`SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed`
If this happens download this file [AddTrustExternalCARoot-2048.pem](https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/AddTrustExternalCARoot-2048.pem)
and pasted into yourrubypath\lib\ruby\2..\rubygems\ssl_certs
Then re-run `bundle install`
Once that is done executing run `bundle update`

### Configure rails secret keys
Run the following command and copy the output to your clipboard
`RAILS_ENV=development rake secret`
Create new file at `config/secrets.yml` and paste the following, substituting 
the output of the previous command output for SECRET_KEY
```
development:
    secret_key_base: SECRET_KEY
```
Now do the same for the test environment
`RAILS_ENV=test rake secret`
Create new file at `config/secrets.yml` and paste the following, substituting 
the output of the previous command output for SECRET_KEY
```
test:
    secret_key_base: SECRET_KEY
```

### Run a db migration
`bundle exec rake db:migrate`

### Start the rails server
`bundle exec rails s`

### Navigate to the web application 
Open up a web browser and navigate to localhost:3000 to see the application

## Running the tests
`bundle exec rake test`
