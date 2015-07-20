# installation in debian 7
class stacksync{


  vcsrepo { '/home/vagrant/desktop':
    ensure   => latest, # present
    provider => git,
    source   => 'https://github.com/stacksync/desktop.git',
    user     => 'vagrant',
    owner    => 'vagrant',
    group    => 'vagrant',
  # require  => Exec['ssh know github'] # via ssh and etc. for private repo
  }->
  exec {
    'doing_foo_compile':
      command => 'make compile',
      path    => ['/usr/bin/', '/bin/'],
      cwd     => '/home/vagrant/desktop/packaging/debian'
  }->
  exec {
    'doing_foo_package':
      command => 'make package',
      path    => ['/usr/bin/', '/bin/'],
      cwd     => '/home/vagrant/desktop/packaging/debian'
  }->
  exec {
    'doing_foo_dpkg':
      command => 'sudo dpkg -i stacksync_2.0.1_all.deb',
      path    => ['/usr/bin/', '/bin/'],
      cwd     => '/home/vagrant/desktop/packaging/debian'
  }


}



