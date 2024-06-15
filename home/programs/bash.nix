{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historySize = 100;
    historyControl = ["erasedups" "ignoredups" "ignorespace"];
    historyIgnore = ["sway"];
    shellAliases = {
      ls = "eza";
    };
  };
}