[ ! -f ~/.ssh/id_rsa.pub ] && ${pkgs.openssh.out}/bin/ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
