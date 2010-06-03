class TimesTopics
  BASE_URI = 'http://topics.nytimes.com/top/reference/timestopics/'
  attr_accessor :query, :type, :url, :result, :related_results, :num_results

  def initialize(query, type = 'person')
    @type = type
    @query = query

    if @result = TimesTags.search(query, type)
      @num_results = @result["num_results"]
      if @num_results > 0
        top_result = @result["results"].shift
        case @type
        when /person/
          @url = build_person_url(top_result)
        when /organization/
          @url = build_organization_url(top_result)
        end

        if @result["num_results"] > 1
          @related_results = @result["results"]
        end
      end
    end
  end

  def filter(long_form)
    case long_form
    when /org/i
      "(Org)"
    when /people|person/i
      "(Per)"
    when /geo/i
      "(Geo)"
    when /des/i
      "(Des)"
    end
  end

  def page_exists?
    return false if @url.nil?
    parsed_url = URI.parse(@url)
    request = Net::HTTP::Get.new(parsed_url.path)
    result = Net::HTTP.start(parsed_url.host, parsed_url.port) {|http|
      http.request(request)
    }
    result.is_a?(Net::HTTPOK)
  end

  def related_result_urls
    return [] if @related_results.nil? || @related_results.empty?
    @related_results.map do |result|
      case @type
      when /person/i
        build_person_url(result)
      when /organization/
        build_organization_url(result)
      end
    end
  end

  def build_person_url(result)
    # http://topics.nytimes.com/top/reference/timestopics/people/b/osama_bin_laden/index.html
    topic_name = result.sub(filter('person'), "").split(',').map(&:strip).reverse.join('_').gsub(/\s/, '_').downcase
    index_char = result[0,1].downcase
    BASE_URI + 'people/' + index_char + '/' + topic_name + '/index.html'
  end

  def build_organization_url(result)
    # http://topics.nytimes.com/top/reference/timestopics/organizations/a/al_qaeda/index.html
    topic_name = result.sub(filter('organization'), "").strip.gsub(/\s/, '_').downcase
    index_char = result[0,1].downcase
    BASE_URI + 'organizations/' + index_char + '/' + topic_name + '/index.html'
  end


end
