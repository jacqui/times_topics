require 'helper'
require File.join(File.dirname(__FILE__), '../lib/times_topics/tags.rb')

class TestTimesTags < Test::Unit::TestCase
  context "API Key" do
    should "find the api key specified in a config file" do
      Tags.config_path = File.join(File.dirname(__FILE__), 'times_topics.yml')
      assert_equal "000111222333444555666777888999abcdefg+", Tags.api_key
    end
  end

  context "Searching" do
    setup do
      Tags.config_path = File.join(File.dirname(__FILE__), 'times_topics.yml')
      #Tags.stubs(:get)
    end
    should "person_search" do
      Tags.expects(:get).with('/suggest', {:query => {'api-key' => Tags.api_key, :query => 'Sebastien', :filter => '(Per)'}})
      Tags.person_search('Sebastien')
    end
    should "organization_search" do
      Tags.expects(:get).with('/suggest', { :query => { 'api-key' => Tags.api_key, :query => 'Sebastien', :filter => '(Org)' }})
      Tags.organization_search('Sebastien')
    end
    should "geographic_search" do
      Tags.expects(:get).with('/suggest', { :query => { 'api-key' => Tags.api_key, :query => 'Sebastien', :filter => '(Geo)' }})
      Tags.geographic_search('Sebastien')
    end
    should "subject_search" do
      Tags.expects(:get).with('/suggest', {:query => {'api-key' => Tags.api_key, :query => 'Sebastien', :filter => '(Des)'}})
      Tags.subject_search('Sebastien')
    end
    should "search" do
      Tags.expects(:get).with('/suggest', {:query => {'api-key' => Tags.api_key, :query => 'Sebastien', :filter => '(Des)'}})
      Tags.search('Sebastien', 'subject')

      Tags.expects(:get).with('/suggest', { :query => { 'api-key' => Tags.api_key, :query => 'Sebastien', :filter => '(Geo)' }})
      Tags.search('Sebastien', 'geographic')

      Tags.expects(:get).with('/suggest', { :query => { 'api-key' => Tags.api_key, :query => 'Sebastien', :filter => '(Org)' }})
      Tags.search('Sebastien', 'organization')

      Tags.expects(:get).with('/suggest', { :query => { 'api-key' => Tags.api_key, :query => 'Sebastien', :filter => '(Per)' }})
      Tags.search('Sebastien', 'person')
    end

  end
end
