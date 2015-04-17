require 'formula'

class Pygtksourceview < Formula
  homepage 'http://projects.gnome.org/gtksourceview/pygtksourceview.html'
  url 'http://ftp.gnome.org/pub/gnome/sources/pygtksourceview/2.10/pygtksourceview-2.10.0.tar.bz2'
  sha256 'bfdde2ce4f61d461fb34dece9433cf81a73a9c9de6b62d4eb06177b8c9cec9c7'

  depends_on 'pkg-config' => :build
  depends_on 'gtksourceview'
  depends_on 'pygtk'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-docs"  # attempts to download chunk.xsl on demand (and sometimes fails)
    system "make install"
  end

  test do
    system "python", "-c", "import gtksourceview2"
  end
end
