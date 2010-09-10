#!~/jruby/jruby

#Autor: Fábio Rodrigues Ribeiro

#Este script faz  junta o video e legenda externa no container MASTROSKA

class Sub4mkv
  def initialize
    @vin = ARGV[0]
    @vout = ARGV[1]
    system "mkvmerge -o "+@vout.to_s+" "+@vin.to_s+" --language 0:por "+ @vin.chomp(".mkv").to_s+".sub"
  end
end

s = Sub4mkv.new
