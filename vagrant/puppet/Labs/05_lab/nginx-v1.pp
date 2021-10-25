package { 'nginx':
  ensure   => 'installed',
}

service { 'nginx':
  ensure   => 'running',
  enable   => 'true',
}

file { '/usr/share/nginx/html/index.html':
  ensure   => 'file',
  content  => '<h1>Hello world from nginx-v1.pp for devops formation</h1>',
}