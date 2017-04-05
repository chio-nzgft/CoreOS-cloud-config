# CoreOS-cloud-config
it will setup etcd2 & Flannel in 4.9.9-coreos-r1

 - can use ssh_authorized_keys:
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

TO install node1 OS ....

```
sudo su - root
coreos-install -d /dev/sda -C stable -c ~/cloud-config-node1.yaml
```

TO install node2 OS ....

```
sudo su - root
coreos-install -d /dev/sda -C stable -c ~/cloud-config-node2.yaml
```

TO install node3 OS ....

```
sudo su - root
coreos-install -d /dev/sda -C stable -c ~/cloud-config-node3.yaml
```
Add node02 to etcd2 Cluster
```
core@coreos1 ~ # etcdctl member add node02 http://192.168.0.70:2380

core@coreos2 ~ # systemctl daemon-reload
core@coreos2 ~ # systemctl restart etcd2.service &
core@coreos2 ~ # systemctl restart flanneld.service &
core@coreos2 ~ # systemctl restart docker.service &
```

Add node3 to etcd2 Cluster
```
core@coreos1 ~ # etcdctl member add node03 http://192.168.0.71:2380

core@coreos3 ~ # systemctl daemon-reload
core@coreos3 ~ # systemctl restart etcd2.service &
core@coreos3 ~ # systemctl restart flanneld.service &
core@coreos3 ~ # systemctl restart docker.service &
```
Check etcd2
```
core@coreos1 ~ #  etcdctl member list
15466ed25d680366: name=node01 peerURLs=http://192.168.0.69:2380 clientURLs=http://192.168.0.69:2379 isLeader=true
f41216d2d53f75ea: name=node02 peerURLs=http://192.168.0.70:2380 clientURLs=http://192.168.0.70:2379 isLeader=false
6b1fb4d51773c501: name=node03 peerURLs=http://192.168.0.71:2380 clientURLs=http://192.168.0.71:2379 isLeader=false

```
