function tardis-install-phpmyadmin -d "Installs phpmyadmin as a site"

    site-file-structure phpmyadmin
    cd /tardis/sites/phpmyadmin

    echo "# GENERATED by new-site-phpmyadmin" > config/nginx.conf
    echo "server {" >> config/nginx.conf
    echo " listen 80;" >> config/nginx.conf
    echo -s " server_name phpmyadmin." (hostname) ";" >> config/nginx.conf
    echo -s " root /tardis/sites/phpmyadmin/public;" >> config/nginx.conf
    echo  " access_log /tardis/sites/phpmyadmin/log/nginx.access.log;" >> config/nginx.conf;
    echo  " error_log /tardis/sites/phpmyadmin/log/nginx.error.log;" >> config/nginx.conf;
    echo " index index.php index.html index.htm;" >> config/nginx.conf
    echo " # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000" >> config/nginx.conf
    echo ' location ~ \.php$ {' >> config/nginx.conf
    echo '   try_files $uri =404;' >> config/nginx.conf
    echo '   fastcgi_pass unix:/var/run/php5-fpm.sock;' >> config/nginx.conf
    echo '   fastcgi_index index.php;' >> config/nginx.conf
    echo '   fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;' >> config/nginx.conf
    echo '   include fastcgi_params;' >> config/nginx.conf
    echo ' }' >> config/nginx.conf
    echo "}" >> config/nginx.conf

    cd /tardis/sites/phpmyadmin
    touch log/nginx.access.log
    touch log/nginx.error.log

    wget --output-document pma.tar.bz2 "http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.1.6/phpMyAdmin-4.1.6-all-languages.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fphpmyadmin%2F&ts=1390840654&use_mirror=freefr"
    tar -xvf pma.tar.bz2
    rm pma.tar.bz2
    chmod -R 775 phpMyAdmin*
    cp phpMyAdmin*/* public/. -R

    rweb
    crow success "PhpMyAdmin has been installed to /tardis/sites/phpmyadmin" as phpmyadmin.(hostname)

end
