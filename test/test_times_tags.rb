require 'helper'
require File.join(File.dirname(__FILE__), '../lib/times_tags.rb')

class TestTimesTags < Test::Unit::TestCase
  context "API Key" do
    should "find the api key specified in a config file" do
      TimesTags.config_path = File.join(File.dirname(__FILE__), 'times_topics.yml')
      assert_equal "000111222333444555666777888999abcdefg+", TimesTags.api_key
    end
  end

  context "Searching" do
    setup do
      TimesTags.config_path = File.join(File.dirname(__FILE__), 'times_topics.yml')
      #TimesTags.stubs(:get)
    end
    should "person_search" do
      TimesTags.expects(:get).with('/suggest', {:query => {'api-key' => TimesTags.api_key, :query => 'Sebastien', :filter => '(Per)'}})
      TimesTags.person_search('Sebastien')
    end
    should "organization_search" do
      TimesTags.expects(:get).with('/suggest', { :query => { 'api-key' => TimesTags.api_key, :query => 'Sebastien', :filter => '(Org)' }})
      TimesTags.organization_search('Sebastien')
    end
    should "geographic_search" do
      TimesTags.expects(:get).with('/suggest', { :query => { 'api-key' => TimesTags.api_key, :query => 'Sebastien', :filter => '(Geo)' }})
      TimesTags.geographic_search('Sebastien')
    end
    should "subject_search" do
      TimesTags.expects(:get).with('/suggest', {:query => {'api-key' => TimesTags.api_key, :query => 'Sebastien', :filter => '(Des)'}})
      TimesTags.subject_search('Sebastien')
    end
    should "search" do
      TimesTags.expects(:get).with('/suggest', {:query => {'api-key' => TimesTags.api_key, :query => 'Sebastien', :filter => '(Des)'}})
      TimesTags.search('Sebastien', 'subject')

      TimesTags.expects(:get).with('/suggest', { :query => { 'api-key' => TimesTags.api_key, :query => 'Sebastien', :filter => '(Geo)' }})
      TimesTags.search('Sebastien', 'geographic')

      TimesTags.expects(:get).with('/suggest', { :query => { 'api-key' => TimesTags.api_key, :query => 'Sebastien', :filter => '(Org)' }})
      TimesTags.search('Sebastien', 'organization')

      TimesTags.expects(:get).with('/suggest', { :query => { 'api-key' => TimesTags.api_key, :query => 'Sebastien', :filter => '(Per)' }})
      TimesTags.search('Sebastien', 'person')
    end

  end
end
