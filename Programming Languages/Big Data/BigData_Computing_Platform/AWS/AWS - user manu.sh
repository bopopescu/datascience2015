## AWS




# Content
# CTRL f -> "Setup instance" >>> lanugh instances EC2
# CTRL f -> "method 1" >>> Single local machine - R-studio launch
# CTRL f -> "method 2" >>> Hadoop cluster (Manual EC2)
# CTRL f -> "method 3" >>> Hadoop cluster EMR + Rhadoop
# CTRL f -> "method 4" >>> Build API connection + Connect to RDS + automate update
# CTRL f -> "method 5" >>> Host Shiny app on a EC2 instance
# CTRL f -> "method 6" >>> Create EMR Cluster
# CTRL f -> "method 7" >>> Setup EMR with Spark 





## ------------------ AWS CLI
# OSX
pip install --upgrade pip
sudo pip install awscli --ignore-installed six # install aws
aws --version

aws help # -- meua
aws ec2 help 
aws emr help 
aws ec2 describe-instances help

# aws cli structure
$ aws <command> <subcommand> [options and parameters]









































## <<<< Setup instance >>>>> ## 
# -- Windows
## [1]
## ---- Login Credential ---- ##
Username: whereislem@hotmail.com
Password: fgh67743185

## [2]
## EC2 - request instances - ubuntu (Usually use the AMI)
## link for Rstudio AMI
http://www.louisaslett.com/RStudio_AMI/
## Or Any other instance IMA you prefer


## [3]
## Security group config
SSH               TCP      22                   anywhere
All ICMP          ICMP     0 - 65535(or na)     anywhere
Custom TCP Rule   TCP      9001                 anywhere # can ignore if only one
Custom TCP Rule   TCP      9000                 anywhere # can ignore if only one
Custom TCP Rule   TCP      50000 - 50100        anywhere # can ignore if only one
HTTP              TCP      80                   anywhere #for Rstudio port

## [4]
Create key pair: "EC2UbuntuR"

## Launch! Wait till 2/2 checked

## [5]
## Download Putty / Puttygen
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html #Putty
http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html #Puttygen
Puttygen
# open, choose "SSH-2 RSA" and "2048"
# load file - select the current saved key pair (all file *.*), open
# save private key - rename "EC2UbuntuR" - yes
Putty
## Host Name - "ubuntu@public DNS"
## Go "SSH" then "Auth" - browse to add the new key pair generated
## Go back "Session" - open! - SSH launched for that instance!


## - Keep in note!
Public DNS #change every time
Hadoop1: ec2-54-85-248-63.compute-1.amazonaws.com
Hadoop2: ec2-52-23-167-94.compute-1.amazonaws.com
Hadoop3: ec2-54-208-72-51.compute-1.amazonaws.com

Private IP
172.31.57.179 Hadoop1
172.31.57.180 Hadoop2
172.31.57.181 Hadoop3

RSA Key
Hadoop1: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5wkoxoa7iAbDo5oGjrlbP8+9vwlqz74EE67pCa0qXBWBqc4MdJgtXzEvlBfSqpvwiHoMKhipkLqtUVxSGPzMf8NjqjofKYiIjeWpSxvVtAYL69d22cpM66b5zK2dCw0ZhdSOThr+pUG0MOMgpbfQ+UvN+76MJ5wwl0q7RZAk+TDJGpcawh9f9a45SxrwLJ0MWeOtV952DNoNxJLhfQMD9NeiTCDVC4s5F1S7lUjtg/V/9MzV6yMo5riAFsgFlvKtpaYfhoxTNPvu/y69NbcT1fuWEuURyDANoUNwnvfmXzAovWOmjGJC13RzOIL2uFgNMIEwYjqsA174lKugHpyfn ubuntu@ip-172-31-57-179
Hadoop2: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCT4xDDjJd3oqY0BOJf+9fs8wgmfxiPnQABP5B4VItyjU6g1qxjz1tKwN2gi/whJwPixZlseLFrNH3FIZg93krYos9h6d4rShSyDzrIPKzo5JOPrFNE2OYNyPYDb+qiudugbFCXbW9gd2j3SE+BT/vVeBFnutJEof1tUXNmDqSyY2/D8RXJKljeMt96PdjJqL5Wwuj6am9v+ZoC3LVvUcX/vcd+AwQ4M5NPI3q8YIYvZsHaNldSCQIHJud1hixAdyr9TK3yWceyxv9jywtA7nPasuFF8H/e8xGTkSUTxl1oI/fW2CksgkL4A6nW5NuAMCOhYPX8OiZijH+8PLe8GmVD ubuntu@ip-172-31-57-180
Hadoop3: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC27hloummu71NaqNXBjWmsMEQbtW4p/xAG9eIleCa7xuUcPZM6mWmTYaMdAkjP+m6hjrFlw6CRjbG/NPor1iNK0NE27j61uB7UEedr3blQdG41EuXCr90NK2eIW88jI7PcI6M8MRioPMRBPKCe8antIFeilOyYfaRwJxrGhYwikZAVIgjqbXzZ70AAr7NiS1l6qOCeX+IAQ3Ocwgi+J0pDYTIAyccx1GhKtO0Qh1PQL73Qd6o8UWPHyE8xI78mjdLP/d2/gi5EsaMZ1xqoZi/56qEvjLhsdBoBIkCnCrTOQ5LZqxCwPjvvSbguaADHmDYbwk7AtR39HpXr+LsOr4H7 ubuntu@ip-172-31-57-181
## - end - ##
















## <<<< Single local machine - R-studio launch >>>> ## >>>>> Method 1
# Regardless Putty, directly copy "Public DNS" of an instance to launch Rstudio Server
login: rstudio
password: rstudio
# need to reset
Happy analyzing!


















## <<<< Hadoop cluster >>>> ## >>>>>> Method 2
# [1] (All instances)
Login with Putty!

# [2]
# Generate your Server Key (All instances)
ssh-keygen -t rsa 
# hit enter 3 times, you will created ssh-rsa key in the file - ".ssh/id_rsa.pub"
# Access file to get the key
cat .ssh/id_rsa.pub # copy paste key into container above!

# [3]
# Configure "authorized_keys" file on each of the three (All instances)
vi ~/.ssh/authorized_keys
# then, "i" in insert mode, "ESC > o" to the last line, copy paste all rsa keys with no space
# save by "ESC", ":wq"

# [4]
# Configure "hosts" file on each of the three instances (All instances)
sudo vi /etc/hosts
# then, "i" in insert mode, "ESC > o" to the last line, copy paste all IP name with no space
# save by "ESC", ":wq"

# [5]
# By now, you have told each instance where the other instances can be reached and provided
# them security keys in order to access each other. Here is the moment of truth: we will issue
# ping commands from each instance to the other two
ping hadoop1
ping hadoop2
ping hadoop3
# exit -> "Ctrl + c"

# [6]
# Now that the servers are configured and speaking with one another, we can install Java, and
# eventually Hadoop. Each instance will need Java, so this will need to be repeated on each of the
# three nodes
sudo add-apt-repository ppa:webupd8team/java # choose enter
sudo apt-get update # update to latest version
sudo apt-get install oracle-java7-installer # (choose yes,  select “ok” once, navigate from "no" to "yes" once, user cursor to select second “ok” and enter again)
sudo apt-get install oracle-java7-set-default 
exit # change setting need to exit
# logout and log back, test whether it installed
echo $JAVA_HOME
# you should see - "/usr/lib/jvm/java-7-oracle"

# [7]
# Installing and Configuring Hadoop (Finally) (Only instance hadoop1)
wget http://www.webhostingreviewjam.com/mirror/apache/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz #(change this link if update)
tar -xzvf hadoop-2.6.0.tar.gz #(replace 2.6.0 with lastest version if update)
cd hadoop-2.6.0/etc/hadoop # change 2.6.0 if necessary

# [8]
# This will configure the Java path so that Hadoop knows where you installed Java
vi hadoop-env.sh # Edit the "hadoop-env.sh" file by typing
# Look for the line # The java implementation to use, "i" to edit
export JAVA_HOME=/usr/lib/jvm/java-7-oracle # Set the line below
# Save the file with :wq

# [9]
# Configure the Core Site File
vi core-site.xml
# Insert the following between <configuration> and </configuration>
  <property>
    <name>fs.default.name</name>
        <value>hdfs://hadoop1:9000</value>
  </property>

  <property>
    <name>hadoop.tmp.dir</name>
    <value>/home/ubuntu/hadoop/tmp</value>
  </property>
# :wq
# Create a new tmp folder for hadoop
cd ~
mkdir hadoop
cd hadoop
mkdir tmp
# Configure the Redundancy - edit "hdfs-site.xml" file
vi ~/hadoop-2.6.0/etc/hadoop/hdfs-site.xml
# Insert the following between <configuration> and </configuration>
<property>
    <name>dfs.replication</name>
    <value>2</value> 
</property>
# :wq
# Edit the "slaves" file
vi ~/hadoop-2.6.0/etc/hadoop/slaves
# Delete "localhost" and replace it with:
hadoop2
hadoop3
# :wq
# copy these configurations to the two slave nodes
scp -r ~/hadoop-2.6.0 hadoop2:/home/ubuntu # yes
scp -r ~/hadoop-2.6.0 hadoop3:/home/ubuntu # yes
# close the firewall for each instance (All instances)
sudo ufw disable

# [10]
# Formatting the master node (only hadoop1)
~/hadoop-2.6.0/bin/hadoop namenode -format
# This should produce the output:
# Storage directory /home/ubuntu/hadoop/tmp/dfs/name has been successfully
# formatted.
# find the folder
cd ~/hadoop/tmp/
# Starting Hadoop!
~/hadoop-2.6.0/sbin/start-all.sh
# check runing with:
jps
# should see: hadoop1
3459 ResourceManager
3114 NameNode
3716 Jps
3325 SecondaryNameNode
# run on hadoop2, hadoop3
jps
# should see:
3023 DataNode
3242 Jps
3158 NodeManager
# finally stop hadoop:
~/hadoop-2.6.0/sbin/stop-all.sh

# [Optional] [Not working <<<>>> exit]
# Modifying the path variable (All instances)
sudo vi /etc/environment
#change to:
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/u sr/local/games:/home/ubuntu/hadoop-2.6.0/bin:/home/ubuntu/hadoop-2.6.0/sbin"
#;wq
source /etc/environment
# try short cut
start-all.sh
  

# [11] configurate Rhadoop (All instances)
sudo apt-get install liblzma-dev # To install the dependencies for Java, run the following · code in the shell
sudo vi ~/.bashrc # Adding environment variables
# Add those lines:
export LD_LIBRARY_PATH=$JAVA_HOME/lib/amd64:$JAVA_HOME/jre/lib/amd64/server
export HADOOP_HOME=/home/ubuntu/hadoop-2.6.0
export HADOOP_CMD=$HADOOP_HOME/bin/hadoop
export HADOOP_STREAMING=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar
# Then:
source ~/.bashrc
# Configure the path of Java in R
sudo R CMD javareconf JAVA_HOME=$JAVA_HOME

# [12] Download R packages (All instances)
R
install.packages(c('rJava','codetools','Rcpp','reshape2','iterators','itertools','digest','RJSONIO','functional','bitops','caTools'))
library(rJava) # Most important package 'rJave'

# install rhdfs (Only Hadoop1)
wget https://raw.githubusercontent.com/RevolutionAnalytics/rhdfs/master/build/rhdfs_1.0.8.tar.gz
R CMD INSTALL rhdfs_1.0.8.tar.gz
R # enter R
library(rhdfs)
hdfs.init() 
hdfs.ls('/') # equivalent to the command hadoop fs -ls /
# ** Note that each time before you want to do some operations on HDFS in R, it's necessary to
# run hdfs.init()

# install rmr2 (...)
wget https://raw.githubusercontent.com/RevolutionAnalytics/rmr2/master/build/rmr2_3.2.0.tar.gz
R CMD INSTALL rmr2_3.2.0.tar.gz
R # enter R
library(rhdfs)
hdfs.init()
library(rmr2)
from.dfs(to.dfs(1:10)) # test see whether can read and write into hadoop

# install plyrmr (...)
R # enter R
install.packages(c('Hmisc','dplyr','R.methodsS3')) # dependencies
q() # quit R
# Install plyrmr(Exit R, run in the shell):
wget https://raw.githubusercontent.com/RevolutionAnalytics/plyrmr/master/build/plyrmr_0.4.0.tar.gz
R CMD INSTALL plyrmr_0.4.0.tar.gz
# check
R # enter R
library(plyrmr)
require(plyrmr)
dat = bind.cols(mtcars, carb.per.cyl = carb/cyl)
head(dat) # see data processed
# Done! rhdfs, rmr2, plyrmr installed!
















## <<<< Hadoop cluster EMR + Rhadoop >>>> ## ## >>>>>>> Method 3
url: http://blogs.aws.amazon.com/bigdata/post/Tx37RSKRFDQNTSL/Statistical-Analysis-with-Open-Source-R-and-RStudio-on-Amazon-EMR
## Install AWS CLI 
http://docs.aws.amazon.com/cli/latest/userguide/installing.html
## emR_bootstrap.sh -> saved in your S3 bucket (s3://myfolder1/myfolder2)
https://github.com/awslabs/emr-bootstrap-actions/blob/master/R/Hadoop/emR_bootstrap.sh
## hdfs_permission.sh -> saved in your S3 bucket (s3://myfolder1/myfolder2)
https://github.com/awslabs/emr-bootstrap-actions/blob/master/R/Hadoop/hdfs_permission.sh

## AWS CLI command to install and configure, replace <>
"<YOUR_BUCKET>" = s3://myfolder1/myfolder2
"<YOUR_SSH_KEY>" = full path of mykeypair.pem
"emR_bootstrap.sh" # Saved previously
"hdfs_permission.sh" # Saved previously

-> Run AWS command below:
"
aws emr create-cluster --ami-version 3.2.1 --instance-groups
InstanceGroupType=MASTER,InstanceCount=1,InstanceType=m3.2xlarge InstanceGroupType=CORE,InstanceCount=5,InstanceType=m3.2xlarge
--bootstrap-actions Path= s3://<YOUR_BUCKET>/emR_bootstrap.sh,Name=CustomAction,Args=[--rstudio,--rexamples,--plyrmr,--rhdfs]
 --steps Name=HDFS_tmp_permission,Jar=s3://elasticmapreduce/libs/script-runner/script-runner.jar,Args=s3://<YOUR_BUCKET>/hdfs_permission.sh
--region us-east-1 --ec2-attributes KeyName=<YOUR_SSH_KEY>,AvailabilityZone=us-east-1a
--no-auto-terminate --name emR-example
"
**Summary**
[ami version 3.2.1]
[m3.2xlarge X 1 = master]
[m3.2xlarge X 5 = core]
[bootstrap] path = "s3://myfolder1/myfolder2/emR_bootstrap.sh" / Name = CustomAction / Args = [--rstudio,--rexamples,--plyrmr,--rhdfs]
[Step] Name = HDFS_tmp_permission / Jar = s3://elasticmapreduce/libs/script-runner/script-runner.jar / Args = "s3://myfolder1/myfolder2/hdfs_permission.sh"
[Region] = us-east-1
[EC2 attributes] ???
[keyName] = full path of mykeypair.pem # previous or new created security group
[AvailabilityZone] = us-east-1a
[auto terminate] = No
[Cluster Name] = emR-example
***********
## Configure the secruity group
-> add port:80 / add myIP
Check Screen shot: url: http://blogs.aws.amazon.com/bigdata/post/Tx37RSKRFDQNTSL/Statistical-Analysis-with-Open-Source-R-and-RStudio-on-Amazon-EMR
# Log into Rstudio
Public DNS of Master: "ec2-###-##-##-###.compute-1.amazonaws.com" # Type in browser
> R-studio




















## <<<< Build API connection + Connect to RDS + automate update >>>> ## >>>>>> Method 4
# Request instance with AMI on EC2
edit security group to allow "mysql"
# Login shell - check (Python, R, mysql server)

# Create file sturcture - dir>mysql, dir>r, dir>python, dir>output.file, dir>output.log, dir>auth
$ls -l; $mkdir dir; $> file; $cd /path/
# Create r / python script for API
$sudo Rscript xxxx.r > ~/path/xxx.txt # execute r file and save "process" to a log file
$python xxxxx.py # execute python file
# [Optional - using shh]
cat auth
curl -b cookies -c cookies -X POST -d @auth 'https://api.appnexus.com/auth'
$url -b cookies -c cookies 'https://api.appnexus.com/member'
cat report_request
curl -b cookies -c cookies -X POST -d @report_request 'https://api.appnexus.com/report'
# back report ID
curl -b cookies -c cookies 'https://api.appnexus.com/report?id=1da13d6a1392d02d73f289dccc296010'
# check if status ok
curl -i -b cookies -c cookies 'https://api.appnexus.com/report-download?id=1da13d6a1392d02d73f289dccc296010' > /tmp/network_analytics.csv
# [--------------------]
# execute a shell command until it success (until loop)
n=0
until [ $n -ge 20 ] # try 20 times
do
   sudo Rscript API_script_loop.r > ~/data/data.log/log.txt && break 
   n=$[$n+1]
   sleep 5 # each time gap 5 seconds
done

# Set up mysql database
# Create RDS instances (Through UI - read document) - records:
mysql-copilot-dash-instance1.cmzj9dljhdnd.us-east-1.rds.amazonaws.com # hostname - end point
database; table # the names you created in the process
username; password # the ones you created in the process
port:3306
use the same security group EC2 instance used; add "all ICMP" - all IP
# security group confi
HTTP            TCP     80           0.0.0.0/0
ALL TCP         TCP     0 - 65535    0.0.0.0/0
SSH             TCP     22           0.0.0.0/0
MYSQL/Aurora    TCP     3306         0.0.0.0/0
ALL ICMP        ALL     N/A          0.0.0.0/0 # can all IPs, or specific IPs
# Launch! Wait a while let it fully set-up
# Back to shh - download mysql server and set up
$ sudo apt-get install mysql-server
# install
$ sudo netstat -tap | grep mysql
# check running?
$ sudo service mysql restart
# if not, restart it
$ vi /etc/mysql/my.cnf
# configuring: log file, port, etc, bind-address(IP)
$ sudo service mysql restart
# restart after conf
$ sudo dpkg-reconfigure mysql-server-5.5
# change mysql root password
$ mysql -h localhost -V
# check the mysql version on the local
# Login with specified credentials
$ mysql -h mysql-copilot-dash-instance1.cmzj9dljhdnd.us-east-1.rds.amazonaws.com -P 3306 -u username -p database # host, port, username, database
password # Typr in password
# >>> mysql

# Alternatively create a login auth file
$> mysql_login.txt
$vi mysql_login.txt
# add
[client]
host="hostname2"
user="username2"
password="password2"
database="database2"
# Save :wq
# login
$ mysql --defaults-file="~/path/mysql_login.txt" --local-infile=1 # enable upload local file
# when lged in mysql command
SHOW DATABASES;
SHOW TABLES;

# Create scahma
CREATE TABLE copilot_dash_log
(
Seat_ID int,
day date,
advertiser_id int,
advertiser_name varchar(255),
insertion_order_id int,
insertion_order_name varchar(255),
line_item_id int,
line_item_name varchar(255),
campaign_id int,
campaign_name varchar(255),
imps int,
clicks int,
total_convs int,
convs_rate float(6,6),
revenue float(6,6),
cost float(6,6),
profit float(6,6),
cpm float(6,6)
)

# Update Database table
ALTER TABLE copilot_dash_log
   DROP COLUMN var1,
   DROP COLUMN var2,
   ADD COLUMN var.new varchar(255) AFTER var0,
   CHANGE COLUMN var4.old var4.new timestamp



# Load local file into the created table
LOAD DATA LOCAL INFILE '~/data/data.output/1837.processed.csv' 
INTO TABLE copilot_dash_log
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; # ignore column names

# Alternatively do everything in shell command
# Create a sql script file
$> sql_script.sql
$vi sql_script.sql # loading script above; :wq
# auto-login -> execute the script in file
$mysql --defaults-file="~/path/mysql_login.txt" --local-infile=1 < ~/mysql_server_login/sql_script.sql
# Create file.sh - Add first script + second script
$> file.sh
# -------------------- file.sh ---------------------- #
python ~/report_request.file/time_update_hour.py
n=0
until [ $n -ge 20 ]
do
   sudo Rscript API_script_loop_hour.r > ~/data/data.log/log.txt && break 
   n=$[$n+1]
   sleep 5
done
mysql --defaults-file="~/mysql_server_login/host1.txt" --local-infile=1 < ~/mysql_server_login/sql_script.sql
# -------------------------------------------------- #


#Method 1 - Start when initiate ssh
# Last - combine all function into one file.sh -> execute it or execute it when instance start
$sudo vi /etc/bashrc
# Add "file.sh" content into the file
. ~/.bashrc
#:wq
# change premission
$chmod 755 ~/file.sh
# add scripts need to be execute
$vi ~/file.sh
$bash ~/file.sh # one command for all functionalities
# add this file to root to execute when log in
$vi ~/.bashrc

#Method 2 - Sceduhler with Cron on a freqency
crontab -l # Check whether is Cron file
# cehck time on machine
date
export VISUAL=vim # use vi to edit
crontab -e -u ubuntu #Create cron file / edit
# edit and add scedhule - vi
* * * * /home/ubuntu/file.sh # full path required
#wq



































## <<<< Host Shiny app on a EC2 instance >>>> ## >>>>> Method 5
# Request instance with AMI on EC2 *Use AMI has R-base downloaded
putty >>>>
# [Optional - R download]
sudo apt-get update
sudo apt-get install r-base
sudo apt-get install r-base-dev
# install "shiny" package / Install any packages needed in app in here
sudo su –root
R -e 'install.packages("shiny", repos="http://cran.rstudio.com/")'
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\"" #Other option
sudo su - -c "R -e \"install.packages('shiny', contriburl='file:///home/mli/R/dir_pkg/shiny_0.13.2.tar.gz')\"" #Build with tar file
sudo su - -c "R -e \"install.packages('/home/mli/R/dir_pkg/shiny/shiny_0.13.2.tar.gz', repos = NULL, type = "source")\""


# or
R
install.packages("shiny")
library(shiny)
# install shiny server
sudo apt-get install gdebi-core
sudo wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
sudo gdebi shiny-server-1.3.0.403-amd64.deb
sudo stop shiny-server # Stop
sudo start shiny-server # reboot
# create dir for app
cd /srv
mkdir shiny-server
cd shiny-server # Drop app folders into this dir
# server.R / ui.R / www
curl http://asdf.com/what/ever/image/img[00-99].gif # download pics
# change premission
sudo chown -R ubuntu /srv/*
# access app
ec2-54-164-84-196.compute-1.amazonaws.com:3838/test_app
[public DNS]:3838[new_directory]
# Security group 
ALL TCP         TCP     0 - 65535    0.0.0.0/0 # add custom IP to limit
SSH             TCP     22           0.0.0.0/0
# check IP go the url below:
http://checkip.amazonaws.com/








































## <<<< Create EMR Cluster >>>>> ## >>>>>>> Method 6
# [1] EMR cluster (EC2) + S3 Bucket
# -- Create Amazon S3 Bucket (For store input, output, log data)
S3 console -> "Create Bucket" -> Name; Region -> "Create" -> 
"Create Folder" -> s3://myemrbucket/output
                   s3://myemrbucket/logs
# -- Launch EMR Cluster
EMR Console
# Steps
"Create Cluster"
-> Advance Option
1.Software and Step -> Vendor: Amazon
                       Release: latest -> choose some common image
                       Edit software setting ??
                       Add steps -> create a step ?? (Next)
2.Hardware -> Network: default a virtual cloud
              EC2 Subnet ??
              Choose type / number of nodes (Next)
3.General Cluster Settings -> Cluster Name: #####
                              Logging: yes
                              S3 folder: your S3 "log" folder
                              Debugging: yes
                              Termination protection: yes
                              Tag: ???
                              EMRFS: ???
                              Bootstrap: install additional software: ??? (Next)
4.Security -> Select the EC2 key pair (Same location as instance)
              Visible to all IAM users (IAM account management)
              Permission - IAM roles customize
              EC2 security group: current security group (same location) / master - task
                                  create a new one
              Encryption Options: ???
-> Create Cluster! # takes a few minutes to set up

# submit "Hive, Pig, Jar, etc" scrpits as step in Cluster (UI)
-> Open Cluster -> Click the name of your cluster
-> Scroll to the "Step" section, click "Add step"
-> 1.Select "Step Type" >>> Hive, Pig, Jar, Streaming Program
>> [Hive, Pig] Script
"
Name
Script S3 location
Input data S3 location
Output data S3 location
Argument??
Action of failure: Continue
"
>> [Streaming Program] Script
"
Name
Mapper function S3 location // Or the name of hadoop streaming command
Reducer function S3 location // Or the name of hadoop streaming command
Input data S3 location
Output data S3 location
Argument??
Action on failure: continue
"
>> [Java] Script
"
Name
JAR S3 location
Argument
Action of failure: continue
"
-> click "Add" # Then status -> pending -> Running -> Completed
Click "Refresh" above Action column to see above

# submit "Hive, Pig, Jar, etc" scrpits as step in Cluster (Hue)
Hue is a web interface of hadoop (Interactive querying)
#Create SSH Tunnel to the Master Node to connect Hue
-> Open Cluster -> Click the name of your cluster
-> "Master public DNS" appears on the top defaults-file
-> "~/mykeypair.pem" the full path of security group keypair
>> [Linux machine]
ssh -i ~/mykeypair.pem -N -L 8157:ec2-###-##-##-###.compute-1.amazonaws.com:8888 hadoop@ec2-###-##-##-###.compute-1.amazonaws.com
>> [Windows machine]
-> Host - hadoop@ec2-###-##-##-###.compute-1.amazonaws.com
-> key - mykeypair.ppk
-> In "Category" list -> expand "Connection > SSH" -> click "Tunnels"
-> In "Source port" type unused local port number: ex. "8157"
-> In "Destination" type "ec2-###-##-##-###.compute-1.amazonaws.com:8888"
-> Leave "local" and "Auto" option selected -> click "Add"
you should see something in "Forwarded ports" like "L8157 ec2-###-##-##-###.compute-1.amazonaws.com:8888"
-> click "open" -> "yes" # When you log into the master node and are prompted for a user name, type hadoop
#Loging into Hue
-> Type the following URL in your browser: "http://localhost:8157"
-> Type username; Passward [first time] [Create super user credential]




















## <<<< Setup EMR with Spark >>>> ## >>>>>> Method 7
# - Things need to consider
"The type of source data that you want to process"
# choose the same region as S3 bucket - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-region.html

"The amount of source data and how you want to store it" "The acceptable duration and frequency of processing source data"
# Instance Types - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-ec2-instances.html
# Guildance of selecting instance - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-instances.html

"Select a Virtual Private Cloud VPC for cluster"
# Sensitive data, accessing resource on a internal network - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-vpc-subnet.html
# Private Virtual Could (PVC) - http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/dedicated-instance.html

"The metrics for monitoring cluster activities, performance, and health"
# Check Cluster performance - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-manage-view.html

"The software that you choose to install in your cluster to process and analyze data"
# AMI choose - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-software.html

"File system used by EMR"
# S3 file system + HDFS system - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-file-systems.html

"Terminate after run or long running"
# https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-longrunning-transient.html

"Prepare data into a format can be load into cluster"
# text file - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-input.html

"Prepare a output localtion"
# text file - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-output.html

"The network configuration and access control requirements for cluster connectivity"
# network permission - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-access.html
# IAM user roles, EMR service role, instance profile, security group, SSH Keys, Sysytem directory premission for hadoop

"Debugging cluster"
# use representative subset of data, archiving log files to Amazon S3 - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-debugging.html

"Tagging EMR Cluster"
# Tag - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-tags.html

"Use some other 3rd party application in EMR"
# MapR, BI tools - https://docs.aws.amazon.com/ElasticMapReduce/latest/ManagementGuide/emr-plan-third-party.html

"The cost to run clusters based on the options that you choose"
# pricing - https://aws.amazon.com/emr/pricing/


###### [Set up process]
# Step 1 - Create S3 Bucket for your cluster logs / Output Data
# -- http://docs.aws.amazon.com/ElasticMapReduce/latest/DeveloperGuide/gsg-create-bucket.html
Upload Data # -- http://docs.aws.amazon.com/ElasticMapReduce/latest/DeveloperGuide/emr-plan-upload-s3.html
aws s3 cp s3://bucket/path/to/remote/file.sh /local/path/to/file.sh # On EMR cluster


# Step 2 - Launch a EMR Cluster
# Use advanced option ... Add Spark
# -- http://docs.aws.amazon.com/ElasticMapReduce/latest/DeveloperGuide/gsg-launch-cluster.html

# Step 3 - SSH access Master node
ssh hadoop@ec2-54-162-127-193.compute-1.amazonaws.com -i ~/mykeypair.pem
$pyspark # - Pyspark
$spark-shell # - Scala

















