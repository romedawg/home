export PATH="/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
##export PS1="\W\[\e[36m\]\`parse_git_branch\`\[\e[m\]\[\e[36m\]:\[\e[m\] "


########################
# prompt configs
########################
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[36m\]\W\[\e[m\]\`parse_git_branch\` "

########################
# Roman's shortcuts
########################
alias la='ls -la'
alias lt='ls -ltr'
alias bb="cd ~/workspaces"

########################
#Scripts to execute
########################
alias eapp_jconsole='/Users/rrafacz/gohealth_scripts/eapp_pdf_redelivery_jconsole.sh eapp2.bo-prod.norvax.net'

########################
# Random gohealth servers
########################
alias hm-pdf='ssh hm-pdf1.bo-prod.norvax.net'
alias ftp1='ssh ftp1.bo-prod.norvax.net'
alias plesk='ssh plesk1.bo-prod.norvax.net'
alias opsadm1='ssh opsadm1.ops.norvax.net'
alias reporting1='ssh reporting1.dev.norvax.net'
alias backup_files='ssh db-f.ch1-prod.norvax.net'
alias jenkins='ssh jenkins1.dev.norvax.net'

########################
# Docker Stuff
########################
alias docker_clean="for x in $(docker ps --format={{.Names}});do docker stop $x; docker rm $x;docker ps -aq --no-trunc | xargs docker rm;docker system prune -a --volumes; done"
alias clean_containers="docker rm $(docker ps -a -q)"
alias centos7="docker run -ti nexus.dev.norvax.net:8082/gohealth/centos-7"
#alias ubuntu="docker run -ti -v ~/Downloads:/downloads nexus.dev.norvax.net:8082/gohealth/ubuntu"
alias ubuntu="docker run -ti -v /Users/rrafacz/SRE/bitbucket/packer:/packer nexus.dev.norvax.net:8082/gohealth/ubuntu"
alias docker_mysql="docker run --env-file /Users/rrafacz/workspaces/docker-percona-mysql/env.prop -v /tmp/mysql_dir:/opt/mysql_tools --name mysql -d nexus.dev.norvax.net:8082/gohealth/percona-mysql-5.7"
alias clean_images="docker rm $(docker ps -q -f status=exited)"

######################## # Go Paths ########################
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export GO111MODULE=on

export AWS_REGION="us-east-2"
alias source_aws_creds="source ~/.aws/aws-creds.sh"
alias python='python3'
alias pip='pip3'


##################
# Ansible commands
alias ansible_mysql_cluster_one="ansible-playbook -i ./inventory/ec2.py --extra-vars "cluster=one build_env=dev first_source_master=true" ./playbooks/mysql-cluster-one.yml"
