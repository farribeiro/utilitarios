class mymodule {

package { 'tzdata':
	ensure => lastest
}

package {[
	'man',
	'tmux',
	'heartbeat',
	'sudo',
	'puppet',
	'ntp',
	'ntpdate',
#	'nss-pam-ldapd',
#	'krb5-workstation',
#	'pam_krb5',
#	'nscd',
#	'openldap-clients',
	'mutt',
	'net-snmp',
	'rsync',
	'at',
	'git',
	'open-vm-tools',
	'epel-release',
	'net-tools',
	'iptraf',
	'bzip2',
	'unzip',
	'traceroute',
	'tcpdump',
	'ccze',
	'less',
	'most',
	'dnsutils',
	'nmap',
	]:
	#ensure => installed,
	ensure => present,
}

package { [
	'aria2',
	'tig',
	'htop',
	]:
	ensure    => installed,
	require   => Package['epel-release']
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

#yumrepo { 'local':
	#ensure => present,
	#baseurl => 'http://192.168.1.2/',
	#descr => 'The local repository',
	#enabled => '1',
	#gpgcheck => '1',
#	gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-local',
	#mirrorlist => '',
#}

Exec {
	path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
}

file{ '/etc/ntp/ntp.conf':
	ensure	=> file,
	owner	=> 'root',
	group	=> 'root',
	mode	=> '0644',
	source	=> 'puppet:///modules/mymodule/ntp.conf',
	notify	=> Service['ntpd'],
}

}
