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
  rose-pine = {
    pname = "rose-pine";
    version = "c4cab0c431f55a3c4f9897407b7bdad363bbb862";
    src = fetchFromGitHub {
      owner = "rose-pine";
      repo = "tm-theme";
      rev = "c4cab0c431f55a3c4f9897407b7bdad363bbb862";
      fetchSubmodules = false;
      sha256 = "sha256-maQp4QTJOlK24eid7mUsoS7kc8P0gerKcbvNaxO8Mic=";
    };
    date = "2025-03-29";
  };
}
