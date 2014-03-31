function eye-of-harmony -d "Install core system"
  crow notice 'Setting up and checking version'
  tardis-upgrade

  crow notice 'Installing RVM'
  tardis-install-rvm
  
  crow notice 'Installing Ngnix'
  tardis-install-ngnix
  
  crow notice 'Installing Rails'
  tardis-install-rails

  crow notice 'Installing MariaDB'
  tardis-install-mariadb
  
  crow notice 'Installing Diakonos'
  tardis-install-diakonos
  
  crow notice 'Installing PHP'
  tardis-install-php
  
  crow notice 'Installing PHP My Admin'
  tardis-install-phpmyadmin
  
  crow notice 'Restarting Websever'
  rweb
  
  crow notice 'Installing Node packages'
  tardis-install-npms
  
  crow success 'Done building The Eye of Harmony'
  
end
  
  
  
  
  
  
