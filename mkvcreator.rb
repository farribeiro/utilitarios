#!~/jruby/jruby

#Autor: Fábio Rodrigues Ribeiro

#Este script faz a conversão para container MASTROSKA e a 
#junção de legenda externa no container MASTROSKA

class Mkvcreator

  def initialize
    # @codec = libx264
    @vin = ARGV[0].to_s
    @vout = ARGV[1].chomp(".mkv").to_s    
  #  avi2mkv
    sub4mkv
  end

#  def avi2mkv
 #   system "mencoder "+ARGV[0].to_s+" -oac copy -ovc copy -o "+@vout.to_s+".mkv"
 # end

  def sub4mkv
    system "mkvmerge -o "+@vout.to_s+" "+@vin.to_s+" --language 0:por "+@vin.to_s+ ".sub"
  end
end

s = Mkvcreator.new
