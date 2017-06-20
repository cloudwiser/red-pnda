#!/bin/bash
wget https://archive.apache.org/dist/hbase/1.2.0/hbase-1.2.0-bin.tar.gz
tar xzf hbase-1.2.0-bin.tar.gz -C /usr/local/

HBASE_HOME=/usr/local/hbase-1.2.0
cd $HBASE_HOME

# set java home
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> conf/hbase-env.sh
echo "export HBASE_MANAGES_ZK=false" >> conf/hbase-env.sh
rm conf/hbase-site.xml

# set hbase-site.xml
cp $1/files/hbase-site.xml $HBASE_HOME/

# start hbase
$HBASE_HOME/bin/start-hbase.sh

# add to PATH env variable
echo "export PATH=$HBASE_HOME/bin:$PATH" >> /etc/profile
source /etc/profile