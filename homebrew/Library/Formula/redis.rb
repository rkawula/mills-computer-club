class Redis < Formula
  homepage "http://redis.io/"
  url "http://download.redis.io/releases/redis-3.0.0.tar.gz"
  sha1 "c75fd32900187a7c9f9d07c412ea3b3315691c65"

  bottle do
    sha256 "9222eb768c9f165d35fa923b6ddaf57830928d5bf281b4d794aa14dd63fe5a04" => :yosemite
    sha256 "283dd74ac65cc8a793144d732b51ec3d125e39172990f12dc7569dd107d25bf2" => :mavericks
    sha256 "20c407d4ff095a40f3eb3980652adae13e75316c33526c34bd73be19a5df2dab" => :mountain_lion
  end

  head "https://github.com/antirez/redis.git", :branch => "unstable"

  fails_with :llvm do
    build 2334
    cause "Fails with \"reference out of range from _linenoise\""
  end

  def install
    # Architecture isn't detected correctly on 32bit Snow Leopard without help
    ENV["OBJARCH"] = "-arch #{MacOS.preferred_arch}"

    system "make", "install", "PREFIX=#{prefix}", "CC=#{ENV.cc}"

    %w[run db/redis log].each { |p| (var+p).mkpath }

    # Fix up default conf file to match our paths
    inreplace "redis.conf" do |s|
      s.gsub! "/var/run/redis.pid", "#{var}/run/redis.pid"
      s.gsub! "dir ./", "dir #{var}/db/redis/"
      s.gsub! "\# bind 127.0.0.1", "bind 127.0.0.1"
    end

    etc.install "redis.conf"
    etc.install "sentinel.conf" => "redis-sentinel.conf"
  end

  plist_options :manual => "redis-server #{HOMEBREW_PREFIX}/etc/redis.conf"

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <dict>
          <key>SuccessfulExit</key>
          <false/>
        </dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/redis-server</string>
          <string>#{etc}/redis.conf</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{var}</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/redis.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/redis.log</string>
      </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/redis-server", "--test-memory", "2"
  end
end
