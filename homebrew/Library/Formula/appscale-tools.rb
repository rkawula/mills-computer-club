class AppscaleTools < Formula
  homepage "https://github.com/AppScale/appscale-tools"
  url "https://github.com/AppScale/appscale-tools/archive/2.2.0.tar.gz"
  sha1 "74420507e21e14c780b020d487552964ecd1748f"
  head "https://github.com/AppScale/appscale-tools.git"

  bottle do
    cellar :any
    sha1 "6dae0110db95a47f949e3c8369135220910d5615" => :yosemite
    sha1 "d3078fbebb496d862b8fdb1c00dbb43de9c3def7" => :mavericks
    sha1 "a9157eeea6487d7c488e4039c778fea5f4188f23" => :mountain_lion
  end

  depends_on :python if MacOS.version <= :snow_leopard
  depends_on "libyaml"

  resource "termcolor" do
    url "https://pypi.python.org/packages/source/t/termcolor/termcolor-1.1.0.tar.gz"
    sha1 "52045880a05c0fbd192343d9c9aad46a73d20e8c"
  end

  resource "SOAPpy" do
    url "https://pypi.python.org/packages/source/S/SOAPpy/SOAPpy-0.12.6.zip"
    sha1 "72c384e9e43ce97c9cd0756567e745fcb5419430"
  end

  resource "pyyaml" do
    url "https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.11.tar.gz"
    sha1 "1a2d5df8b31124573efb9598ec6d54767f3c4cd4"
  end

  resource "boto" do
    url "https://pypi.python.org/packages/source/b/boto/boto-2.9.9.tar.gz"
    sha1 "8f8bf47a9660d6886a73c65cd00243219b5f04c4"
  end

  resource "argparse" do
    url "https://argparse.googlecode.com/files/argparse-1.2.1.tar.gz"
    sha1 "caadac82aa2576d6b445058c1fcf6ef0b14dbaa1"
  end

  resource "oauth2client" do
    url "https://pypi.python.org/packages/source/o/oauth2client/oauth2client-1.2.tar.gz"
    sha1 "d38bf2d5392e4e4eea66b039a408079f6fe008d0"
  end

  resource "google-api-python-client" do
    url "https://pypi.python.org/packages/source/g/google-api-python-client/google-api-python-client-1.2.tar.gz"
    sha1 "31ddb6e125b0683d29493c9f486d48a4f63c913b"
  end

  resource "httplib2" do
    url "https://pypi.python.org/packages/source/h/httplib2/httplib2-0.9.tar.gz"
    sha1 "1b9774a81136a222f02e711d81efb775dc87b70e"
  end

  resource "python-gflags" do
    url "https://pypi.python.org/packages/source/p/python-gflags/python-gflags-2.0.tar.gz"
    sha1 "1529a1102da2fc671f2a9a5e387ebabd1ceacbbf"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python2.7/site-packages"

    resources.each do |r|
      r.stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    end

    inreplace Dir["bin/appscale*"], /^  lib = os.*/, "  lib = '#{libexec}'"

    prefix.install "bin", "templates", "LICENSE", "README.md"
    libexec.install Dir["lib/*"]

    bin.env_script_all_files(libexec+"bin", :PYTHONPATH => "#{libexec}/lib/python2.7/site-packages")
  end

  test do
    system bin/"appscale", "help"
    system bin/"appscale", "init", "cloud"
  end
end
