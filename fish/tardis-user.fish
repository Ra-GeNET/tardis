function tardis-user -a name -d "Adds a user to this system"
  switch "$name"
    case ''
      crow error "Usage: ds-user <username>"
    case '*'      

      crow notice "Adding user to system"
      sudo adduser $name

      if test -d /home/$name 

        crow notice "Setting default group to 'tardis'"
        sudo usermod -g tardis $name  
 
        crow notice "Hooking up byobu config"      
        sudo mkdir "/home/$name/.byobu"
        sudo touch "/home/$name/.byobu/.tmux.conf"
        sudo chmod 777 "/home/$name/.byobu"
        sudo chmod 777 "/home/$name/.byobu/.tmux.conf"
        echo "source /tardis/config/byobu" > "/home/$name/.byobu/.tmux.conf" 
        sudo chown -R $name:tardis "/home/$name/.byobu"
        sudo chmod 700 "/home/$name/.byobu"
        sudo chmod 700 "/home/$name/.byobu/.tmux.conf"

        crow notice "Hooking up rvm config"
        sudo groupadd -f rvm
        sudo usermod -a -G rvm $name

        crow notice "Hooking up diakonos config"
        sudo mkdir -p "/home/$name/.diakonos"
        sudo cp  /tardis/config/diakonos.conf "/home/$name/.diakonos/diakonos.conf"

        crow notice "Make git remember your credentials"
        sudo 'su -c "git config --global credential.helper cache" -s /bin/sh $name'

        crow success "User $name succesfully added"
        mkdir -p /tardis/flags
        touch /tardis/flags/first-user

     else

       crow notice "No user has been added"

     end

  end
end
