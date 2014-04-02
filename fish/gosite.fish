function gosite

  switch $PWD
  case '/tardis/sites/?*'
    cd (echo "puts Dir.pwd.split('/')[0..3].join('/')" | ruby)
    return 0
  case '*'
    crow error "You are not in a site folder (i.e. /tardis/sites/*)"
    return 1
  end

end
