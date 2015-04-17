class Ctags < Formula
  homepage "http://ctags.sourceforge.net/"
  url "https://downloads.sourceforge.net/ctags/ctags-5.8.tar.gz"
  sha1 "482da1ecd182ab39bbdc09f2f02c9fba8cd20030"
  revision 1

  bottle do
    cellar :any
    sha256 "1ba38746fe55be78781dcf313977b60f242ed42d412bbaf96627daf24d9fd168" => :yosemite
    sha256 "9904dcc6f32a8f52d900339ff11ba4c9cb3e67374e558bb2abcc777fe56d49b5" => :mavericks
    sha256 "b3619b0231eb952ee7c768dbb82e2301ece1060f8c713e781767cc700f02b2f2" => :mountain_lion
  end

  head do
    url "https://svn.code.sf.net/p/ctags/code/trunk"
    depends_on "autoconf" => :build
  end

  # fixes http://sourceforge.net/tracker/?func=detail&aid=3247256&group_id=6556&atid=106556
  patch :p2, :DATA

  def install
    if build.head?
      system "autoheader"
      system "autoconf"
    end
    system "./configure", "--prefix=#{prefix}",
                          "--enable-macro-patterns",
                          "--mandir=#{man}",
                          "--with-readlib"
    system "make", "install"
  end

  def caveats
    <<-EOS.undent
      Under some circumstances, emacs and ctags can conflict. By default,
      emacs provides an executable `ctags` that would conflict with the
      executable of the same name that ctags provides. To prevent this,
      Homebrew removes the emacs `ctags` and its manpage before linking.

      However, if you install emacs with the `--keep-ctags` option, then
      the `ctags` emacs provides will not be removed. In that case, you
      won't be able to install ctags successfully. It will build but not
      link.
    EOS
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <stdio.h>
      #include <stdlib.h>

      void func()
      {
        printf("Hello World!");
      }

      int main()
      {
        func();
        return 0;
      }
    EOS
    system "#{bin}/ctags", "-R", "."
    assert_match /func.*test\.c/, File.read("tags")
  end
end

__END__
diff -ur a/ctags-5.8/read.c b/ctags-5.8/read.c
--- a/ctags-5.8/read.c	2009-07-04 17:29:02.000000000 +1200
+++ b/ctags-5.8/read.c	2012-11-04 16:19:27.000000000 +1300
@@ -18,7 +18,6 @@
 #include <string.h>
 #include <ctype.h>
 
-#define FILE_WRITE
 #include "read.h"
 #include "debug.h"
 #include "entry.h"
diff -ur a/ctags-5.8/read.h b/ctags-5.8/read.h
--- a/ctags-5.8/read.h	2008-04-30 13:45:57.000000000 +1200
+++ b/ctags-5.8/read.h	2012-11-04 16:19:18.000000000 +1300
@@ -11,12 +11,6 @@
 #ifndef _READ_H
 #define _READ_H
 
-#if defined(FILE_WRITE) || defined(VAXC)
-# define CONST_FILE
-#else
-# define CONST_FILE const
-#endif
-
 /*
 *   INCLUDE FILES
 */
@@ -95,7 +89,7 @@
 /*
 *   GLOBAL VARIABLES
 */
-extern CONST_FILE inputFile File;
+extern inputFile File;
 
 /*
 *   FUNCTION PROTOTYPES


Bugfix: Don't use strcpy on overlapping buffers
Upstream commit (not in release yet): http://sourceforge.net/p/ctags/code/782/
diff -ur a/ctags-5.8/routines.c b/ctags-5.8/routines.c
--- a/ctags-5.8/routines.c	2007-06-07 00:35:21.000000000 -0400
+++ b/ctags-5.8/routines.c	2015-03-07 20:38:58.000000000 -0500
@@ -757,13 +757,13 @@
 				else if (cp [0] != PATH_SEPARATOR)
 					cp = slashp;
 #endif
-				strcpy (cp, slashp + 3);
+				memmove (cp, slashp + 3, strlen (slashp + 3) + 1);
 				slashp = cp;
 				continue;
 			}
 			else if (slashp [2] == PATH_SEPARATOR  ||  slashp [2] == '\0')
 			{
-				strcpy (slashp, slashp + 2);
+				memmove (slashp, slashp + 2, strlen (slashp + 2) + 1);
 				continue;
 			}
 		}
