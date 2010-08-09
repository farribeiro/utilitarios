"Coloração do texto
syntax on
"Dicionário em Portugues
set spelllang=pt
"Cores para fundo preto
set background=dark
"Força encoding e formato unix
set fenc=utf8
set enc=utf8
set fileformat=unix
"set backupext=.bak
set ai!
set nu
set ignorecase
set smartcase
set is
set lbr!
"set cindent

" code completation HTML
iab html_doc <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
iab html_char <META http-equiv="Content-Type" content="text/html; charset=utf-8">
iab linux GNU/Linux
iab html_autor <META name="author" content="Fábio Rodrigues Ribeiro">
iab latex_author \author{Fábio Rodrigues Ribeiro}
iab html_css <LINK rel="stylesheet" type="text/css" title="Padrão" href="">

" Fecha chaves, colchetes e parentes automaticamente
imap { {}<left>
imap ( ()<left>
imap [ []<left>
imap < <><left>
