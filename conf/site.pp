class Common{# node	 "common" {

package { 'tzdata':
	ensure => lastest
}

package {[
	"htop",
	"man",
	"tmux",
	"heartbeat",
	"sudo",
	"puppet",
	"ntp",
	"ntpdate",
#	"nss-pam-ldapd",
#	"krb5-workstation",
#	"pam_krb5",
#	"nscd",
#	"openldap-clients",
	"mutt",
	"net-snmp",
	"rsync",
	"at",
	"git"
	"tig",
	"openvm-tools-nox11",
	"aria2",
	"epel-release",
	"net-tools"
	'iptraf',
	'bzip2',
	'unzip',
	'traceroute',
	'tcpdump',
	'ccze',
	'less',
	"most",
	'dnsutils',
	'nmap',
	]:
	#ensure => installed,
	ensure => present,
}

service { 'ntpd':
	ensure => running,
	enable => true,
	require => Package['ntp']
	# pattern => 'ntpd',
}

service { 'firewalld':
	ensure => running,
	enable => true,
	# pattern => 'firewalld',
}

}

node "puppetagent.localdomain", "nagios-vp.bradw01.local" inherits "common" {}
}
