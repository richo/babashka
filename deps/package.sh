function install_package() {
  _package_name=$1; shift
  _platform=`uname -s`
  # -a == apt
  # -b == brew
  while getopts "a:b:" opt; do
    case "$opt" in
      a)
        apt_pkg=$OPTARG;;
      b)
        brew_pkg=$OPTARG;;
    esac
  done

  case "`uname -s`" in
    Linux)
     # TODO things other than debian derivatives
     function is_met() {
       dpkg -l | grep ${apt_pkg:-$_package_name}
     }
     function meet() {
       $__babashka_sudo apt-get install ${apt_pkg:-$_package_name}
    }
  esac
}
