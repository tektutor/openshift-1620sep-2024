echo "\nUndeploying wordpress server ..."
oc delete -f wordpress-route.yml 
oc delete -f wordpress-svc.yml 
oc delete -f wordpress-deploy.yml 
oc delete -f wordpress-pvc.yml 
oc delete -f wordpress-pv.yml 

echo "\nUndeploying mariadb database server ..."
oc delete -f mariadb-svc.yml 
oc delete -f mariadb-deploy.yml 
oc delete -f mariadb-pvc.yml 
oc delete -f mariadb-pv.yml 

