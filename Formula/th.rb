# Pearl th-e32f60 (SmooAI/smooth release.yml's update-homebrew-tap job
# regenerates this file on every tagged release). Hand edits will be
# overwritten on the next release; if you need to change the formula
# shape, edit the heredoc in SmooAI/smooth/.github/workflows/release.yml
# instead.
class Th < Formula
  desc "Smoo AI CLI — agent orchestration, config management, and platform tools"
  homepage "https://github.com/SmooAI/smooth"
  version "0.13.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SmooAI/smooth/releases/download/v0.13.7/th-aarch64-apple-darwin.tar.gz"
      sha256 "4c5d162afd33214b06f36b9f653397e29ab92790ea44fb7e8d49393c8d5aafd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/SmooAI/smooth/releases/download/v0.13.7/th-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd57e45ca7374e62f4704bed23a4812b9f9f50f3434410da68511dddceb5878d"
    end
    on_intel do
      url "https://github.com/SmooAI/smooth/releases/download/v0.13.7/th-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8405bc802de836ebc3758080b44c097581d7f284446fa0f193bd2a6c583f6d3"
    end
  end

  def install
    bin.install "th"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/th --version")
  end
end
