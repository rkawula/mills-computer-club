require "formula"

class Volatility < Formula
  homepage "https://github.com/volatilityfoundation/volatility"
  url "http://downloads.volatilityfoundation.org/releases/2.4/volatility-2.4.tar.gz"
  sha1 "77ae1443062a5103c63377aee6170d6e09ca6354"
  head "https://github.com/volatilityfoundation/volatility.git"

  bottle do
    revision 1
    sha1 "cf22cc05b0a17b14ebd781ce9ba8776df093fbfc" => :yosemite
    sha1 "fa9bf1f6eed8a25ebeef726bcb178858e9c97043" => :mavericks
    sha1 "f98e08887443635e783ca8bb2395b0737a810a93" => :mountain_lion
  end

  depends_on :python if MacOS.version <= :snow_leopard
  depends_on "yara"

  resource "yara-python" do
    url "https://github.com/plusvic/yara/archive/v3.2.0.tar.gz"
    sha1 "dd1a92b1469cd629f6cd368aec32f207375b125b"
  end

  resource "distorm3" do
    url "https://distorm.googlecode.com/files/distorm3.zip"
    sha1 "774acbb1d734bc83d4c487185dbe9acd51c61851"
  end

  resource "pycrypto" do
    url "https://github.com/dlitz/pycrypto/archive/v2.6.1.tar.gz"
    sha1 "9b7fb7fd9c59624f2db7c1d98f62adde1b85f4c5"
  end

  resource "PIL" do
    url "http://effbot.org/downloads/Imaging-1.1.7.tar.gz"
    sha1 "76c37504251171fda8da8e63ecb8bc42a69a5c81"
  end

  resource "openpyxl" do
    url "https://pypi.python.org/packages/source/o/openpyxl/openpyxl-2.0.5.tar.gz"
    sha1 "8a2c7de46719edfcd2d551ea29fe0409dc3c2763"
  end

  resource "ipython" do
    url "https://pypi.python.org/packages/source/i/ipython/ipython-2.2.0.tar.gz"
    sha1 "ff8e3a2f756d62405f200a2c73aedfafd84076ac"
  end

  resource "readline" do
    url "https://pypi.python.org/packages/source/r/readline/readline-6.2.4.1.tar.gz"
    sha1 "8d9c29e527177a1d4597e356a090b7547fc32d3a"
  end

  resource "pytz" do
    url "https://pypi.python.org/packages/source/p/pytz/pytz-2014.4.tar.gz"
    sha1 "ea81b61079da4cf04839b1c369232137465d88f3"
  end

  def install
    ENV["PYTHONPATH"] = lib+"python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python2.7/site-packages"

    res = %w(distorm3 pycrypto PIL openpyxl pytz ipython readline)

    res.each do |r|
      resource(r).stage do
        system "python", "setup.py", "build"
        system "python", "setup.py", "install", "--prefix=#{libexec}"
      end
    end

    resource("yara-python").stage do
      cd ("yara-python") do
        system "python", "setup.py", "build"
        system "python", "setup.py", "install", "--prefix=#{libexec}"
      end
    end

    system "python", "setup.py", "install", "--prefix=#{prefix}",
               "--single-version-externally-managed", "--record=installed.txt"

    bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/vol.py", "--info"
  end
end
