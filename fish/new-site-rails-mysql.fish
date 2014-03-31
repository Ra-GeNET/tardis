function new-site-rails-mysql -d "Creates a new rails in /tardis/sites with mysql as default database"

 cd /tardis/sites
 mkdir $argv[1]
 cd $argv[1]
 rails new . -B
 skeletons default railsmysql 

 echo "# GENERATED by new-site-rails" > config/database.yml
 echo "" >> config/database.yml

 echo "development:" >> config/database.yml
 echo "  adapter: mysql2" >> config/database.yml
 echo "  encoding: utf8" >> config/database.yml
 echo -s "  database: " $argv[1] "_dev" >> config/database.yml
 echo "  username: root" >> config/database.yml
 echo "  password: shift123!@#">> config/database.yml
 echo "  host: 127.0.0.1" >> config/database.yml
 echo "  port: 3306" >> config/database.yml
 echo "  socket: /var/run/mysqld/mysqld.sock" >> config/database.yml
 echo "  pool: 5" >> config/database.yml
 echo "" >> config/database.yml

 echo "test:" >> config/database.yml
 echo "  adapter: mysql2" >> config/database.yml
 echo "  encoding: utf8" >> config/database.yml
 echo -s "  database: " $argv[1] "_test" >> config/database.yml
 echo "  username: root" >> config/database.yml
 echo "  password: shift123!@#">> config/database.yml
 echo "  host: 127.0.0.1" >> config/database.yml
 echo "  port: 3306" >> config/database.yml
 echo "  socket: /var/run/mysqld/mysqld.sock" >> config/database.yml
 echo "  pool: 5" >> config/database.yml
 echo "" >> config/database.yml

 echo "production:" >> config/database.yml
 echo "  adapter: mysql2" >> config/database.yml
 echo "  encoding: utf8" >> config/database.yml
 echo -s "  database: " $argv[1] "_prod" >> config/database.yml
 echo "  username: root" >> config/database.yml
 echo "  password: shift123!@#">> config/database.yml
 echo "  host: 127.0.0.1" >> config/database.yml
 echo "  port: 3306" >> config/database.yml
 echo "  socket: /var/run/mysqld/mysqld.sock" >> config/database.yml
 echo "  pool: 5" >> config/database.yml
 echo "" >> config/database.yml

 echo "# GENERATED by new-site-rails" > config/nginx.conf
 echo "server {" >> config/nginx.conf
 echo " listen 80;" >> config/nginx.conf
 echo -s " server_name " $argv[1] "." (hostname) ";" >> config/nginx.conf
 echo -s " root /tardis/sites/" $argv[1] "/public;" >> config/nginx.conf
 echo " passenger_enabled on;" >> config/nginx.conf
 echo " rack_env development;" >> config/nginx.conf
 echo "}" >> config/nginx.conf

 echo ""
 editor Gemfile
 bundle install
 rake db:create
 rweb

 crow success "Site $argv[1] is now ready"

end
