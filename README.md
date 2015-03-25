# provisioning

This tool automates the provisioning of machines to have my preferences on
them. 

How To Install With One Command
-------------------------------
This can be run from a stand-alone machine with this simple command:

```bash
wget -qO- https://github.com/yannack/provisioning/raw/master/run.sh | bash
```

If you need a shorter URL, and trust my shortening (I do), e.g., if you can't
copy/paste and are retyping, this is equivalent:

```bash
wget -qO- http://goo.gl/3cihfh | bash
```

N.B.: This will deploy, by default a desktop machine on the local machine. If you
wish to install only the server tools, follow the procedure below.


How To Install Manually
-----------------------
This is needed if you want to tweak the configuration. For instance, after
cloning, remove the desktop role from the setup.yml to deploy only to a server
with no graphical environment.

1. Install pip
  ```bash
  sudo apt-get install -y python-setuptools
  sudo easy_install pip
  ```

2. Install Ubuntu packages required for ansible and git cloning
  ```bash
  sudo apt-get install -y git  # python-dev
  ```
  
  N.B.: python-dev is not strictly required, but it enables speedups in the
  compilation of markupsafe. Install if you wish, not sure how much faster you
  will get.

3.  Checkout this repo and cd into the directory
  ```bash
  git clone https://github.com/yannack/provisioning ~/.provisioning/
  cd ~/.provisioning
  ```

4. Pip install the requirements
  ```bash
  sudo -H pip install -r requirements.txt
  ```

5. Customize your installation
This is where you might want to remove the desktop role of the current machine.
Or you may want to provision multiple machines: edit HOSTS and setup.yml.

6. Provision your local machine
  ```bash
  ansible-playbook setup.yml -i HOSTS --ask-sudo-pass --module-path ./ansible_modules
  ```

Credits
-------
This was largely inspired by, and re-uses the gconftool-2 module for ansible
of, [Joseph Kahn's similar
project](https://github.com/JBKahn/provisioning-local/)

