class Magnet < Formula
  
  desc "Shell script pipeline for inferring ML gene trees for many loci (e.g. genomic RAD loci)"
  homepage "https://github.com/justincbagley/MAGNET"
  url "https://github.com/justincbagley/magnet/archive/v1.2.0.tar.gz"
  sha256 ""
  version "1.2.0"
  
  ## Optionally, specify a repository to be used. Brew then generates a '--HEAD | --head' option. 
  ## Remember to also test it. 'master' is the default branch and doesn't need stating with a
  ## :branch conditional.
  head "https://github.com/justincbagley/MAGNET.git"

  ## Using 'bin.install' here is essentially saying move '<script>' into #{prefix}/bin/. prefix.install is 
  ## essentially saying move script into the main or #{prefix} dir. Dir helps us copy a whole directory
  ## with ease.
  def install
    prefix.install "MAGNET"
    prefix.install "MAGNET.sh"
    prefix.install "LICENSE"
    prefix.install "changeLog.md"
    prefix.install "README.md"
    prefix.install "README.pdf"
    prefix.install Dir["archive"]    
    prefix.install Dir["shell"]    
    prefix.install Dir["perl"]    
    prefix.install Dir["R"]    

    # Add MAGNET and MAGNET.sh (version w/shell script extension) to "$(brew --prefix)/bin", which is usually 
    # "/usr/local/bin", after first removing previous versions (if present):
    if File.file?("#{bin}/MAGNET") then
        system "rm", "#{bin}/MAGNET"
    end
    if File.file?("#{bin}/MAGNET.sh") then
        system "rm", "#{bin}/MAGNET.sh"
    end
    bin.install "#{prefix}/MAGNET"
    bin.install "#{prefix}/MAGNET.sh"    
  end

  def post_install
    system "chmod", "+x", "#{bin}/MAGNET"
    system "chmod", "+x", "#{bin}/MAGNET.sh"
  end

  test do
    ## Modified example, commented out: assert_match "MAGNET v1.2.0", shell_output("#{bin}/MAGNET -V", 2)
    system "false"
    system "MAGNET", "--version"
  end

end
