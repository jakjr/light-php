## Instação do ambiente de desenvolvimento

Será adotado como padrão para o ambiente de desenvolvimento PHP na Celepar, a utilização da ferramenta Vagrant + Virtual Box juntamente com uma imagem do sistema operacional SUSE, contendo o php e demais pacotes, na mesma versão que se encontram no servidor de produção.

## Sobre o Vagrant

Vagrant é uma ferramenta que facilita e ajuda na virtualização do ambiente de desenvolvimento na máquina do desenvolvedor.
Desta forma é possível ter um ambiente de desenvolvimento muito semelhante ao ambiente de homologação e produção.

Links sobre o Vagrant:

[link1](http://flaviosilveira.com/2012/vagrant-facil-e-util/)
[link2](http://www.sitepoint.com/re-introducing-vagrant-right-way-start-php/)

## Requisitos

Realize o download e faça a instalação do virtualbox e do vagrant

[Virtualbox](http://trac.gic.celepar.parana/trac/pinhao/attachment/wiki/Vagrant/virtualbox-4.3_4.3.14-95030~Ubuntu~raring_amd64.deb)

    $ sudo dpkg -i virtualbox-4.3_4.3.14-95030~Ubuntu~raring_amd64.deb

[Vagrant](http://trac.gic.celepar.parana/trac/pinhao/raw-attachment/wiki/Vagrant/vagrant_1.7.2_x86_64.deb)

    # sudo dpkg -i vagrant_1.7.2_x86_64.deb
    

## Criação do ambiente de desenvolvimento

A configuração do vagrant é mantida em um arquivo chamado **Vagrantfile**.

Já existe um aquivo pré configurado com as necessidades da Celepar.

Para realizar o download deste e outros arquivos necessários, execute o comando abaixo:

    $ git clone https://github.com/jakjr/light-php.git ~/vagrant
    
Acesse o diretŕio ~/vagrant e execute o comando para criação do ambiente:

    $ vagrant up
    
Este comando irá instalar e configurar uma máquina virtual pronta para o desenvolvimento PHP.
   
Após o fim da instalação, todo o conteúdo do diretório **~/src** está acessível no diretório **/src/www/** da máquina virtual
  
Isto permite que você edite os arquivos fontes PHP na sua estação, e que estes arquivos sejam executados na máquina virtual.
 
Por fim, execute o comando abaixo:

    $ echo 'address=/vagrant/192.168.33.10' | sudo tee --append /etc/dnsmasq.conf > /dev/null
    
Este comando irá fazer com que sua máquina virtual responda por todas as requisições HTTP com final ".vagrant"