#!/bin/bash
# move arquivos com mais de 3 dias de idade para seu arquivamento definitivo
# augusto campos - efetividade.net - 2007

# define o diretório base da organização por categoria
DIRBASE="/home/augustocc/Arquivos"

# se não existirem, cria os diretórios e subdiretórios associados
[ ! -d "$DIRBASE" ] && mkdir -p "$DIRBASE"
[ ! -d "$DIRBASE/imagens" ] && mkdir "$DIRBASE/imagens"
[ ! -d "$DIRBASE/compactados" ] && mkdir "$DIRBASE/compactados"
[ ! -d "$DIRBASE/media" ] && mkdir "$DIRBASE/media"
[ ! -d "$DIRBASE/textos" ] && mkdir "$DIRBASE/textos"

# lista de extensoes para cada categoria de conteudo.
# o primeiro item de cada lista é o subdiretório 
#   onde serão gravados os arquivos correspondentes
export GRAFICOS="$DIRBASE/imagens cdr gif xcf jpg jpeg cbr eps bmp wbz ico png xcf"
export ARCHIVES="$DIRBASE/compactados rar zip arj gz bz2 tar z tgz iso rpm deb exe pdb prc torrent skz"
export MULTIMIDIA="$DIRBASE/media ogg mp3 wav rm wmv srt swf wav au mpg mpeg mp4 mpe ra ram avi mid"
export DOCS="$DIRBASE/textos html htm shtml odt ppt xml xls mysql csv chm chm doc php cgi pdf ps rtf sql cf log dat sx sh opml txt~ html~"


####
#
# Voce não deveria precisar editar nada abaixo daqui
#
####

function findopts_iname {
	echo "$*" | awk '{
		dir=$1
		$1=""
		split($0,pattern)
		for (i in pattern) {
			args=args " -iname \"*."pattern[i]"\" -o "
		}
		gsub(/ -o $/,"",args)
		comando="find -maxdepth 1 -mtime +3 \\(" args " \\) -exec mv --backup=numbered --verbose {} \""dir"\" \\;"
		print "\n\n\n====\n"comando" --- "dir"\n====\n"
		system( comando )
	}'
}

cd "$DIRBASE"


findopts_iname $GRAFICOS
findopts_iname $ARCHIVES
findopts_iname $MULTIMIDIA
findopts_iname $DOCS
