function tardis-install-npms -d "Install Node js packages"
  crow notice 'Installing Sails'
  sudo npm -g install sails
  
  crow notice 'Installing Shell js'
  sudo npm -g install shelljs
end
