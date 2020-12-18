class Piranha < Formula
  
  desc "Scripts for file processing and analysis in phylogenomics & phylogeography"
  homepage "https://justinbagley.org/piranha/"
  url "https://github.com/justincbagley/piranha/archive/v0.4a4.tar.gz"
  sha256 "fe723876cff117868e54099968461e6343f26a094899ef0aedec2ac384034948"
  version "0.4a4"
  
  ## Optionally, specify a repository to be used. Brew then generates a '--HEAD | --head' option. 
  ## Remember to also test it. 'master' is the default branch and doesn't need stating with a
  ## :branch conditional.
  head "https://github.com/justincbagley/piranha.git"

  ## Using 'bin.install' here is essentially saying move '<script>' into #{prefix}/bin/. prefix.install is 
  ## essentially saying move script into the main or #{prefix} dir. Dir helps us copy a whole directory
  ## with ease.
  def install
    prefix.install "piranha"
    prefix.install "piranha.sh"
    prefix.install "LICENSE"
    prefix.install "CODE-OF-CONDUCT.md"
    prefix.install "CITATION.md"
    prefix.install "changeLog.md"
    prefix.install "Quick-Guide.md"
    prefix.install "Quick-Guide.pdf"
    prefix.install "README.md"
    prefix.install Dir["bin"]    
    prefix.install Dir["completions"]    
    prefix.install Dir["install"]    
    prefix.install Dir["lib"]    
    prefix.install Dir["etc"]    
    prefix.install Dir["test"]    
    prefix.install Dir["tmp"]

    # Add piranha utility script, as well as the script to source completions, to 
    # "$(brew --prefix)/bin", which is usually "/usr/local/bin":
    bin.install "#{prefix}/piranha"
    bin.install "#{prefix}/completions/source_piranha_compl.sh"
    
    # Add installer scripts to local "/etc/" dir (first removing them, if older versions present): 
    if File.file?("#{etc}/install_piranha") then
        system "rm", "#{etc}/install_piranha"
    end
    etc.install "#{prefix}/install/install_piranha" 
  end

  def post_install
    system "chmod", "+x", "#{bin}/piranha"
    system "chmod", "+x", "#{bin}/source_piranha_compl.sh"
    system "bash", "source_piranha_compl.sh"
    #system ".", "source_piranha_compl.sh"
  end

  def caveats; <<-EOS
    One line was added to your ~/.bash_profile to make dynamic tab completion of function names 
      available on the command line while running piranha.
    It will still be there after an uninstall, but is adaptive (nothing happens if piranha was uninstalled).
    If you're a zsh person, then patches are welcome: https://github.com/justincbagley/piranha/blob/master/completions/source_piranha_compl.sh
    EOS
  end

  test do
    ## Modified example, commented out: assert_match "piranha v1.1.6", shell_output("#{bin}/piranha -V", 2)
    system "false"
    system "piranha", "--version"
  end

end
