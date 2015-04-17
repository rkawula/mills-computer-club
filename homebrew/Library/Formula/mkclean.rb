require 'formula'

class Mkclean < Formula
  homepage 'http://www.matroska.org/downloads/mkclean.html'
  url 'https://downloads.sourceforge.net/project/matroska/mkclean/mkclean-0.8.7.tar.bz2'
  sha1 '21d9dd829086fe13771815481b6c7beeb83aca88'

  # Fixes compile error with XCode-4.3+, a hardcoded /Developer.  Reported as:
  # https://sourceforge.net/tracker/?func=detail&aid=3505611&group_id=68739&atid=522228
  patch :DATA if MacOS.prefer_64_bit?

  def install
    ENV.deparallelize # Otherwise there are races
    system "./configure"
    system "make -C mkclean"
    bindir = `corec/tools/coremake/system_output.sh`.chomp
    bin.install Dir["release/#{bindir}/mk*"]
  end
end

__END__
--- a/corec/tools/coremake/gcc_osx_x64.build	2011-09-25 02:25:46.000000000 -0700
+++ b/corec/tools/coremake/gcc_osx_x64.build	2012-03-15 16:27:46.000000000 -0700
@@ -4,9 +4,9 @@
 
 PLATFORMLIB = osx_x86
 SVNDIR = osx_x86
-SDK = /Developer/SDKs/MacOSX10.6.sdk
 
-CCFLAGS=%(CCFLAGS) -arch x86_64 -mdynamic-no-pic -mmacosx-version-min=10.6
+
+CCFLAGS=%(CCFLAGS) -arch x86_64 -mdynamic-no-pic
 ASMFLAGS = -f macho64 -D_MACHO
 
 #include "gcc_osx.inc"
