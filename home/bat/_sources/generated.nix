# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  catppuccin = {
    pname = "catppuccin";
    version = "699f60fc8ec434574ca7451b444b880430319941";
    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "bat";
      rev = "699f60fc8ec434574ca7451b444b880430319941";
      fetchSubmodules = false;
      sha256 = "sha256-6fWoCH90IGumAMc4buLRWL0N61op+AuMNN9CAR9/OdI=";
    };
    date = "2024-12-23";
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
  rose-pine = {
    pname = "rose-pine";
    version = "f20cc24e5ca70afdeb251a9778624272ee2063d6";
    src = fetchFromGitHub {
      owner = "rose-pine";
      repo = "tm-theme";
      rev = "f20cc24e5ca70afdeb251a9778624272ee2063d6";
      fetchSubmodules = false;
      sha256 = "sha256-bQSGi9tuv8F4gHWqoJNOm2nTRt3XiJ/90EDz9D8/iIY=";
    };
    date = "2025-01-01";
  };
}
