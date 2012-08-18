class rcfiles (
  $manage_vim  = true,
  $manage_bash = true,
) {

  File {
    mode  => 0644,
    owner => 'root',
    group => 'root',
  }

  if $manage_vim {
    include rcfiles::vim
  }

  if $manage_bash {
    include rcfiles::bash
  }
}
