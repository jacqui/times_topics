require 'httparty'

class TimesTags
  include HTTParty

  base_uri "http://api.nytimes.com/svc/timestags"
  format :json

  def self.api_key
    config['api_key']
  end

  def self.config
    @config ||= YAML::load_file(config_path)
  end

  # Path to the times_topics.yml file.
  def self.config_path
    if @config_path.nil?
      if defined?(Rails.env)
        @config_path = File.join(RAILS_ROOT, 'config', 'times_topics.yml')
      end
    end
    @config_path
  end

  def self.config_path= value
    @config_path = value
  end

  def self.person_search(name)
    get('/suggest', :query => { :query => name, :filter => '(Per)', 'api-key' => api_key})
  end

  def self.organization_search(name)
    get('/suggest', :query => { :query => name, :filter => '(Org)', 'api-key' => api_key})
  end

  def self.geographic_search(name)
    get('/suggest', :query => { :query => name, :filter => '(Geo)', 'api-key' => api_key})
  end

  def self.subject_search(name)
    get('/suggest', :query => { :query => name, :filter => '(Des)', 'api-key' => api_key})
  end

  def self.search(query, type)
    case type
    when /person/
      person_search(query)
    when /organization/
      organization_search(query)
    when /geographic/
      geographic_search(query)
    when /subject|description/
      subject_search(query)
    else
      person_search(query)
    end
  end

end
