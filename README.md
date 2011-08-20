Skeleton app demonstrating [jasmine-headless-webkit](http://johnbintz.github.com/jasmine-headless-webkit/).

Check this out if you want to:

* write CoffeeScript
* leverage the assets pipeline in Rails 3.1
* run specs headlessly, and fast
* 



##Prerequisites

Stuff I did on my Mac OS X Lion (10.7) setup to get started. I already had XCode installed, which I'll bet is a requisite step.

Install XCode

Install QT with [homebrew](https://github.com/mxcl/homebrew). (Full disclosure: upon running `brew update`, I needed to `/usr/local` and `git stash` and `git pull` to get the latest recipes.)

    brew update
    brew install qt

Install [Growl](http://growl.info/index.php) for guard notifications.


##Steps

If you're looking to recreate a similar setup for your existing project, here are the steps I took.

Added to your Gemfile:

    group :test, :development do
      gem 'jasmine'
      gem 'jasmine-headless-webkit'
  
      if RUBY_PLATFORM =~ /darwin/i
        gem 'growl_notify'
        gem 'rb-fsevent', :require => false 
      end
      gem 'guard-rails-assets'
      gem 'guard-jasmine-headless-webkit'
    end
    
Run:

    jasmine init

This will create a little structure, most importantly your `spec/javascripts/support/jasmine.yml` configuration file. You can safely remove `lib/tasks/jasmine.rake`, though.

##Code

