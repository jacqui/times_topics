# TimesTopics

A simple wrapper for the TimesTags API and Times Topics

Interact with the [TimesTags API](http://developer.nytimes.com/docs/timestags_api) with this rubygem. Find people, organizations, locations, and subjects matching queries. Find Times Topics pages for query matches along with related topics, when applicable.

## Usage

First, ensure you have an API key. You may request one on [the NYT developer site](http://developer.nytimes.com/apps/register/).

Once you have an API key, save it in a config file like config/times_topics.yml:

```ruby
api_key: 123456abcde
```

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

### Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

### Copyright

Copyright (c) 2010 Jacqui Maher. See LICENSE for details.
