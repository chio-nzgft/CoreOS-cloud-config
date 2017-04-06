export DISCOVERY="`curl -w "\n" 'https://discovery.etcd.io/new?size=1' | awk -F"/" '{ print $4 }'`"
sed -i 's/cfc776e559313baf985f40ae20bffcdb/'$(echo $DISCOVERY)'/g' cloud-config-node*.yaml
echo $DISCOVERY
