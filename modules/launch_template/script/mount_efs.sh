#!/bin/bash
/etc/eks/bootstrap.sh ${CLUSTER_NAME}
sudo yum install nfs-utils -y -q
sudo mkdir /home/ec2-user/volume
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${DNS}:/  /home/ec2-user/volume
sudo chmod 777 /home/ec2-user/volume
sudo chmod 777 /etc/fstab
sudo echo ${DNS}:/ /home/ec2-user/volume nfs4 defaults,_netdev 0 0  | sudo cat >> /etc/fstab
if [ -z "$(ls -A /home/ec2-user/volume)" ]; then
   cd /home/ec2-user/volume
   sudo yum install -y git
   sudo mkdir tmp
   git clone https://github.com/itsyndicate/its-testtask-node.git tmp/
   mv tmp/public/* ./
   rm -rf tmp
   sudo yum remove -y git
fi