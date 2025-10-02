{
  pkgs,
  lib,
  config,
  ...
}: {
  xdg.enable = true;
  xdg.mimeApps.enable = true;

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = "org.gnome.Papers.desktop";
    "x-scheme-handler/mailto" = "thunderbird.desktop";
  };

  xdg.mimeApps.defaultApplications = {
    "text/csv" = "org.gnome.TextEditor.desktop";
    "text/markdown" = "org.gnome.TextEditor.desktop";
    "text/plain" = "org.gnome.TextEditor.desktop";
    "text/x-bibtex" = "org.gnome.TextEditor.desktop";
    "text/x-python" = "org.gnome.TextEditor.desktop";
    "text/x-typst" = "org.gnome.TextEditor.desktop";
  };

  xdg.mimeApps.defaultApplications = {
    "application/xhtml+xml" = "librewolf.desktop";
    "text/html" = "librewolf.desktop";
    "x-scheme-handler/about" = "librewolf.desktop";
    "x-scheme-handler/http" = "librewolf.desktop";
    "x-scheme-handler/https" = "librewolf.desktop";
    "x-scheme-handler/unknown" = "librewolf.desktop";
  };

  xdg.mimeApps.defaultApplications = {
    "image/avif" = "org.gnome.Loupe.desktop";
    "image/bmp" = "org.gnome.Loupe.desktop";
    "image/gif" = "org.gnome.Loupe.desktop";
    "image/heic" = "org.gnome.Loupe.desktop";
    "image/jpeg" = "org.gnome.Loupe.desktop";
    "image/jxl" = "org.gnome.Loupe.desktop";
    "image/png" = "org.gnome.Loupe.desktop";
    "image/svg+xml" = "org.gnome.Loupe.desktop";
    "image/svg+xml-compressed" = "org.gnome.Loupe.desktop";
    "image/tiff" = "org.gnome.Loupe.desktop";
    "image/vnd-ms.dds" = "org.gnome.Loupe.desktop";
    "image/vnd.microsoft.icon" = "org.gnome.Loupe.desktop";
    "image/vnd.radiance" = "org.gnome.Loupe.desktop";
    "image/webp" = "org.gnome.Loupe.desktop";
    "image/x-dds" = "org.gnome.Loupe.desktop";
    "image/x-exr" = "org.gnome.Loupe.desktop";
    "image/x-portable-anymap" = "org.gnome.Loupe.desktop";
    "image/x-portable-bitmap" = "org.gnome.Loupe.desktop";
    "image/x-portable-graymap" = "org.gnome.Loupe.desktop";
    "image/x-portable-pixmap" = "org.gnome.Loupe.desktop";
    "image/x-qoi" = "org.gnome.Loupe.desktop";
    "image/x-tga" = "org.gnome.Loupe.desktop";
  };
}
