require 'formula'

class Wkhtmltopdf099 < Formula
  homepage 'http://code.google.com/p/wkhtmltopdf/'
  url 'http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.9.9.tar.bz2'
  sha1 '41f598c0103326e7c13101391447b0284b4ba3cb'

  depends_on 'qt'

  def install
    # fix that missing TEMP= include
    inreplace 'wkhtmltopdf.pro' do |s|
      s.gsub! 'TEMP = $$[QT_INSTALL_LIBS] libQtGui.prl', ''
      s.gsub! 'include($$join(TEMP, "/"))', ''
    end

    # Always creates a useless .app doh,
    # AFAIK this is fixed in 0.10.0beta
    wkhtml_bin = 'wkhtmltopdf.app/Contents/MacOS/wkhtmltopdf'
    wkhtml_man = "#{name}.1"

    system "qmake"
    system "make"
    system "#{wkhtml_bin} --manpage > #{wkhtml_man}"

    # install binary and man file
    bin.install wkhtml_bin
    man1.install wkhtml_man
  end
end
