function tardis-upgrade -d "Brings core and configuration up to date" 

  mkdir -p /tardis/flags
  touch /tardis/flags/first-upgrade

  crow notice "Ensuring tools, logs & sites folder"
  mkdir -p /tardis/tools
  mkdir -p /tardis/logs
  mkdir -p /tardis/sites
  mkdir -p /tardis/source
  mkdir -p /tardis/fishc
  mkdir -p /tardis/skeletons
  mkdir -p /tardis/archive

  crow notice "Pull most recent changes from remote git"
  git pull

  crow notice "Update fish auto-completitions"
  fish_update_completions 
  
  crow notice "Changing write permissions /tardis*"
  sudo chmod -R g+w /tardis
  
  crow success "Finished tardis-upgrade proccess"

end
