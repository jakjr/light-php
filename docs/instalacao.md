## Instação do ambiente de desenvolvimento

Será adotado como padrão para o ambiente de desenvolvimento PHP na Celepar, a utilização da ferramenta Vagrant + Virtual Box juntamente com uma imagem do sistema operacional SUSE, contendo o php e demais pacotes, na mesma versão que se encontram no servidor de produção.

## Sobre o Vagrant

Vagrant é uma ferramenta que facilita e ajuda na virtualização do ambiente de desenvolvimento na máquina do desenvolvedor.
Desta forma é possível ter um ambiente de desenvolvimento muito semelhante ao ambiente de homologação e produção.

## Requisitos

Realize o download e faça a instalação do virtualbox e do vagrant

[Virtualbox](http://trac.gic.celepar.parana/trac/pinhao/attachment/wiki/Vagrant/virtualbox-4.3_4.3.14-95030~Ubuntu~raring_amd64.deb)

    $ sudo dpkg -i virtualbox-4.3_4.3.14-95030~Ubuntu~raring_amd64.deb

[Vagrant](http://trac.gic.celepar.parana/trac/pinhao/raw-attachment/wiki/Vagrant/vagrant_1.7.2_x86_64.deb)

    # sudo dpkg -i vagrant_1.7.2_x86_64.deb
    

## Criação do ambiente de desenvolvimento

A configuração do vagrant é mantida em um arquivo chamado **Vagrantfile**

Já existe um aquivo pré configurado com as necessidades da Celepar.

Para realizar o download deste, e outros arquivos necessários, execute o comando abaixo:

    $ git clone https://github.com/jakjr/light-php.git ~/vagrant
    
Acesse o diretŕio ~/vagrant e execute o comando para criação do ambiente:

    $ vagrant up