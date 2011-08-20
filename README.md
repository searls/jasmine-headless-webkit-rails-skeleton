Demo of [jasmine-headless-webkit](http://johnbintz.github.com/jasmine-headless-webkit/)

##Prerequisites

Stuff I did on my Mac OS X Lion (10.7) setup to get started. I already had XCode installed, which I'll bet is a requisite step.

Install QT (with [homebrew](https://github.com/mxcl/homebrew))

    brew update
    brew install qt



##Configuration

Added to your Gemfile:

    group :test, :development do
      gem 'jasmine'
      gem 'jasmine-headless-webkit'
    end
    
Run:

    jasmine init

##Code

