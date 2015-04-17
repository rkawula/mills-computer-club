require "formula"

class Babl < Formula
  homepage "http://www.gegl.org/babl/"

  stable do
    # The official url is unreliable. Use Debian instead.
    url "https://mirrors.kernel.org/debian/pool/main/b/babl/babl_0.1.10.orig.tar.bz2"
    mirror "http://ftp.gtk.org/pub/babl/0.1/babl-0.1.10.tar.bz2"
    sha1 "ee60089e8e9d9390e730d3ae5e41074549928b7a"

    # There are two patches.
    # The first one changes an include <values.h> (deleted on Mac OS X) to <limits.h>
    # The second one fixes an error when compiling with clang. See:
    # https://trac.macports.org/browser/trunk/dports/graphics/babl/files/clang.patch
    patch :DATA
  end

  bottle do
    sha1 "d3ead1808b7c029ab864d3318d7009379cc205a5" => :yosemite
    sha1 "4fcb4a9c92b59796d40ffc4312935ca756d5264f" => :mavericks
    sha1 "a35994e97093d303d02d30c3369bccfd1f33af37" => :mountain_lion
  end

  head do
    # Use Github instead of GNOME's git. The latter is unreliable.
    url "https://github.com/GNOME/babl.git"

    depends_on "automake" => :build
    depends_on "autoconf" => :build
    depends_on "libtool" => :build
  end

  depends_on "pkg-config" => :build

  option :universal

  def install
    if build.universal?
      ENV.universal_binary
      if ENV.compiler == :gcc
        opoo "Compilation may fail at babl-cpuaccel.c using gcc for a universal build"
      end
    end

    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

__END__
diff --git a/babl/babl-palette.c b/babl/babl-palette.c
index 7e72eaa..2f9bf8d 100644
--- a/babl/babl-palette.c
+++ b/babl/babl-palette.c
@@ -19,7 +19,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <stdio.h>
-#include <values.h>
+#include <limits.h>
 #include <assert.h>
 #include "config.h"
 #include "babl-internal.h"
diff --git a/extensions/sse-fixups.c b/extensions/sse-fixups.c
index b44bb5e..7f633d1 100644
--- a/extensions/sse-fixups.c
+++ b/extensions/sse-fixups.c
@@ -21,7 +21,7 @@

 #include "config.h"

-#if defined(__GNUC__) && (__GNUC__ >= 4) && defined(USE_SSE) && defined(USE_MMX)
+#if !defined(__clang__) && defined(__GNUC__) && (__GNUC__ >= 4) && defined(USE_SSE) && defined(USE_MMX)

 #include <stdint.h>
 #include <stdlib.h>
@@ -177,7 +177,7 @@ int init (void);
 int
 init (void)
 {
-#if defined(__GNUC__) && (__GNUC__ >= 4) && defined(USE_SSE) && defined(USE_MMX)
+#if !defined(__clang__) && defined(__GNUC__) && (__GNUC__ >= 4) && defined(USE_SSE) && defined(USE_MMX)

   const Babl *rgbaF_linear = babl_format_new (
     babl_model ("RGBA"),
