class Mvnvm < Formula
  homepage "http://mvnvm.org"
  url "https://bitbucket.org/mjensen/mvnvm/get/mvnvm-1.0.4.zip"
  sha256 "4f254e6f1df0de6f66f126251f38ac545b280bf0bbc7f05b703171b874184b19"

  head "https://bitbucket.org/mjensen/mvnvm.git"

  depends_on :java => "1.7+"

  def install
    bin.install "mvn"
    bin.env_script_all_files(libexec/"bin", Language::Java.overridable_java_home_env("1.7+"))
  end

  conflicts_with "maven", :because => "also installs a 'mvn' executable"

  test do
    (testpath/"mvnvm.properties").write <<-EOS.undent
      mvn_version=3.2.5
    EOS
    (testpath/"pom.xml").write <<-EOS.undent
      <?xml version="1.0" encoding="UTF-8"?>
      <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
        <modelVersion>4.0.0</modelVersion>
        <groupId>org.homebrew</groupId>
        <artifactId>maven-test</artifactId>
        <version>1.0.0-SNAPSHOT</version>
      </project>
    EOS
    (testpath/"src/main/java/org/homebrew/MavenTest.java").write <<-EOS.undent
      package org.homebrew;
      public class MavenTest {
        public static void main(String[] args) {
          System.out.println("Testing Maven with Homebrew!");
        }
      }
    EOS
    system "#{bin}/mvn", "compile"
  end
end
