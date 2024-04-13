{ inputs, ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-GB"
      "en-US"
      "hi-IN"
      "ja"
    ];
    autoConfig = inputs.self.outPath + "conf/firefox.cfg";
    policies = {
      "AppAutoUpdate" = true;
      "DisableDeveloperTools" = false;
      "DisableFeedbackCommands" = true;
      "DisableFirefoxStudies" = true;
      "DisablePocket" = true;
      "DisableSetDesktopBackground" = true;
      "DisableTelemetry" = true;
      "DontCheckDefaultBrowser" = true;
      "ExtensionSettings" = {
        # Ublock Origin
        "uBlock0@raymondhill.net" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          "default_area" = "navbar";
        };
        # Dark reader
        "addon@darkreader.org" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          "default_area" = "navbar";
        };
        # Auto tab discard
        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi";
          "default_area" = "menupanel";
        };
        # Tabliss
        "extension@tabliss.io" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/tabliss/latest.xpi";
          "default_area" = "menupanel";
        };
        # Flagfox
        "{1018e4d6-728f-4b20-ad56-37578a4de76b}" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/flagfox/latest.xpi";
          "default_area" = "menupanel";
        };
        # Enhancer for YT
        "enhancerforyoutube@maximerf.addons.mozilla.org" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/enhancer-for-youtube/latest.xpi";
          "default_area" = "menupanel";
        };
        # LanguageTool
        "languagetool-webextension@languagetool.org" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/languagetool/latest.xpi";
          "default_area" = "menupanel";
        };
        # Search by Image
        "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/search_by_image/latest.xpi";
          "default_area" = "menupanel";
        };
        # Stylus
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
          "default_area" = "menupanel";
        };
        # Tab Stash
        "tab-stash@condordes.net" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/tab-stash/latest.xpi";
          "default_area" = "menupanel";
        };
        # Web Archives
        "{d07ccf11-c0cd-4938-a265-2a4d6ad01189}" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/view-page-archive/latest.xpi";
          "default_area" = "menupanel";
        };
        # KeePassXC Browser
        "keepassxc-browser@keepassxc.org" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
          "default_area" = "menupanel";
        };
        # Keepa
        "amptra@keepa.com" = {
          "installation_mode" = "normal_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/keepa/latest.xpi";
          "default_area" = "menupanel";
        };
      };
    };
  };

  services.psd.enable = true;
}
