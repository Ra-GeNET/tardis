 
#TARDIS Server IDE

## What is TARDIS?
TARDIS is an highly opinionated server configuration for all round web development which started as [Devstar IDE](https://github.com/RamonGebben/devstar) by [RamonGebben](https://github.com/RamonGebben) and [RalfN](https://github.com/RalfN). It lays focus on usability, shell scripting, workflow optimisation and collabrative coding.

> *Battle tested on Ubuntu 12.04.3 x64*

##Setup

To install make a TARDIS of your server just run the install script as root on a new server.

`bash <(curl 'https://raw.githubusercontent.com/Ra-GeNET/tardis/master/install/install.sh')`

At the end of the script your server will reboot, wait a few seconds and reconnect.

Now you will jump into a Byobu session with fish shell.
Now we need to set up user account. You do this by trowing: 

`tardis-user`

To fix up the rest of the programs en dependencies run: 

`eye-of-harmony`

When The Eye of Harmony is done building the engine that makes it posible to travel in time and space, the server will reboot again.

Now you are ready to go fight Cyberman.

Happy Coding.






