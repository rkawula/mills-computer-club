class Newt < Formula
  homepage 'https://fedorahosted.org/newt/'
  url 'https://fedorahosted.org/releases/n/e/newt/newt-0.52.18.tar.gz'
  sha1 '2992c926bd3699ff0d6fd7549d4a8a018e3ac8fd'

  bottle do
    cellar :any
    sha1 "447b7cdf5ba5fb0be6bcaa80a9c30a5112071a87" => :yosemite
    sha1 "07bcf73d646dd489d10d68ded6811aa5a7d5ea57" => :mavericks
    sha1 "599600fa6e92c38dbaa7bb6e1138eda04a4c5bf1" => :mountain_lion
  end

  depends_on 'gettext'
  depends_on 'popt'
  depends_on 's-lang'
  depends_on :python => :optional

  # build dylibs with -dynamiclib; version libraries
  patch :p0 do
    url "https://trac.macports.org/export/132914/trunk/dports/devel/libnewt/files/patch-Makefile.in.diff"
    sha1 "f366a650ed100317344a3e7f49981a6dca1f4889"
  end

  def install
    args = ["--prefix=#{prefix}", "--without-tcl"]
    args << "--without-python" if build.without? 'python'

    inreplace "Makefile.in" do |s|
      # name libraries correctly
      # https://bugzilla.redhat.com/show_bug.cgi?id=1192285
      s.gsub! "libnewt.$(SOEXT).$(SONAME)", "libnewt.$(SONAME).dylib"
      s.gsub! "libnewt.$(SOEXT).$(VERSION)", "libnewt.$(VERSION).dylib"

      # don't link to libpython.dylib
      # causes https://github.com/Homebrew/homebrew/issues/30252
      # https://bugzilla.redhat.com/show_bug.cgi?id=1192286
      s.gsub! "`$$pyconfig --ldflags`", '"-undefined dynamic_lookup"'
      s.gsub! "`$$pyconfig --libs`", '""'
    end

    system "./configure", *args
    system "make", "install"
  end
end
