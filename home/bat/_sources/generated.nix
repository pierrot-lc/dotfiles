# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  catppuccin = {
    pname = "catppuccin";
    version = "d2bbee4f7e7d5bac63c054e4d8eca57954b31471";
    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "bat";
      rev = "d2bbee4f7e7d5bac63c054e4d8eca57954b31471";
      fetchSubmodules = false;
      sha256 = "sha256-x1yqPCWuoBSx/cI94eA+AWwhiSA42cLNUOFJl7qjhmw=";
    };
    date = "2024-10-18";
  };
  everforest = {
    pname = "everforest";
    version = "aa1850676e2c2908e7c5cf5ea7863b130fd65016";
    src = fetchFromGitHub {
      owner = "mhanberg";
      repo = "everforest-textmate";
      rev = "aa1850676e2c2908e7c5cf5ea7863b130fd65016";
      fetchSubmodules = false;
      sha256 = "sha256-4GexSj/T+FKsa98kmKfninJMdFKHgQyZFQGVNBFYIuc=";
    };
    date = "2023-02-03";
  };
  kanagawa = {
    pname = "kanagawa";
    version = "ad3dddecd606746374ba4807324a08331dfca23c";
    src = fetchFromGitHub {
      owner = "rebelot";
      repo = "kanagawa.nvim";
      rev = "ad3dddecd606746374ba4807324a08331dfca23c";
      fetchSubmodules = false;
      sha256 = "sha256-IG+eEhmSDRxRDBvfETeN9f3IjJvCntQm3u72QlY0ytE=";
    };
    date = "2024-11-07";
  };
  rose-pine = {
    pname = "rose-pine";
    version = "c4235f9a65fd180ac0f5e4396e3a86e21a0884ec";
    src = fetchFromGitHub {
      owner = "rose-pine";
      repo = "tm-theme";
      rev = "c4235f9a65fd180ac0f5e4396e3a86e21a0884ec";
      fetchSubmodules = false;
      sha256 = "sha256-jji8WOKDkzAq8K+uSZAziMULI8Kh7e96cBRimGvIYKY=";
    };
    date = "2024-04-23";
  };
}
