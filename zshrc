#########################
#-*- coding: utf-8 -*-            
#Alterado por: Phillipe Smith                       
#########################

#export MANPATH="/usr/man:/usr/X11R6/man"
#export LESSCHARSET="latin1"
export INPUTRC="/etc/inputrc"
export LESS="-R"
export JAVA_HOME=/home/fabio/jdk
export JRUBY_HOME=/home/fabio/jruby
#export JRUBY_CP=$JRUBY_HOME/lib
export GEM_HOME=$HOME/.gems/1.8 #export GEM_PATH=$GEM_HOME/1.8
export CLASSPATH=. #:$JRUBY_CP
export MAVEN_HOME=/home/fabio/apache-maven-2.1.0
export M2=$MAVEN_HOME/bin
export PATH=$PATH:$JAVA_HOME:$JAVA_HOME/bin:$CLASSPATH:$M2:JRUBY_HOME:$JRUBY_HOME/bin:

# Salvar 50*10^3 eventos no histórico.
HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt EXTENDED_HISTORY HIST_VERIFY HIST_REDUCE_BLANKS HIST_IGNORE_ALL_DUPS
eval `dircolors -b`
unset mailpath MAILCHECK

# Configuracoes do Locale (encontre seu locale com 'locale -a' [sem as aspas])
export LANG="pt_BR.utf8"
export LC_COLLATE="C"
umask 022

# Deixa o zsh mais parecido com o vi, também faz com que as teclas del e ctrl+r funcionem normalmente.
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# Arquivo do autocompletar.
zstyle :compinstall filename '/home/fabio/.zshrc'

# Auto-completando com <TAB>
setopt auto_list
setopt auto_menu
setopt case_glob
setopt list_types
setopt glob_complete
setopt menu_complete
setopt complete_in_word
setopt complete_aliases

#Substituição do prompt automatico
setopt promptsubst

# AUTOCD *** NÃO PRECISA MAIS DIGITAR CD
setopt autocd

autoload -U compinit promptinit
autoload -Uz vcs_info
compinit
promptinit

# Ativando modo 'verbose':
zstyle ':completion:*' verbose 'yes'
zstyle ':completion:*' show-completer

# Lista colorida de complementações:
zstyle ':completion:*:default' list-colors ${(s.:.)ZLS_COLORS}

# Menu de seleção visual:
zstyle ':completion:*' menu select=3 _complete _ignored _approximate
zstyle ':completion:*' select-prompt '%S zsh: Seleção atual = %p %s'

# Auto descrição das complementações possíveis:
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# Formato das mensagens de auto-complementação:
zstyle ':completion:*:corrections' format '%Bzsh: %d (erros: %e)%b'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%Bzsh: Inválido como: %d%b'

# Listando auto-complementações em grupos:
zstyle ':completion:*:matches' groups 'yes'
zstyle ':completion:*' list-grouped
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*' group-order commands builtins

# Expandir o máximo que puder:
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _correct _match _approximate
zstyle ':completion:*:expand:*' tag-order all-expansions

# Número de erros a aceitar durante auto-complementação:
zstyle ':completion:*:approximate:*' max-errors 2 numeric

# Usar '/d/s <TAB>' para expandir para '/dir/subdir':
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

# Preservar prefixo/sufixo durante auto-complementação:
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' completer _complete _prefix _match _approximate
zstyle ':completion:*' preserve-prefix '//[^ /]##/'
zstyle ':completion:*:match:*' original only

# Opção auto-cd deve ignorar o diretório corrente:
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Evitar entradas duplicadas para os comandos abaixo:
zstyle ':completion:*:rm:*' ignore-line 'yes'
zstyle ':completion:*:cp:*' ignore-line 'yes'
zstyle ':completion:*:mv:*' ignore-line 'yes'

# Auto-complementação case-sensitive:
zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Auto-complementar a partir de curingas:
zstyle ':completion:*:complete-extended:*' matcher 'r:|[.,_-]=* r:|=*'

# Ignorar auto-complementação de funções internas do zsh:
zstyle ':completion:*:functions' ignored-patterns '_*'

# Autocompletar PID (kill).
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

#Autocompletar Version Control System
zstyle ':vcs_info:*' formats '%F{1}%s%f:%F{2}%b%f '
zstyle ':vcs_info:*' enable git svn

# Ajustar variável PS1.
# [/dir] user@host %      HH:MM
# PS1 and PS2
precmd(){vcs_info;export PS1="${vcs_info_msg_0_}[%B%n%b@%m %3~]\$ "}
#precmd(){vcs_info;export RPS1="${vcs_info_msg_0_}"}
#export RPS1="%T"
export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"

# Ajusta principais aplicativos.
export BROWSER="ff"
export EDITOR="vim"
# export XTERM="xterm"
export VIEWER="eog"

# Algumas opções.
setopt correct
setopt correctall
export SPROMPT="$(print '%{\e[37m%}zsh: Corrigir para %S%r%s ? (n|y|e): %{\e[0m%}')"

# setopt hist_ignore_all_dups
setopt hist_reduce_blanks
# setopt hist_no_functions
# setopt no_hist_beep
# setopt auto_cd
# setopt no_bg_nice
# setopt no_notify
setopt no_beep
setopt extended_glob
# setopt no_clobber

# Antialiasing para aplicações GTK/QT:
export GDK_USE_XFT=1
export QT_XFT=1

# Correção de BUG do OpenOffice
export OOO_FORCE_DESKTOP=gnome

# Carregando alguns módulos úteis:
zmodload -i zsh/complete
zmodload -i zsh/mapfile
zmodload -i zsh/mathfunc
zmodload -i zsh/complist

# Aliases
alias hsize="df -h|grep /home"
alias svns="svnserve -d -r /home/fabio/auxiliar.svn"
alias gcp="screen google-chrome --enable-plugins"
alias ls='ls -F --group-directories-first --color=always'
#alias gcc='gcc -Wall'
#alias rm='rm -iv'
#alias cp='cp -v'
#alias mv='mv -v'
#alias mkdir='mkdir -pv'
#alias pacman="sudo pacman-color"
#alias ypacman='yaourt'
#alias mem_clear='sudo mem_clear'
#alias proz='proz -r'
#alias vboxstart='sudo modprobe vboxdrv && sudo modprobe vboxnetflt'
#alias vboxstop='sudo modprobe -r vboxdrv && sudo modprobe -r vboxnetflt'
#alias vi="vim"
#alias net_restart='sudo /etc/rc.d/network restart'
#alias db.lck_rm='sudo rm -rf /var/lib/pacman/db.lck'
#alias svim="sudo vim"
alias apt-update="update-manager"
alias apt-dist="update-manager -c"
alias ff="~/firefox/firefox"
alias thunderbird="~/thunderbird/thunderbird"

# Esses alias permitem abrir um arquivo diretamente (ex, % file.txt e o vim já é aberto).
alias -s html=$BROWSER
alias -s css=$EDITOR
#alias -s org=$BROWSER
alias -s php=$BROWSER
#alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s br=$BROWSER
alias -s jpg=$VIEWER
alias -s png=$VIEWER
alias -s gif=$VIEWER
alias -s tex=$EDITOR
alias -s txt=$EDITOR
alias -s doc=soffice
alias -s odt=soffice
alias -s pdf=evince
#alias -s gz="tar zxvf"
#alias -s bz2="tar jxvf"

# Carrega módulo de matemática
load_math() {zmodload zsh/mathfunc}
      
# Man pages coloridas:
if [ -e $(`which most > /dev/null`) ]; then
	export PAGER='most -s'
	export LESSHISTFILE='-'
else
	export PAGER=less
fi
	  
# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word

# Para rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line

# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# funcoeszz
# source /home/phillipe/.zzrc
#export ZZPATH='/usr/bin/funcoeszz'
		  
############################
## Functions
#############################
#
#shot - takes a screenshot of your current window
shot ()
{
	import -w root -quality 75 "$HOME/shot-$(date +%s).png"
}
