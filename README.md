# CoreOS-cloud-config
it will setup etcd2 & Flannel in 4.9.9-coreos-r1

 - must change ssh_authorized_keys:
 - must change hostname
 - must change IP , DNS , Gateway
 - must change timezone
 - must change  etcd2: discovery:
 
get   etcd2: discovery: by 

curl -w "\n" 'https://discovery.etcd.io/new?size=1'

exec 

...
sudo su - root
coreos-install -d /dev/sda -C stable -c ~/cloud-config.yaml
...
