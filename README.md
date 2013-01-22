# TimesTopics

A simple wrapper for the TimesTags API and Times Topics

Interact with the [TimesTags API](http://developer.nytimes.com/docs/timestags_api) with this rubygem. Find people, organizations, locations, and subjects matching queries. Find Times Topics pages for query matches along with related topics, when applicable.


## Installation

First, ensure you have an API key. You may request one on [the NYT developer site](http://developer.nytimes.com/apps/register/).

Once you have an API key, save it in a config file like config/times_topics.yml:

```ruby
api_key: 123456abcde
```

Add this line to your application's Gemfile:

```ruby
gem 'times_topics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install times_topics

## Usage

You can then interact with Times Topics:

```ruby

    require 'times_topics'

    tt = TimesTopics.new("Al Qaeda", "organization")
    # => #<TimesTopics:0x10220b798 @url="http://topics.nytimes.com/top/reference/timestopics/organizations/a/al_qaeda/index.html", @related_results=["Al Qaeda in Mesopotamia (Org)", "Al Qaeda in the Islamic Maghreb (Org)"], @query="Al Qaeda", @type="organization", @result={"results"=>["Al Qaeda in Mesopotamia (Org)", "Al Qaeda in the Islamic Maghreb (Org)"], "filter"=>"(Org)", "num_results"=>3, "query"=>"Al Qaeda"}>

    tt.url
    # => "http://topics.nytimes.com/top/reference/timestopics/organizations/a/al_qaeda/index.html"

    tt.page_exists?
    # => true

    tt.related_results
    # => ["Al Qaeda in Mesopotamia (Org)", "Al Qaeda in the Islamic Maghreb (Org)"]

    tt.related_result_urls
    # => ["http://topics.nytimes.com/top/reference/timestopics/organizations/a/al_qaeda_in_mesopotamia/index.html", "http://topics.nytimes.com/top/reference/timestopics/organizations/a/al_qaeda_in_the_islamic_maghreb/index.html"]

    tt = TimesTopics.new("Osama bin Laden")  ## defaults type to 'person'
    # => #<TimesTopics:0x10154ff18 @url="http://topics.nytimes.com/top/reference/timestopics/people/b/osama_bin_laden/index.html", @query="Osama bin Laden", @type="person", @result={"results"=>[], "filter"=>"(Per)", "num_results"=>1, "query"=>"Osama bin Laden"}>

    tt.url
    # => "http://topics.nytimes.com/top/reference/timestopics/people/b/osama_bin_laden/index.html"

    tt.page_exists?
    # => true

    tt.related_results
    # => nil
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Copyright

Copyright (c) 2010-2013 Jacqui Maher, The New York Times Company. See LICENSE for details.
