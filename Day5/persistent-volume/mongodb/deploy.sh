echo "\nDeploying mongo db ..."
oc apply -f mongodb-pv.yml
oc apply -f mongodb-pvc.yml
oc apply -f mongodb-deploy.yml

oc get deploy,rs,po
