require 'formula'

class W3m < Formula
  homepage 'http://w3m.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/w3m/w3m/w3m-0.5.3/w3m-0.5.3.tar.gz'
  sha1 '444b6c8cf7094ee95f8e9de96b37f814b9d83237'

  depends_on 'bdw-gc'
  depends_on 'openssl'

  fails_with :llvm do
    build 2334
  end

  patch :DATA

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-image"
    # Race condition in build reported in:
    # https://github.com/Homebrew/homebrew/issues/12854
    ENV.j1 #
    system "make install"
  end
end

__END__
diff --git a/main.c b/main.c
index b421943..865c744 100644
--- a/main.c
+++ b/main.c
@@ -833,7 +833,12 @@ main(int argc, char **argv, char **envp)
     mySignal(SIGPIPE, SigPipe);
 #endif
 
+#if GC_VERSION_MAJOR >= 7 && GC_VERSION_MINOR >= 2
+    orig_GC_warn_proc = GC_get_warn_proc();
+    GC_set_warn_proc(wrap_GC_warn_proc);
+#else
     orig_GC_warn_proc = GC_set_warn_proc(wrap_GC_warn_proc);
+#endif
     err_msg = Strnew();
     if (load_argc == 0) {
 	/* no URL specified */
