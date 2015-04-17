require 'formula'

class Sdelta3 < Formula
  homepage 'http://sdelta.berlios.de/'
  url 'ftp://ftp.berlios.de//pub/sdelta/files/sdelta3-20100323.tar.bz2'
  sha1 'd99718e95b2828f2d4ec376a16b5fedc950792ee'

  patch :DATA

  def install
    # Sdelta3 code is not 64-bit clean
    ENV.m32

    # fix verbatim references to /usr
    inreplace 'sd3', "/usr/share", "#{HOMEBREW_PREFIX}/share"

    # fix incorrect help message referencing LICENSE file in sdelta3.c:
    # Makefile installs LICENSE into /usr/share/sdelta3, not into /usr/doc/sdelta
    inreplace 'sdelta3.c', "/usr/doc/sdelta", "#{HOMEBREW_PREFIX}/share/#{name}"

    system "make", "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "PREFIX=#{prefix}",
                   "install"
  end
end

__END__
diff --git a/input.h b/input.h
index 64c67bb..04d1b6e 100644
--- a/input.h
+++ b/input.h
@@ -11,6 +11,8 @@
 #include <sys/user.h>
 #elif defined(__NetBSD__)
 #include <sys/vmparam.h>
+#elif defined(__MACH__)
+#include <mach/mach.h>
 #else
 #include <sys/param.h>
 #if (defined(sun) || defined(__sun)) && !defined(PAGE_SIZE)
