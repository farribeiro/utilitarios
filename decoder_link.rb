require "rubygems"
require "sinatra"
require "base64"

class Decoder_celular
set :port, 8080
set :enviorment, :production

def initialize
	get "/" do
		"<h1>Ajuda</h1>
		Para usar:
		<ul>
			<li>http://localhost:8080/base64/{link oculto}</li>
			<li>http://localhost:8080/invertido/{link invertido}
		</ul>"
	end
	
	get "/base64/*" do
		link = params["splat"]
		"#{Base64.decode64(link[0]).to_s}"
	end
# TODO Colocar o recheio
	get "/invertido/*" do
		link = params["splat"]
		"#{link[0].to_s}"
	end
	
	before do
		content_type :html, :charset => "utf-8"
	end
end
end

d = Decoder_celular.new
