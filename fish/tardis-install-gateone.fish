function tardis-install-gateone -d "Installs gateone web-terminal"
   rm /tardis/source/GateOne -R
   crow notice "Installing python pip support" 
   sudo apt-get -y install python-pip
   crow notice "Cloning GateOne repository into /tardis/source/GateOne"
   mkdir -p /tardis/source
   cd   /tardis/source
   git clone https://github.com/liftoff/GateOne.git
   cd /tardis/source/GateOne
   sudo python setup.py install
   sudo service gateone start
end
