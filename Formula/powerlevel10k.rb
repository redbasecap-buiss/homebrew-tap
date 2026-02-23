class Powerlevel10k < Formula
  desc "A Zsh theme with instant prompt, flexible customization and out-of-the-box configuration"
  homepage "https://github.com/redbasecap-buiss/powerlevel10k"
  url "https://github.com/redbasecap-buiss/powerlevel10k.git",
    tag: "v1.24.11"
  license "MIT"

  depends_on "zsh" => :optional

  def install
    prefix.install Dir["*"]
    prefix.install Dir[".*"].reject { |f| %w[. .. .git].include?(File.basename(f)) }
  end

  def caveats
    <<~EOS
      To activate powerlevel10k, add the following to your ~/.zshrc:

        source #{opt_prefix}/powerlevel10k.zsh-theme

      If you're using Oh My Zsh, symlink instead:

        ln -sf #{opt_prefix} ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

      Then set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

      Run `p10k configure` to customize your prompt.
    EOS
  end

  test do
    assert_predicate prefix/"powerlevel10k.zsh-theme", :exist?
    assert_predicate prefix/"gitstatus/gitstatus.plugin.zsh", :exist?
    assert_predicate prefix/"gitstatus/gitstatus-pure.plugin.zsh", :exist?
  end
end
