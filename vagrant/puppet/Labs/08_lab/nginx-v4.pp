$app     = "nginx"
$version = "v3"
$content = "<h1>Hello world from ${app}-${version}.pp for devops formation</h1>"

package { 'install application':
  name     => $app,
  ensure   => 'installed',
  notify   => Service['start application'],
}

service { 'start application':
  name        => $app,
  ensure      => 'running',
  enable      => 'true',
  subscribe   => [
    Package['install application'],
    File['/usr/share/nginx/html/index.html'],
  ],
}

file { '/usr/share/nginx/html/index.html':
  ensure   => 'file',
  content  => $content,
  notify   => Service['start application'],
}