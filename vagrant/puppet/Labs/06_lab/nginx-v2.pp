package { 'nginx':
  ensure   => 'installed',
  notify   => Service['nginx'],
}

service { 'nginx':
  ensure      => 'running',
  enable      => 'true',
  subscribe   => [
    Package['nginx'],
    File['/usr/share/nginx/html/index.html'],
  ],
}

file { '/usr/share/nginx/html/index.html':
  ensure   => 'file',
  content  => '<h1>Hello world from nginx-v2.pp for devops formation</h1>',
  notify   => Service['nginx'],
}