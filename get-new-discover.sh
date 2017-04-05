export DISCOVERY="`curl -w "\n" 'https://discovery.etcd.io/new?size=1' | awk -F"/" '{ print $4 }'`"
sed -i 's/b44a63fd67711fc1b19eaf6b18887664/'$(echo $DISCOVERY)'/g' cloud-config-node*.yaml
