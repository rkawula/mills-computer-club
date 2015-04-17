require "formula"

class Imapsync < Formula
  homepage "http://ks.lamiral.info/imapsync/"
  url "https://fedorahosted.org/released/imapsync/imapsync-1.607.tgz"
  sha1 "c9d6dd43cf10ba7f90a363900484085d9ce682a4"

  head "https://git.fedorahosted.org/git/imapsync.git"

  bottle do
    sha1 "3e0967b9f61fd147242089ab6e93fd573fef7c31" => :yosemite
    sha1 "667c9e72e7b361147fa419e3b61fe8e021662d85" => :mavericks
    sha1 "a15bf0b97404cc06c9ca6b366e0fcce9cf4f554d" => :mountain_lion
  end

  resource "Unicode::String" do
    url "http://www.cpan.org/authors/id/G/GA/GAAS/Unicode-String-2.09.tar.gz"
    mirror "http://www.mcpan.org/authors/id/G/GA/GAAS/Unicode-String-2.09.tar.gz"
    sha1 "7cc47c5a1c5e38f23886bbc613b27a4a4a3d5459"
  end

  resource "File::Copy::Recursive" do
    url "http://search.cpan.org/CPAN/authors/id/D/DM/DMUEY/File-Copy-Recursive-0.38.tar.gz"
    mirror "http://search.mcpan.org/CPAN/authors/id/D/DM/DMUEY/File-Copy-Recursive-0.38.tar.gz"
    sha1 "6c3a48c8ba70ad6b1ea97c4aac6b1f2d310a8e8d"
  end

  resource "Mail::IMAPClient" do
    url "http://search.cpan.org/CPAN/authors/id/P/PL/PLOBBES/Mail-IMAPClient-3.35.tar.gz"
    mirror "http://search.mcpan.org/CPAN/authors/id/P/PL/PLOBBES/Mail-IMAPClient-3.35.tar.gz"
    sha1 "96cbe63b112cdd7c411566c5ae3ed8dafba4f7bd"
  end

  resource "Authen::NTLM" do
    url "http://search.cpan.org/CPAN/authors/id/N/NB/NBEBOUT/NTLM-1.09.tar.gz"
    mirror "http://search.mcpan.org/CPAN/authors/id/N/NB/NBEBOUT/NTLM-1.09.tar.gz"
    sha1 "91064a6ce7ccf0eb8ef498a2f3dc3d30e9406dfe"
  end

  resource "IO::Tee" do
    url "http://search.cpan.org/CPAN/authors/id/K/KE/KENSHAN/IO-Tee-0.64.tar.gz"
    mirror "http://search.mcpan.org/CPAN/authors/id/K/KE/KENSHAN/IO-Tee-0.64.tar.gz"
    sha1 "29314311318e3e0bee01623a23eda4f1ba629b76"
  end

  def install
    ENV.prepend_create_path 'PERL5LIB', libexec+'lib/perl5'

    resources.each do |r|
      r.stage do
        system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
        system "make"
        system "make", "install"
      end
    end

    system "perl", "-c", "imapsync"
    system "pod2man", "imapsync", "imapsync.1"
    bin.install "imapsync"
    man1.install "imapsync.1"
    bin.env_script_all_files(libexec+"bin", :PERL5LIB => ENV['PERL5LIB'])
  end
end
