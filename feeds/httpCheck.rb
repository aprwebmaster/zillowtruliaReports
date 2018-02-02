require 'rubygems'
require 'yaml'
require 'net/http'
require 'uri'

#
# Check that the HTTP Response is as expected.
# See -help for format of the input file
#
class CheckHttpResponse

  def initialize
    # Don't do anything at the moment
  end

  #
  # Given a resource list process the URLs and verify that the HTTP responses are as expected
  #
  # resource_list_yml - The path to the yaml file that we want to process
  #
  def check( resource_list_yml )
    resources = _load_yaml( resource_list_yml )
    results = resources.inject([]) do | memo, resource_array |
      resource, attributes = resource_array
      if result = _check_status_code( resource,
                         attributes['protocol'] ? attributes['protocol'] : 'http',
                         attributes['code'].to_i,
                         attributes['redirect'] )
        memo << result
      end
      memo
    end
    if results.size > 0
      puts "Oops, we have a problem with these resources:"
      puts
      results.each do | result |
        puts "Error:"
        puts result[0]
        puts
        puts "For resource:"
        puts result[1]
        puts
        puts "--------------------"
        puts
      end
    end
  end

  private

  #
  # For this resource and protocol check that the status code and any redirect are as expected. If a redirect is
  # returned then this URL is also checked to make sure that it exists (status = 200).
  #
  # resource - $domain:$port/$uri
  # protocol - http or as specified in the input file
  # code - The expected HTTP response code
  # redirect - The substring that you wish to exact match with any response.header['Location'] value
  #
  def _check_status_code( resource, protocol, code, redirect )

    puts "Check status for [#{resource}]"

    if (resource =~ /^http/)
      res = resource
    else
      res = protocol + '://' + resource
    end
    puts "Constructed Res [#{res}]"
    url = URI.parse(res)
    req = Net::HTTP::Get.new(url.path)
    puts "Checking Host [#{url.host}], Port [#{url.port}], Path [#{url.path}]"
    response = Net::HTTP.start( url.host, url.port ) { |http| http.request( req ) }

    puts "Response code for [#{resource}], expected [#{code}], actual [#{response.code}]"
    if response.code != code.to_s
      result = [ "Response Code expected [#{code}], actual [#{response.code}]", resource ]
    elsif ( code == 301 || code == 302 )
      redirected = response.header['Location']
      unless ( redirected && redirected =~ /^#{redirect}$/ )
        puts "#{code} Redirect Location expected [#{redirect}], actual [#{redirected}]"
        result = [ "#{code} Redirect Location expected [#{redirect}], actual [#{redirected}]", resource ]
      else
        puts "Redirected to [#{redirected}]"
        puts "-----------------------------"
        result = _check_status_code( redirected, protocol, 200, nil )
      end
    end
    puts "Returning HTTP failure for [#{result}]" if result
    puts
    result
  end

  #
  # Load the yaml or bail out with an error
  # yaml_file - The path to the yaml file to be loaded
  #
  def _load_yaml(yaml_file)
    # load the config
    throw "Oops, can't load the yaml file [#{yaml_file}]" unless yaml_file && File.exists?(yaml_file)
    YAML.load_file(yaml_file)
  end
end

if ARGV.size != 1 || ARGV[0] =~ /\-help/
  puts
  puts "usage: #{File.basename(__FILE__)} your_list_of_resources.yml"
  puts "File list is NOT optional...not specifying a list will cause this message to be rendered"
  puts
  puts "The input file should be structured as follows:"
  puts <<-eos
        ---
        blog.solamante.co.uk/2014/02/sorolla-and-mediterranean.html:
          code: 301
          redirect: http://solamante.co.uk/blog/2014/02/23/sorolla-and-mediterranean
        blog.solamante.co.uk/2014/02/sorolla-and-mediterranean.html:
          code: 301
          redirect: http://solamante.co.uk/blog/2014/02/23/sorolla-and-mediterranean
          # Add this if you want to check TLS behaviour too
          protocol: https
      eos
  if ARGV.size != 1
    puts "Expected 1 argument and you supplied [#{ARGV.size}] arguments - [#{ARGV}]"
    puts
  end
  exit
elsif ARGV[0] =~ /\.yml$/
  # naive check of the arg is OK
  CheckHttpResponse.new.check(ARGV[0])
else
  #problem with the arg format
  puts "Argument [#{ARGV[0]}] does not appear to be the expected format"
  exit
end