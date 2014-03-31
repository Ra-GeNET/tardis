function fish_greeting
  function g2 
    df -h -x tmpfs -x devtmpfs | sed "s/^/  /"
    cd /tardis/sites  
    #du -sh * | sed "s/^/  /"
    tardis-env
  end
  clear
  echo 
  toilet " " (hostname) "" -f smblock  -t -F gay
  g2 | more
end
