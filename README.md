This is a skeleton app demonstrating [jasmine-headless-webkit](http://github.com/johnbintz/jasmine-headless-webkit/). Be sure to check out [its page](https://johnbintz.github.com/jasmine-headless-webkit/) for detailed instructions.

Check this out if you want to:

* write [Jasmine](https://github.com/pivotal/jasmine/wiki) specs
* use [CoffeeScript](http://jashkenas.github.com/coffee-script/)
* leverage the [asset pipeline](http://railscasts.com/episodes/279-understanding-the-asset-pipeline) in Rails 3.1
* run specs headless & quickly enough to remove browser-refreshing from your workflow
* (optional) getting growl notifications via guard as your specs run

##Prerequisites

This was put together running Mac OS X Lion (10.7). I'm sure the details will differ slightly on other platforms.

Install [XCode](http://itunes.apple.com/us/app/xcode/id448457090?mt=12) & [Growl](http://growl.info/index.php).

Install QT with [homebrew](https://github.com/mxcl/homebrew). (Full disclosure: upon running `brew update`, I needed to `git stash` in `/usr/local` then `git pull` to get the latest recipes.)

    brew update
    brew install qt

##Try it out

Once you've cloned this repository and changed into the directory, you should be able to run the Jasmine specs like so:

    bundle install
    bundle exec guard

When you run guard, it first compiles your assets, run your specs and then monitors for changes.

Note: if you don't care for the Growl, make sure you remove `growl_notify` from the [Gemfile](https://github.com/searls/jasmine-headless-webkit-rails-skeleton/blob/master/Gemfile) to prevent exceptions.

##The play-by-play

If you're looking to recreate a similar setup for your existing project, here are most of the steps I took.

###Dependencies

Added to your [Gemfile](https://github.com/searls/jasmine-headless-webkit-rails-skeleton/blob/master/Gemfile):

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
    
###Jasmine config
Next, Run:

    jasmine init

This will create a little structure, most importantly your `spec/javascripts/support/jasmine.yml` configuration file. You can safely remove `lib/tasks/jasmine.rake`, though.

Then, update your [jasmine.yml](https://github.com/searls/jasmine-headless-webkit-rails-skeleton/blob/master/spec/javascripts/support/jasmine.yml) file to look for CoffeeScript in the assets directories. [Mine](https://github.com/searls/jasmine-headless-webkit-rails-skeleton/blob/master/spec/javascripts/support/jasmine.yml) looks something like this.

    src_files:
      - "vendor/**/*.{js,coffee}"
      - "lib/**/*.{js,coffee}"
      - "public/**/*.{js,coffee}"
    helpers:
      - "helpers/**/*.{js,coffee}"
    spec_files:
      - "**/*[Ss]pec.{js,coffee}"
    src_dir:
    spec_dir: spec/javascripts

###Guard
I set guard up by running

    bundle exec guard init rails-assets
    bundle exec jasmine-headless-webkit
    
And changed these lines in my [Guardfile](https://github.com/searls/jasmine-headless-webkit-rails-skeleton/blob/master/Guardfile) to monitor all of my assets directories (under `app`, `lib`, and `vendor`):

    guard 'rails-assets' do
      watch(%r{^*/assets/.+$})
      ...
    end

    guard 'jasmine-headless-webkit' do
      ...
      watch(%r{^.*/assets/javascripts/(.*)\.(js|coffee)$}) { |m| newest_js_file(spec_location % m[1]) }
      ...
    end

## Notes

Many thanks to [John Bintz](http://twitter.com/johnbintz) for making jasmine-headless-webkit, it's a wonderful tool.


  
