require 'formula'

class Play125 < Formula
  homepage 'http://www.playframework.org/'
  url 'https://github.com/playframework/play1/archive/1.2.5.tar.gz'
  sha1 '3a7299d8a9d65cb77295ed36605f5ebf726f6517'

  def install
    rm_rf 'python' # we don't need the bundled Python for windows
    rm Dir['*.bat']
    libexec.install Dir['*']
    bin.mkpath
    ln_s libexec+'play', bin
  end
end
