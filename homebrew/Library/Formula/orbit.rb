require 'formula'

class Orbit < Formula
  homepage 'http://projects.gnome.org/ORBit2/'
  url 'http://ftp.gnome.org/pub/gnome/sources/ORBit2/2.14/ORBit2-2.14.19.tar.bz2'
  sha256 '55c900a905482992730f575f3eef34d50bda717c197c97c08fa5a6eafd857550'

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'libidl'

  # per MacPorts, re-enable use of deprecated glib functions
  patch :p0 do
    url "https://trac.macports.org/export/105275/trunk/dports/devel/orbit2/files/patch-linc2-src-Makefile.in.diff"
    sha1 "8941a2bec91403e49de600a74af307a95c0ce2b1"
  end

  patch :p0 do
    url "https://trac.macports.org/export/105275/trunk/dports/devel/orbit2/files/patch-configure.diff"
    sha1 "2ef976d53af55d88237e6c72ade1154c7a655556"
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
