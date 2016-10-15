1. wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.1-bin-hadoop2.7.tgz
2. tar -zxvf spark-2.0.1-bin-hadoop2.7.tgz
3. sudo mv spark-2.0.1-bin-hadoop2.7 /usr/local/spark
4. sudo vi /etc/profile
 - export SPARK_HOME=/usr/local/spark
 - export PATH=$PATH:$SPARK_HOME/bin
5. source /etc/profile

cd /usr/local/spark/conf
cp spark-env.sh.template spark-env.sh
cp slaves.template slaves
vi slaves
    master
vi spark-env.sh
export SPARK_MASTER_IP=master
export SPARK_WORKER_CORES=1
export SPARK_WORKER_MEMORY=800m
export SPARK_WORKER_INSTANCES=2


ifconfig 

6. 編輯 hosts
vi /etc/hosts
    192.168.233.155 master
	192.168.233.156
sudo hostname master 

ssh-keygen -t rsa
cat id_rsa.pub > authorized_keys

修改/etc/ssh/sshd_config

sudo vi /etc/ssh/sshd_config
將PasswordAuthentication?變更為no
sudo service sshd restart
PermitEmptyPasswords yes
PasswordAuthentication no

ssh-add
設置無密碼登入

ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys


/usr/local/spark/sbin/start-all.sh

chkconfig iptables off
service iptables stop
