## Criando o projeto mínimo

Temos um projeto mínimo do Light-PHP que fornece uma maneira fácil de iniciar novos projetos.

Abaixo seguem os passos para realizar a instalação:

Acesse a máquina virtual previamente instalada:
    
    $ cd ~/vagrant
    $ vagrant ssh
    
Baixe o projeto:

    $ composer create-project celepar/light-minimo /srv/www/##NOME_PROJETO## --repository-url=http://satis.celepar.parana
    
Após o composer finalizar, acesse em seu navegador o endereço:
 
    http://##NOME_PROJETO##.vagrant/
    
    
Qualquer alteração que você realizar no diretório ~/srv/##NOME_PROJETO## será refletido e executado pela máquina virtual.