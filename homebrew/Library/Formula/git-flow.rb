class GitFlow < Formula
  homepage "https://github.com/nvie/gitflow"

  # Use the tag instead of the tarball to get submodules
  url "https://github.com/nvie/gitflow.git", :tag => "0.4.1"

  bottle do
    cellar :any
    sha1 "ab05739e882e5a930863ce03d2dcbe62ac329dc1" => :yosemite
    sha1 "a3e07853d8152891aecf98eed7943edc07e2e1ec" => :mavericks
    sha1 "0b02d71a300810649c677dd8f9b26ebc6351087f" => :mountain_lion
  end

  head do
    url "https://github.com/nvie/gitflow.git", :branch => "develop"

    resource "completion" do
      url "https://github.com/bobthecow/git-flow-completion.git", :branch => "develop"
    end
  end

  resource "completion" do
    url "https://github.com/bobthecow/git-flow-completion/archive/0.4.2.2.tar.gz"
    sha1 "d6a041b22ebdfad40efd3dedafd84c020d3f4cb4"
  end

  conflicts_with "git-flow-avh"

  def install
    system "make", "prefix=#{libexec}", "install"
    bin.write_exec_script libexec/"bin/git-flow"

    resource("completion").stage do
      bash_completion.install "git-flow-completion.bash"
      zsh_completion.install "git-flow-completion.zsh"
    end
  end

  test do
    system "git", "flow", "init", "-d"
    assert_equal "develop", shell_output("git rev-parse --abbrev-ref HEAD").strip
  end
end
