#!/usr/bin/env bash

echo "--- Script de instalação do LightPHP: by João Alfredo"

echo "--- Criando arquivo de log: /tmp/lightphp-install.log ---"
touch /tmp/lightphp-install.log
chmod 777 /tmp/lightphp-install.log

echo "--- Adicionando variáveis de ambiente ao bash do usuários vagrant"
echo 'export PATH=/usr/local/bin:$PATH' >> /etc/bash.bashrc.local
#echo 'export PHPENV="local"'  >> /etc/bash.bashrc.local
echo 'export http_proxy="http://proxy0.celepar.parana:8080"' >> /etc/bash.bashrc.local
echo 'export https_proxy=$http_proxy' >> /etc/bash.bashrc.local
echo 'export ftp_proxy=$http_proxy' >> /etc/bash.bashrc.local
echo 'export rsync_proxy=$http_proxy' >> /etc/bash.bashrc.local
echo 'export no_proxy="localhost,127.0.0.1,10.0.0.0/8,.parana,.vagrant"' >> /etc/bash.bashrc.local
echo 'alias ls="ls -la --color"' >> /etc/bash.bashrc.local
source /etc/bash.bashrc.local

echo "--- Adicionando arquivo de repositórios do SLES Celepar"
cat << EOF > /tmp/sles_celepar.repo
[SLE11-SDK-SP1-Pool]
name=SLE11-SDK-SP1-Pool
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLE11-SDK-SP1-Pool/sle-11-x86_64/
type=rpm-md

[SLE11-SDK-SP1-Updates]
name=SLE11-SDK-SP1-Updates
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLE11-SDK-SP1-Updates/sle-11-x86_64/
type=rpm-md

[SLE11-SDK-SP2-Core]
name=SLE11-SDK-SP1-Core
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLE11-SDK-SP2-Core/sle-11-x86_64/
type=rpm-md

[SLE11-SDK-SP2-Updates]
name=SLE11-SDK-SP2-Updates
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLE11-SDK-SP2-Updates/sle-11-x86_64/
type=rpm-md

[SLE11-SDK-SP3-Pool]
name=SLE11-SDK-SP3-Pool
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLE11-SDK-SP3-Pool/sle-11-x86_64/
type=rpm-md

[SLE11-SDK-SP3-Updates]
name=SLE11-SDK-SP3-Updates
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLE11-SDK-SP3-Updates/sle-11-x86_64/
type=rpm-md

[SMT-http_smt00_eparana_parana:SLE11-WebYaST-SP2-Pool]
name=SLE11-WebYaST-SP2-Pool
enabled=0
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLE11-WebYaST-SP2-Pool/sle-11-x86_64?credentials=NCCcredentials
type=NONE
service=SMT-http_smt00_eparana_parana

[SMT-http_smt00_eparana_parana:SLE11-WebYaST-SP2-Updates]
name=SLE11-WebYaST-SP2-Updates
enabled=0
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLE11-WebYaST-SP2-Updates/sle-11-x86_64?credentials=NCCcredentials
type=NONE
service=SMT-http_smt00_eparana_parana

[SMT-http_smt00_eparana_parana:SLES11-SP1-Pool]
name=SLES11-SP1-Pool
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLES11-SP1-Pool/sle-11-x86_64?credentials=NCCcredentials
type=rpm-md
service=SMT-http_smt00_eparana_parana

[SMT-http_smt00_eparana_parana:SLES11-SP1-Updates]
name=SLES11-SP1-Updates
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLES11-SP1-Updates/sle-11-x86_64?credentials=NCCcredentials
type=rpm-md
service=SMT-http_smt00_eparana_parana

[SMT-http_smt00_eparana_parana:SLES11-SP2-Core]
name=SLES11-SP2-Core
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLES11-SP2-Core/sle-11-x86_64?credentials=NCCcredentials
type=rpm-md
service=SMT-http_smt00_eparana_parana

[SMT-http_smt00_eparana_parana:SLES11-SP2-Extension-Store]
name=SLES11-SP2-Extension-Store
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLES11-SP2-Extension-Store/sle-11-x86_64?credentials=NCCcredentials
type=rpm-md
service=SMT-http_smt00_eparana_parana

[SMT-http_smt00_eparana_parana:SLES11-SP2-Updates]
name=SLES11-SP2-Updates
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLES11-SP2-Updates/sle-11-x86_64?credentials=NCCcredentials
type=rpm-md
service=SMT-http_smt00_eparana_parana

[SMT-http_smt00_eparana_parana:SLES11-SP3-Pool]
name=SLES11-SP3-Pool
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLES11-SP3-Pool/sle-11-x86_64?credentials=NCCcredentials
type=rpm-md
service=SMT-http_smt00_eparana_parana

[SMT-http_smt00_eparana_parana:SLES11-SP3-Updates]
name=SLES11-SP3-Updates
enabled=1
autorefresh=1
baseurl=http://smt00.eparana.parana/repo/\$RCE/SLES11-SP3-Updates/sle-11-x86_64?credentials=NCCcredentials
type=rpm-md
service=SMT-http_smt00_eparana_parana

[celepar-SLE11-SDK-SP1-Updates]
name=celepar-SLE11-SDK-SP1-Updates
enabled=1
autorefresh=0
baseurl=http://smt00.eparana.parana/celepar/sles/SLE11-SDK-SP1-Updates/sle-11-x86_64/
type=rpm-md
gpgcheck=0

[celepar-SLE11-SDK-SP2-Updates]
name=celepar-SLE11-SDK-SP2-Updates
enabled=1
autorefresh=0
baseurl=http://smt00.eparana.parana/celepar/sles/SLE11-SDK-SP2-Updates/sle-11-x86_64/
type=rpm-md
gpgcheck=0

[devel_languages_misc]
name=Various programming languages (SLE_11_SP2)
enabled=1
autorefresh=0
baseurl=http://smt00.eparana.parana/repositories/devel:/languages:/misc/SLE_11_SP2/
type=rpm-md
gpgcheck=1
gpgkey=http://smt00.eparana.parana/repositories/devel:/languages:/misc/SLE_11_SP2/repodata/repomd.xml.key

[server_database_postgresql]
name=PostgreSQL and related packages (SLE_11_SP2_Update)
enabled=1
autorefresh=0
baseurl=http://smt00.eparana.parana/repositories/server:/database:/postgresql/SLE_11_SP2_Update/
type=rpm-md
gpgcheck=1
gpgkey=http://smt00.eparana.parana/repositories/server:/database:/postgresql/SLE_11_SP2_Update/repodata/repomd.xml.key

[server_monitoring]
name=Server Monitoring Software (SLE_11_SP2)
enabled=1
autorefresh=0
baseurl=http://smt00.eparana.parana/repositories/server:/monitoring/SLE_11_SP2/
type=rpm-md
gpgcheck=1
gpgkey=http://smt00.eparana.parana/repositories/server:/monitoring/SLE_11_SP2/repodata/repomd.xml.key

[server_php_extensions]
name=PHP extensions (SLE_11_SP2)
enabled=1
autorefresh=0
baseurl=http://smt00.eparana.parana/repositories/server:/php:/extensions/SLE_11_SP2/
type=rpm-md
gpgcheck=1
gpgkey=http://smt00.eparana.parana/repositories/server:/php:/extensions/SLE_11_SP2/repodata/repomd.xml.key

[server_php_language]
name=PHP Language
enabled=1
autorefresh=0
baseurl=http://smt00.eparana.parana/repositories/devel:/languages:/php/SLE_11_SP3/
type=rpm-md
EOF
zypper -q ar /tmp/sles_celepar.repo
zypper -q ref


echo "--- Instalando pacotes necessários"
zypper -q -n in {libdnet1,liblua5_1,nmap,telnet,php5-opcache,php5-readline,php5-pcntl,php5-fileinfo} 1>>/tmp/lightphp-install.log 2>>/tmp/lightphp-install.log


echo "--- Aumentando memória php client ---"
sed -i "s/memory_limit = .*/memory_limit = -1/" /etc/php5/cli/php.ini

echo "--- Executando composer self-update"
composer -q self-update

echo "--- Removendo secure-http"
composer config --global secure-http false

echo "--- Alterando owner do diretório do composer, necessário para executar o composer self-update"
chown -R vagrant /usr/local/bin/;
ln -s /usr/local/bin/composer /usr/bin/composer


echo "--- Habilitando logs de erros do PHP ---"
#sed -i "s/error_reporting = .*/error_reporting = E_ALL & ~E_STRICT & ~E_NOTICE/" /etc/php5/apache2/php.ini
#sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
#sed -i "s/error_log = .*/error_log = \/var\/log\/php.ini/" /etc/php5/apache2/php.ini
wget -q http://trac.gic.celepar.parana/trac/pinhao/raw-attachment/wiki/frameworkphp/php.ini -O /etc/php5/apache2/php.ini

echo "--- Habilitando vhost_alias ----"
/usr/sbin/a2enmod vhost_alias

echo "--- Habilitando configuração do Apache2 ---"
cat << EOF > /etc/apache2/vhosts.d/vagrant.conf
# Problemas enviando arquivos estaticos JS e CSS via Vagrant/Virtualbox
EnableSendfile Off

#javascript 
AddType text/javascript .js

AddType application/x-httpd-php .php .phtml .html

<VirtualHost *:80>
        ServerName vagrant
        ServerAlias *.vagrant
        UseCanonicalName Off

        VirtualDocumentRoot /srv/www/%1/public

        <Directory /srv/www/*/public>
            <IfModule mod_rewrite.c>
                Options +FollowSymLinks
                RewriteEngine On
                RewriteBase /
                RewriteCond %{REQUEST_FILENAME} !-d
                RewriteCond %{REQUEST_FILENAME} !-f
                RewriteRule ^ index.php [L]
            </IfModule>
        </Directory>
</VirtualHost>
EOF

rm /etc/apache2/vhosts.d/default.conf 1>>/tmp/lightphp-install.log 2>>/tmp/lightphp-install.log

/etc/init.d/apache2 restart 1>>/tmp/lightphp-install.log 2>>/tmp/lightphp-install.log


echo "--- Liberando acessos ao pgsql e mysql no firewall do SLES ---"
sed -i "s/FW_SERVICES_EXT_TCP=.*/FW_SERVICES_EXT_TCP=\"22 80 443 5432 3306\"/" /etc/sysconfig/SuSEfirewall2
/etc/init.d/SuSEfirewall2_setup restart


echo "--- Configurando composer ---"
cat << EOF > /home/vagrant/.composer/config.json
{
    "repositories": [
      {
        "type": "composer",
        "url": "http://satis.celepar.parana"
      }
    ],
    "config": {
        "github-protocols": ["https"]
    }
}
EOF

echo "--- Criando SWAP ---"
mkdir -p /var/cache/swap/
dd if=/dev/zero of=/var/cache/swap/myswap bs=1M count=512
chmod 0600 /var/cache/swap/myswap
/sbin/mkswap /var/cache/swap/myswap
/sbin/swapon /var/cache/swap/myswap
echo '/var/cache/swap/myswap    none    swap    sw    0   0' >> /etc/fstab

