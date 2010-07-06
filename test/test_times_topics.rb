require 'helper'

class TestTimesTopics < Test::Unit::TestCase
  context "TimesTopics" do
    context "not found" do
      setup do
        TimesTags.stubs(:search).returns({ "results"=>[], "filter"=>"(Per)", "num_results"=>0, "query"=>"Not found"})
        @topic = TimesTopics.new("Not found")
      end
      should "page_exists?" do
        assert !@topic.page_exists?
      end
      should "url" do
        assert_nil @topic.url
      end
      should "related_result_urls" do
        assert @topic.related_result_urls.empty?
      end
    end

    context "result found" do
      setup do
        TimesTags.stubs(:search).returns({"results"=>["bin Laden, Osama (Per)"], "filter"=>"(Per)", "num_results"=>1, "query"=>"Osama Bin Laden"})
        @topic = TimesTopics.new("Osama Bin Laden")
      end
      should "page_exists?" do
        assert @topic.page_exists?
      end
      should "tag" do
        assert_equal "bin Laden, Osama (Per)", @topic.tag
      end
      should "url" do
        assert_equal "http://topics.nytimes.com/top/reference/timestopics/people/b/osama_bin_laden/index.html", @topic.url
      end
      should "related_result_urls" do
        assert @topic.related_result_urls.empty?
      end
    end
  end
end
