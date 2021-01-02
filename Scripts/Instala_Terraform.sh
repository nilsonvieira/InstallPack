## INTALANDO TERRAFORM
_LAST_UPDATE=`wget -qO- https://releases.hashicorp.com/terraform/ | grep terraform | sed -e 's/<[^>]*>//g;s/^ //g' | grep -v beta | grep -v alpha[0-9] | grep -v rc | grep -v oc | awk -F _  '{print$2}' | head -n 1`

cd /tmp/
wget https://releases.hashicorp.com/terraform/$_LAST_UPDATE/terraform_$_LAST_UPDATE_linux_amd64.zip
unzip terraform_$_LAST_UPDATE_linux_amd64.zip
sudo mv terraform /usr/bin/