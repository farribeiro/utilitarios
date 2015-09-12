class mymodule {
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

yumrepo { 'local':
	ensure => present,
	baseurl => 'http://192.168.1.2/',
	descr => 'The local repository',
	enabled => '1',
	gpgcheck => '1',
#	gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-local',
	mirrorlist => '',
}

exec { 
	path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
}
node "puppetagent.localdomain", "nagios-vp.bradw01.local" inherits "common" {}
}
