# CS Degree Advisor and Planning Assistant
[![Build Status](http://162.243.137.213/buildStatus/icon?job=cs-degree-advisor-master)](http://162.243.137.213/job/cs-degree-advisor-master/)

This Project uses Ruby version 2.1.1, Rails version 4.2.0, Bundler version 1.8.3.
Please note the following:
* Later versions may or may not work with this project, but are untested.
* Ruby 1.9.x and earlier, and Rails 3.2 and earlier, are known to be incompatible with this project.
* Ruby 2.0.0 to 2.1.0 and Rails 4.0.0 to 4.1.9 will probably work but are untested. **__If you use these versions, you do so at your own risk.__**
* Bundler 1.8.3 is the only version tested with this product and known to be compatible.

## How To Run Locally

### Windows

This guide assumes you have git properly installed on your Windows machine. If you
do not, please [download it and install it before moving on](http://git-scm.com/download/win).

1. **Install Ruby**.
    1. Download RubyInstaller version 2.1.6 from [rubyinstaller.org](http://rubyinstaller.org/).
    2. Run the installer, making sure to **check the three checkboxes that show up** and **install to the default location**.
2. **Install the [DevKit](http://rubyinstaller.org/add-ons/devkit/)**.
      1. Download the DevKit from [here](http://rubyinstaller.org/downloads/).
      Make sure to get the version built for Ruby 2.0 and 2.1.
      2. Run the DevKit executable and extract the files to C:\RubyDevkit.
      3. **Set up the DevKit**. Open a command prompt window and enter these commands:
        1. `cd C:\RubyDevkit`
        2. `ruby dk.rb init`
        3. `ruby dk.rb install`
5. **Install Rails**. In a fresh command prompt window, enter `gem install rails --no-rdoc --no-ri`. You might be prompted to allow the Ruby interpreter access to the network. Allow it.
6. **Set up the project**. In the same command prompt window:
      1. Navigate to the folder you want to clone the project in: `cd C:\path\of\your\choosing`
      2. Clone the project: `git clone -c http.sslVerify=false https://gouda.msudenver.edu/gitlab/falcon/cs-degree-advisor-and-planning-assistant.git`
      3. Enter the project folder: `cd cs-degree-advisor-and-planning-assistant`
      4. Set up and run the project:
        1. `bundle install`
        2. `rake db:migrate`
        3. `rake db:seed`
        4. `rails s`
7. **View the project in the browser**. Open your browser and navigate to `localhost:3000` to see the project running in development mode.

### Mac and Ubuntu
See [GoRails.com's walkthrough](https://gorails.com/setup/osx/10.10-yosemite) for how to install on Mac OS X 10.10 & 10.9, or Ubuntu.
While following these instructions, choose the guide to install ruby 2.1.2. Follow the guide to install ruby, bundler, and configure git,
then return to this README.
The Mac instructions use [Homebrew](http://brew.sh/) paired with [rbenv](https://github.com/sstephenson/rbenv).
The Ubuntu instructions use apt-get and your choice of [rbenv](https://github.com/sstephenson/rbenv) or [rvm](https://rvm.io/)


### Other OSs
We do not officially support any other operating systems. You will have to figure out how to setup the project yourself.

## Installing Ruby and Rails

### Ruby
See the [official Ruby site](https://www.ruby-lang.org/en/documentation/installation/) for installation guides.

#### Rails
Once you have Ruby installed, you need to install Rails using the following command (either in terminal or command prompt, depending on your OS):
`gem install rails`

Word to the wise: installing ri and rdoc takes a very long time. You can skip these if you want by running `gem install rails --no-rdoc --no-ri`.

## General Information

### Cloning the repository

From the desired directory on your computer, run this command to clone the project:
`git -c http.sslVerify=false clone https://gouda.msudenver.edu/gitlab/falcon/cs-degree-advisor-and-planning-assistant.git`
then navigate inside the project folder with
`cd cs-degree-advisor-and-planning-assistant`.

Note that Gouda doesn't allow SSH connection and the SSL cert doesn't work well with Gitlab so the `-c http.sslVerify=false` is required.

You can also just download the source code from this repository.

### Installing dependencies
Make sure you are in the correct directory where the project lives.  Now install all the gem dependencies using bundle.

`bundle install`

It may take a couple of minutes if this is your first time installing the dependencies.

### Run a db migration
`bundle exec rake db:migrate`

### Seed the database
`bundle exec rake db:seed`

### Start the rails server
`bundle exec rails s`

### Navigate to the web application
Open up a web browser and navigate to `localhost:3000` to see the application.
You should see an example course plan if you have seeded the database with the
command above.

## Running the tests
You can run all the tests for the rails application locally by executing the following command.
`bundle exec rake test`

#### If you want to contribute to this project
You should fork the Falcon repo and clone your fork instead. You can find a "Fork" button near the top right of this page.
Clone using the same command as above, replacing 'falcon' with your username.
To commit changes, make a merge request to Falcon/master from your fork and branch with the desired changes.

#### Caveat for Windows users
If you happen to be working on windows, you might run into into this error:
`SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed`
If this happens download this file [AddTrustExternalCARoot-2048.pem](https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/AddTrustExternalCARoot-2048.pem)
and pasted into yourrubypath\lib\ruby\2..\rubygems\ssl_certs
Then re-run `bundle install`
Once that is done executing run `bundle update`

### Configure rails secret keys
**The secrets.yml file is currently included in the project, setting it up can be skipped until further notice.**
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
