class AutoScaling < Formula
  homepage "https://aws.amazon.com/developertools/2535"
  url "https://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip"
  version "1.0.61.6"
  sha1 "2e3aaaa2567f4dcafcedbfc05678270ab02ed341"

  depends_on :java

  def install
    env = Language::Java.java_home_env.merge(:AWS_AUTO_SCALING_HOME => libexec)
    rm Dir["bin/*.cmd"] # Remove Windows versions
    libexec.install Dir["*"]
    Pathname.glob("#{libexec}/bin/*") do |file|
      next if file.directory?
      basename = file.basename
      next if basename.to_s == "service"
      (bin/basename).write_env_script file, env
    end
  end

  def caveats
    <<-EOS.undent
      Before you can use these tools you must export some variables to your $SHELL.
        export AWS_ACCESS_KEY="<Your AWS Access ID>"
        export AWS_SECRET_KEY="<Your AWS Secret Key>"
        export AWS_CREDENTIAL_FILE="<Path to the credentials file>"

      See the website for more details:
      https://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/UsingTheCommandLineTools.html
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/as-version")
  end
end
