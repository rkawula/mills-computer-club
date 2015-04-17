require 'formula'

class DocbookXsl < Formula
  homepage 'http://docbook.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/docbook/docbook-xsl/1.78.1/docbook-xsl-1.78.1.tar.bz2'
  sha1 '1d668c845bb43c65115d1a1d9542f623801cfb6f'

  bottle do
    cellar :any
    revision 1
    sha1 "2d71a5e24820de3f498f632b47ecaf7af7875312" => :yosemite
    sha1 "236f05f3d22a6972eca770fcaf19063c6b0ec3aa" => :mavericks
    sha1 "435ee69f4fc431bff00a973a70c5f24235f5392d" => :mountain_lion
  end

  depends_on 'docbook'

  resource 'ns' do
    url 'https://downloads.sourceforge.net/project/docbook/docbook-xsl-ns/1.78.1/docbook-xsl-ns-1.78.1.tar.bz2'
    sha1 '6a0823039b22ae0e0e9bc5ecc0dc325acdc3218f'
  end

  def install
    doc_files = %w[AUTHORS BUGS COPYING NEWS README RELEASE-NOTES.txt TODO VERSION VERSION.xsl]
    xsl_files = %w[assembly catalog.xml common docsrc eclipse epub epub3 extensions
                   fo highlighting html htmlhelp images javahelp lib log manpages
                   params profiling roundtrip slides template tests tools webhelp
                   website xhtml xhtml-1_1 xhtml5]
    (prefix/'docbook-xsl').install xsl_files + doc_files
    resource('ns').stage do
      (prefix/'docbook-xsl-ns').install xsl_files + doc_files + ['README.ns']
    end

    bin.write_exec_script "#{prefix}/docbook-xsl/epub/bin/dbtoepub"
  end

  def post_install
    [prefix/'docbook-xsl/catalog.xml', prefix/'docbook-xsl-ns/catalog.xml'].each do |catalog|
      system "xmlcatalog", "--noout", "--del", "file://#{catalog}", "#{etc}/xml/catalog"
      system "xmlcatalog", "--noout", "--add", "nextCatalog", "", "file://#{catalog}", "#{etc}/xml/catalog"
    end
  end
end
