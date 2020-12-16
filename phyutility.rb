class Phyutility < Formula
  desc "Performs simple analyses or modifications on both trees and data matrices."
  homepage "https://github.com/blackrim/phyutility"
  # See also URL: https://code.google.com/archive/p/phyutility/
  # Outdated/not maintained: http://blackrim.org/programs/phyutility/
  url "https://github.com/blackrim/phyutility/releases/download/v2.7.1/phyutility_2.7.1.tar.gz"
  sha256 "3438336abda593cf3043d49910815dc8b8e506e9e44831726407f37a1a7506bc"
  version "2.7.1"

  # See also source code from URL: https://github.com/blackrim/phyutility/archive/v2.7.1.tar.gz, which would be:
  # url "https://github.com/blackrim/phyutility/archive/v2.7.1.tar.gz"
  # sha256 "85dd9107098e87bd1fbac57148d9a1f7c755f8d80224a7b38c38727474f9c9f0"

  def install
    if File.file?("#{bin}/phyutility") then
        system "rm", "#{bin}/phyutility"
    end

    libexec.install "phyutility.jar"
    (bin+"phyutility").write <<-EOS.undent
      #!/bin/sh
      java -jar "#{libexec}/phyutility.jar" "$@"
    EOS
    pkgshare.install "examples", "manual.pdf"
  end

  def post_install
    system "chmod", "+x", "#{bin}/phyutility"
  end

  def caveats; <<-EOS.undent
    The manual and examples are in:
      #{opt_prefix}/share/phyutility
    EOS
  end

  test do
    cp Dir[pkgshare/"examples/*"], testpath
    system *%W[#{bin}/phyutility -concat -in test.aln test2.aln -out test_new.aln]
    compare_file "test_new.aln", "test_all.aln"
  end
end
