
echo "\nDeploying mariadb database server ..."
oc create -f mariadb-pv.yml --save-config
oc create -f mariadb-pvc.yml --save-config
oc create -f mariadb-deploy.yml --save-config
oc create -f mariadb-svc.yml --save-config

echo "\nDeploying wordpress server ..."
oc create -f wordpress-pv.yml --save-config
oc create -f wordpress-pvc.yml --save-config
oc create -f wordpress-deploy.yml --save-config
oc create -f wordpress-svc.yml --save-config
oc create -f wordpress-route.yml --save-config
