class Pidgin < Formula
  homepage "https://pidgin.im/"
  url "https://downloads.sourceforge.net/project/pidgin/Pidgin/2.10.11/pidgin-2.10.11.tar.bz2"
  sha256 "f2ae211341fc77efb9945d40e9932aa535cdf3a6c8993fe7919fca8cc1c04007"

  bottle do
    revision 3
    sha256 "7f19887890554a229bb5420cd711efd804185f77e2ade0abba3aca35e6496d9e" => :yosemite
    sha256 "407a6b5d8084607f93c223007809812cabfaf71ad8c5916f4c2e428bdee62af6" => :mavericks
    sha256 "9e83c9d5dede335dbf51e03ba9df1af06e98851c54440465dacf96653f3546ce" => :mountain_lion
  end

  option "with-perl", "Build Pidgin with Perl support"
  option "without-gui", "Build Finch instead of Pidgin"

  deprecated_option "perl" => "with-perl"
  deprecated_option "without-GUI" => "without-gui"

  depends_on "pkg-config" => :build
  depends_on "intltool" => :build
  depends_on "gettext"
  depends_on "gsasl" => :optional
  depends_on "gnutls"
  depends_on "libgcrypt"

  if build.with? "gui"
    depends_on :x11 => :optional
    depends_on "gtk+"
    depends_on "cairo"
    depends_on "pango"
    depends_on "libotr"
  else
    depends_on "glib"
    depends_on "libidn"
  end

  # Finch has an equal port called purple-otr but it is a NIGHTMARE to compile
  # If you want to fix this and create a PR on Homebrew please do so.
  resource "pidgin-otr" do
    url "https://otr.cypherpunks.ca/pidgin-otr-4.0.1.tar.gz"
    sha256 "1b781f48c27bcc9de3136c0674810df23f7d6b44c727dbf4dfb24067909bf30a"
  end

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
      --disable-avahi
      --disable-doxygen
      --enable-gnutls=yes
      --disable-dbus
      --disable-gevolution
      --disable-gstreamer
      --disable-gstreamer-interfaces
      --disable-gtkspell
      --disable-meanwhile
      --disable-vv
    ]

    args << "--disable-perl" if build.without? "perl"
    args << "--enable-cyrus-sasl" if build.with? "gsasl"

    if build.without? "gui"
      args << "--with-tclconfig=#{MacOS.sdk_path}/usr/lib"
      args << "--with-tkconfig=#{MacOS.sdk_path}/usr/lib"
      args << "--without-x"
      args << "--disable-gtkui"
    else
      args << "--with-x"
      args << "--disable-idn"
    end

    system "./configure", *args
    system "make", "install"

    if build.with? "gui"
      resource("pidgin-otr").stage do
        ENV.prepend "CFLAGS", "-I#{Formula["libotr"].opt_include}"
        ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
        system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
        system "make", "install"
      end
    end
  end

  test do
    system "#{bin}/finch", "--version"
  end
end
