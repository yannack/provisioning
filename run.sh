# echo -e "please make sure the config.json file is up-to-date, and press [ENTER]" && read USELESS_VAR
# python-dev and libyaml are needed to install ansible with all optimizations
# However, at the moment PyYAML does not compile correctly with libyaml-dev
# installed, so might as well not get it.
sudo apt-get install -y python-setuptools git python-dev # libyaml-dev
sudo -H easy_install pip

git clone https://github.com/yannack/provisioning ~/.provisioning/
cd ~/.provisioning

sudo -H pip install -r requirements.txt

ansible-playbook setup.yml -i HOSTS --ask-sudo-pass  --module-path ./ansible_modules # --extra-vars "@config.json"

echo "The ~/.provisioning folder contains the deployment repository. This can be used to deploy elsewhere over ssh, or upgrade later."
exit 0
