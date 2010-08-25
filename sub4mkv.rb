#!~/jruby/jruby

#Autor: Fábio Rodrigues Ribeiro

#Este script faz a junção de legenda externa junto ao container MASTROSKA

class Sub4mkv
  def initialize
    vin = ARGV[0].to_s
    vout = ARGV[1].to_s
    system "mkvmerge -o "+vout.to_s+" "+vin.to_s+" --language 0:por "+vin.chomp(".mkv").to_s+ ".sub"
  end
end

s = Sub4mkv.new
