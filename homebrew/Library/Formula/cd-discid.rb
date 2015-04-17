require 'formula'

class CdDiscid < Formula
  homepage 'http://linukz.org/cd-discid.shtml'
  url 'http://linukz.org/download/cd-discid-1.1.tar.gz'
  sha1 '74cedeb2c5bf4f3248af249c0ff344ea9d713d1a'

  patch :p0 do
    url "https://trac.macports.org/export/70630/trunk/dports/audio/cd-discid/files/patch-cd-discid.c.diff"
    sha1 "a3fbc189fbd093fe4db1bdc0e31e691bdf9ef207"
  end

  def install
    system "make", "prefix=#{prefix}",
                   "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "install"
  end
end
