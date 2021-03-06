# A number of insecure services exist.
# While disabling the servers prevents a local attack against these services,
# it is advised to remove their clients unless they are required.

class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_3_1 (
  Hash $cis_remove_package = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::cis_remove_package",
                                    Hash,
                                    'first',
                                    $cis_benchmarks::params::cis_remove_package)
  )inherits ::cis_benchmarks::params{
  $cis_remove_package.each |$package, $desc| {
    package{ $desc :
      ensure => purged,
      name   => $package,
    }
  }
} #EOF
