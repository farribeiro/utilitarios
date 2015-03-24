node 	"common" {
	package {[
		"htop",
		"man",
		"tmux",
		"heartbeat",
		"sudo",
		"puppet",
		"ntp",
		"ntpdate",
		"nss-pam-ldapd",
		"krb5-workstation",
		"pam_krb5",
		"nscd",
		"openldap-clients",
		"mutt",
		"net-snmp",
		"rsync",
		"at",
		"git"
		"tig",
		"openvm-tools-nox11",
		"aria2",
		"epel-release"
		]:
		ensure => present,
	}
}

node	"puppetagent.localdomain",
	"nagios-vp.bradw01.local" inherits "common" {}
