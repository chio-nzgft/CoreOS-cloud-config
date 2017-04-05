# CoreOS-cloud-config
it will setup etcd2 & Flannel in 4.9.9-coreos-r1

 - must change ssh_authorized_keys:
 - must change hostname
 - must change IP , DNS , Gateway
 - must change timezone
 - must change  etcd2: discovery:
 - username /password : core / core
 
get   etcd2: discovery: by 
```
curl -w "\n" 'https://discovery.etcd.io/new?size=1'
```

OR use script get-new-discover.sh to change cloud-config-node?.yaml file
will get env  $DISCOVERY

```
sh ./ get-new-discover.sh
d6676d5d7c22470158528bb5ff9a3469

```

TO install OS ....

```
sudo su - root
coreos-install -d /dev/sda -C stable -c ~/cloud-config-node1.yaml
```
