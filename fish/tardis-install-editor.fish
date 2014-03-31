function ds-install-editor -d "Install tardis Editor"
    cd /tardis/sites/
    git clone ssh://devstar.ra-ge.net/tardis/sites/editor
    chmod -R g+w editor
    cd /tardis/sites/editor/
    bundle install
    rake db:migrate
    rake db:data:load_dir
    rweb
end 
