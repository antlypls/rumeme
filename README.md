RuMeMe
======

[![Build Status](https://travis-ci.org/rumeme/rumeme.png?branch=master)](https://travis-ci.org/rumeme/rumeme)
[![Coverage Status](https://coveralls.io/repos/rumeme/rumeme/badge.png)](https://coveralls.io/r/rumeme/rumeme)
[![Code Climate](https://codeclimate.com/github/rumeme/rumeme.png)](https://codeclimate.com/github/rumeme/rumeme)

Ruby SDK for Message Media SMS Gateway API.
Since Message Media doesn't provide any ruby projects support, we decided to port it from available SDKs (mainly from PHP SDK; and some .NET usage).
For more information checkout [Message Media SMS APIs](http://www.message-media.com/sms-gateway.html).

Help
====

Installation
------------

Just execute

    gem install rumeme

Usage
-----

First, add Rumeme initialization

```ruby
Rumeme.configure do |config|
  config.username = 'xxx'
  config.password = 'yyy'
  config.use_message_id = true
  config.secure = true
  config.allow_splitting = false
  config.allow_long_messages = true
end
```

Where xxx and yyy is your username and password consequently.
Then you can use SmsInterface class to add and send messages.

```ruby
si = SmsInterface.new

si.add_message :phone_number => 'xxxxxxxxxxx', :message => 'Message text 1'
si.add_message :phone_number => 'xxxxxxxxxxx', :message => 'Message text 2'
si.add_message :phone_number => 'xxxxxxxxxxx', :message => 'Message text 3'
si.add_message :phone_number => 'xxxxxxxxxxx', :message => 'Message text 4'
si.add_message :phone_number => 'xxxxxxxxxxx', :message => 'Message text 5'

si.send_messages
```

Where xxxxxxxxxxx is phone number.

Credits
=======

RuMeMe is maintained by Anatoliy Plastinin,
and is funded by [Cloud Castle, LLC](http://cloudcastlegroup.com/).

Contributors
============

* Stan Carver II
* Rafael Fonseca

License
=======

RuMeMe is free software, and may be redistributed under the terms
specified in the MIT-LICENSE file.
