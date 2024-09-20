echo "\nUndeploying mongod ..."
oc get deploy,rs,po
oc delete -f redis-deploy.yml
oc delete -f redis-pvc.yml
oc delete -f redis-pv.yml

oc get deploy,rs,po
