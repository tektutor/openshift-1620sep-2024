echo "\nDeploying mongo db ..."
oc apply -f redis-pv.yml
oc apply -f redis-pvc.yml
oc apply -f redis-deploy.yml

oc get deploy,rs,po
