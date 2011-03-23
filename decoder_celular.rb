require "rubygems"
#require "bundler"
require "sinatra"
require "base64"

class Decoder_celular
	def initialize
		get "/base64/*" do
			content_type 'text/css', :charset => 'utf-8'
			link = params["splat"]
			"#{Base64.decode64(link[0]).to_s}"
		end

		get "/invertido/*" do
			link = params["splat"]
			"#{link[0].to_s}"
		end
	end
end

d = Decoder_celular.new
