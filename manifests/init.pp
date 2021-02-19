# Class: corp104_codedeploy_agent
# ===========================
#
# Full description of class corp104_codedeploy_agent here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'corp104_codedeploy_agent':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class corp104_codedeploy_agent (
  String $ruby_version,
  String $region,
  String $install_tmp,
  Boolean $log_aws_wire,
  String $log_dir,
  String $pid_dir,
  String $program_name,
  String $package_type,
  String $root_dir,
  Boolean $verbose,
  Integer $wait_between_runs,
  String $codedeployagent_yml,
  Optional[String] $proxy_uri,
  Integer $max_revisions,
  String $codedeploy_onpremises_yml,
  String $codedeploy_agent_update_yml,
  Boolean $codedeploy_agent_update_manage,
  String $service_ensure,
  Boolean $service_enable,
  String $service_name,
  Optional[String] $http_proxy,
  Optional[String] $codedeployagent_download_url,
  Optional[String] $codedeployagent_version,
){
  contain corp104_codedeploy_agent::install
  contain corp104_codedeploy_agent::config
  contain corp104_codedeploy_agent::service

  Class['::corp104_codedeploy_agent::install']
  -> Class['::corp104_codedeploy_agent::config']
  -> Class['::corp104_codedeploy_agent::service']
}
