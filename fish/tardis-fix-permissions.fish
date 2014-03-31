function tardis-fix-permissions -d "Fix tardis group permissions"

  sudo chgrp -R tardis /tardis
  sudo chmod -R g+w /tardis
  crow success "Make sure all files /tardis have group tardis and group-permission to write"

end
