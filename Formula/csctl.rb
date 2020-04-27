class Csctl < Formula
  desc "Lightbend Cloudstate CLI"
  homepage "https://cloudstate.io"

  if OS.linux?
    url "https://downloads.lbcs.io/0.0.7/csctl_linux_amd64_0.0.7.tar.gz"
    sha256 "fd5e751fdef9be72ed93fdced3e31546cee8b1e7e023bb883595d71aec59ab3f"
  else
    url "https://downloads.lbcs.io/0.0.7/csctl_darwin_amd64_0.0.7.tar.gz"
    sha256 "5a5d0328093cbf2a624d8f96ea92517f86d69f5d34aafd2d6a35606965031f18"
  end

  option "without-completion", "Do not install shell completion"

  bottle :unneeded

  depends_on OS.linux? ? :linux : :macos

  uses_from_macos "tar"

  def install
    bin.install "csctl"

    if OS.mac? && MacOS.version >= :catalina
      if Utils.popen_read("xattr #{bin}/csctl") =~ /com.apple.quarantine/
        (bin/"csctl").chmod 0755
        begin
          system "xattr", "-d",
                          "com.apple.quarantine",
                          bin/"csctl"
        ensure
          (bin/"csctl").chmod 0555
        end
      end
    end

    unless build.without? "completion"
      output = Utils.popen_read("#{bin}/csctl completion --shell bash")
      (bash_completion/"csctl").write output

      output = Utils.popen_read("#{bin}/csctl completion --shell zsh")
      (zsh_completion/"_csctl").write output
    end

    prefix.install_metafiles
  end

  def caveats
    <<~EOS
      Thank you for installing the Lightbend Cloudstate CLI!

      To see help and a list of available commands type:
        $ csctl help

      You can sign into your Cloudstate account using:
        $ csctl auth login

      Remember to set your current project with:
        $ csctl config set project

      For more information on how to use the Cloudstate CLI and
      the Lightbend Cloudstate managed cloud service, visit:
        https://docs.lbcs.io/
    EOS
  end

  test do
    assert_predicate bin/"csctl", :exist?
    system "csctl", "version"
  end
end
