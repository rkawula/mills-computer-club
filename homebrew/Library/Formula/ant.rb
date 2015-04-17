class Ant < Formula
  homepage "http://ant.apache.org/"
  url "http://www.apache.org/dyn/closer.cgi?path=ant/binaries/apache-ant-1.9.4-bin.tar.gz"
  sha1 "6c41481e8201f6b3f7e216146b95bb6de70208bb"
  head "https://git-wip-us.apache.org/repos/asf/ant.git"

  bottle do
    cellar :any
    sha1 "56eee6f32ab55854b1ccbaa3e106129517e94f7f" => :mavericks
    sha1 "f09cd5546459a6172a60ed010444dde9cc94bac1" => :mountain_lion
    sha1 "5e90ad64f1bd68024f4fec659a6734629f349ea1" => :lion
  end

  keg_only :provided_by_osx if MacOS.version < :mavericks

  option "with-ivy", "Install ivy dependency manager"
  option "with-bcel", "Install Byte Code Engineering Library"

  resource "ivy" do
    url "http://www.apache.org/dyn/closer.cgi?path=ant/ivy/2.4.0/apache-ivy-2.4.0-bin.tar.gz"
    sha1 "97a206e3b6ec2ce9793d2ee151fa997a12647c7f"
  end

  resource "bcel" do
    url "http://central.maven.org/maven2/org/apache/bcel/bcel/5.2/bcel-5.2.jar"
    sha1 "96b2cefeb067c08c31225d48e2a689f814baae25"
  end

  def install
    rm Dir["bin/*.{bat,cmd,dll,exe}"]
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
    if build.with? "ivy"
      resource("ivy").stage do
        (libexec/"lib").install Dir["ivy-*.jar"]
      end
    end
    if build.with? "bcel"
      resource("bcel").stage do
        (libexec/"lib").install Dir["bcel-*.jar"]
      end
    end
  end

  test do
    (testpath/"build.xml").write <<-EOS.undent
      <project name="HomebrewTest" basedir=".">
        <property name="src" location="src"/>
        <property name="build" location="build"/>
        <target name="init">
          <mkdir dir="${build}"/>
        </target>
        <target name="compile" depends="init">
          <javac srcdir="${src}" destdir="${build}"/>
        </target>
      </project>
    EOS
    (testpath/"src/main/java/org/homebrew/AntTest.java").write <<-EOS.undent
      package org.homebrew;
      public class AntTest {
        public static void main(String[] args) {
          System.out.println("Testing Ant with Homebrew!");
        }
      }
    EOS
    system "#{bin}/ant", "compile"
  end
end
