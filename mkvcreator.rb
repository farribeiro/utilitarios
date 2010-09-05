#!~/jruby/jruby

#Autor: Fábio Rodrigues Ribeiro

#Este script faz a junção de legenda externa junto ao container MASTROSKA

class Mkvcreator

  def initialize
    @vin = ARGV[0].to_s
    @vout = ARGV[1].chomp(".mkv").to_s
    #    puts "verdadeiro"  if @vin.
    #    avi2mkv
    sub4mkv
  end

  def avi2mkv
    
  end

  def sub4mkv
    system "mkvmerge -o "+@vout.to_s+" "+@vin.to_s+" --language 0:por "+@vin.to_s+ ".sub"
  end
end

s = Mkvcreator.new
