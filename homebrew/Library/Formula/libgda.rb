require 'formula'

class Libgda < Formula
  homepage 'http://www.gnome-db.org/'
  url 'http://ftp.gnome.org/pub/GNOME/sources/libgda/5.2/libgda-5.2.0.tar.xz'
  sha256 '41bd14aaaf50efc7b80d7279c69ed9c90d3a1894cb5123385d86883a1d7d5f30'
  bottle do
    sha1 "446acb6ebf7b20f8adb7e270a1de64815dc397c3" => :yosemite
    sha1 "408c2544e9416932199431d358d34658c38c1654" => :mavericks
    sha1 "b13d0a7d8f7884fba9abf79e0ee9845083e15add" => :mountain_lion
  end

  revision 1

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'itstool' => :build
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'readline'
  depends_on 'libgcrypt'
  depends_on 'sqlite'

  def install
    ENV.libxml2
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--disable-binreloc",
                          "--disable-gtk-doc",
                          "--without-java"
    system "make"
    system "make install"
  end
end
