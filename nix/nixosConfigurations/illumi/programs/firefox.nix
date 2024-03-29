_: {
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-GB"
      "en-US"
      "hi-IN"
      "ja"
    ];
    autoConfig = ''
      //
      /* You may copy+paste this file and use it as it is.
       *
       * If you make changes to your about:config while the program is running, the
       * changes will be overwritten by the user.js when the application restarts.
       *
       * To make lasting changes to preferences, you will have to edit the user.js.
       */

      /****************************************************************************
       * Betterfox                                                                *
       * "Ad meliora"                                                             *
       * version: 119                                                             *
       * url: https://github.com/yokoffing/Betterfox                              *
      ****************************************************************************/

      /****************************************************************************
       * SECTION: FASTFOX                                                         *
      ****************************************************************************/
      /** GENERAL ***/
      lockPref("content.notify.interval", 100000);

      /** GFX ***/
      lockPref("gfx.canvas.accelerated.cache-items", 4096);
      lockPref("gfx.canvas.accelerated.cache-size", 512);
      lockPref("gfx.content.skia-font-cache-size", 20);

      /** DISK CACHE ***/
      lockPref("browser.cache.jsbc_compression_level", 3);

      /** MEDIA CACHE ***/
      lockPref("media.memory_cache_max_size", 65536);
      lockPref("media.cache_readahead_limit", 7200);
      lockPref("media.cache_resume_threshold", 3600);

      /** IMAGE CACHE ***/
      lockPref("image.mem.decode_bytes_at_a_time", 32768);

      /** NETWORK ***/
      lockPref("network.buffer.cache.size", 262144);
      lockPref("network.buffer.cache.count", 128);
      lockPref("network.http.max-connections", 1800);
      lockPref("network.http.max-persistent-connections-per-server", 10);
      lockPref("network.http.max-urgent-start-excessive-connections-per-host", 5);
      lockPref("network.http.pacing.requests.enabled", false);
      lockPref("network.dnsCacheExpiration", 3600);
      lockPref("network.dns.max_high_priority_threads", 8);
      lockPref("network.ssl_tokens_cache_capacity", 10240);

      /** SPECULATIVE LOADING ***/
      lockPref("network.dns.disablePrefetch", true);
      lockPref("network.prefetch-next", false);
      lockPref("network.predictor.enabled", false);

      /** EXPERIMENTAL ***/
      lockPref("layout.css.grid-template-masonry-value.enabled", true);
      lockPref("dom.enable_web_task_scheduling", true);
      lockPref("layout.css.has-selector.enabled", true);
      lockPref("dom.security.sanitizer.enabled", true);

      /****************************************************************************
       * SECTION: SECUREFOX                                                       *
      ****************************************************************************/
      /** TRACKING PROTECTION ***/
      lockPref("browser.contentblocking.category", "strict");
      lockPref("urlclassifier.trackingSkipURLs", "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com");
      lockPref("urlclassifier.features.socialtracking.skipURLs", "*.instagram.com, *.twitter.com, *.twimg.com");
      lockPref("network.cookie.sameSite.noneRequiresSecure", true);
      lockPref("browser.download.start_downloads_in_tmp_dir", true);
      lockPref("browser.helperApps.deleteTempFileOnExit", true);
      lockPref("browser.uitour.enabled", false);
      lockPref("privacy.globalprivacycontrol.enabled", true);
      lockPref("privacy.globalprivacycontrol.functionality.enabled", true);

      /** OCSP & CERTS / HPKP ***/
      lockPref("security.OCSP.enabled", 0);
      lockPref("security.remote_settings.crlite_filters.enabled", true);
      lockPref("security.pki.crlite_mode", 2);

      /** SSL / TLS ***/
      lockPref("security.ssl.treat_unsafe_negotiation_as_broken", true);
      lockPref("browser.xul.error_pages.expert_bad_cert", true);
      lockPref("security.tls.enable_0rtt_data", false);

      /** DISK AVOIDANCE ***/
      lockPref("browser.privatebrowsing.forceMediaMemoryCache", true);
      lockPref("browser.sessionstore.interval", 60000);

      /** SHUTDOWN & SANITIZING ***/
      lockPref("privacy.history.custom", true);

      /** SEARCH / URL BAR ***/
      lockPref("browser.search.separatePrivateDefault.ui.enabled", true);
      lockPref("browser.urlbar.update2.engineAliasRefresh", true);
      lockPref("browser.search.suggest.enabled", false);
      lockPref("browser.urlbar.suggest.quicksuggest.sponsored", false);
      lockPref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
      lockPref("browser.formfill.enable", false);
      lockPref("security.insecure_connection_text.enabled", true);
      lockPref("security.insecure_connection_text.pbmode.enabled", true);
      lockPref("network.IDN_show_punycode", true);

      /** HTTPS-FIRST POLICY ***/
      lockPref("dom.security.https_first", true);

      /** PASSWORDS ***/
      lockPref("signon.rememberSignons", false);
      lockPref("signon.formlessCapture.enabled", false);
      lockPref("signon.privateBrowsingCapture.enabled", false);
      lockPref("network.auth.subresource-http-auth-allow", 1);
      lockPref("editor.truncate_lockPastes", false);

      /** ADDRESS + CREDIT CARD MANAGER ***/
      lockPref("extensions.formautofill.addresses.enabled", false);
      lockPref("extensions.formautofill.creditCards.enabled", false);

      /** MIXED CONTENT + CROSS-SITE ***/
      lockPref("security.mixed_content.block_display_content", true);
      lockPref("security.mixed_content.upgrade_display_content", true);
      lockPref("security.mixed_content.upgrade_display_content.image", true);
      lockPref("pdfjs.enableScripting", false);
      lockPref("extensions.postDownloadThirdPartyPrompt", false);

      /** HEADERS / REFERERS ***/
      lockPref("network.http.referer.XOriginTrimmingPolicy", 2);

      /** CONTAINERS ***/
      lockPref("privacy.userContext.ui.enabled", true);

      /** WEBRTC ***/
      lockPref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
      lockPref("media.peerconnection.ice.default_address_only", true);

      /** SAFE BROWSING ***/
      lockPref("browser.safebrowsing.downloads.remote.enabled", false);

      /** MOZILLA ***/
      lockPref("permissions.default.desktop-notification", 2);
      lockPref("permissions.default.geo", 2);
      lockPref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
      lockPref("permissions.manager.defaultsUrl", "");
      lockPref("webchannel.allowObject.urlWhitelist", "");

      /** TELEMETRY ***/
      lockPref("datareporting.policy.dataSubmissionEnabled", false);
      lockPref("datareporting.healthreport.uploadEnabled", false);
      lockPref("toolkit.telemetry.unified", false);
      lockPref("toolkit.telemetry.enabled", false);
      lockPref("toolkit.telemetry.server", "data:,");
      lockPref("toolkit.telemetry.archive.enabled", false);
      lockPref("toolkit.telemetry.newProfilePing.enabled", false);
      lockPref("toolkit.telemetry.shutdownPingSender.enabled", false);
      lockPref("toolkit.telemetry.updatePing.enabled", false);
      lockPref("toolkit.telemetry.bhrPing.enabled", false);
      lockPref("toolkit.telemetry.firstShutdownPing.enabled", false);
      lockPref("toolkit.telemetry.coverage.opt-out", true);
      lockPref("toolkit.coverage.opt-out", true);
      lockPref("toolkit.coverage.endpoint.base", "");
      lockPref("browser.ping-centre.telemetry", false);
      lockPref("browser.newtabpage.activity-stream.feeds.telemetry", false);
      lockPref("browser.newtabpage.activity-stream.telemetry", false);

      /** EXPERIMENTS ***/
      lockPref("app.shield.optoutstudies.enabled", false);
      lockPref("app.normandy.enabled", false);
      lockPref("app.normandy.api_url", "");

      /** CRASH REPORTS ***/
      lockPref("breakpad.reportURL", "");
      lockPref("browser.tabs.crashReporting.sendReport", false);
      lockPref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

      /** DETECTION ***/
      lockPref("captivedetect.canonicalURL", "");
      lockPref("network.captive-portal-service.enabled", false);
      lockPref("network.connectivity-service.enabled", false);

      /****************************************************************************
       * SECTION: PESKYFOX                                                        *
      ****************************************************************************/
      /** MOZILLA UI ***/
      lockPref("browser.privatebrowsing.vpnpromourl", "");
      lockPref("extensions.getAddons.showPane", false);
      lockPref("extensions.htmlaboutaddons.recommendations.enabled", false);
      lockPref("browser.discovery.enabled", false);
      lockPref("browser.shell.checkDefaultBrowser", false);
      lockPref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
      lockPref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
      lockPref("browser.preferences.moreFromMozilla", false);
      lockPref("browser.tabs.tabmanager.enabled", false);
      lockPref("browser.aboutConfig.showWarning", false);
      lockPref("browser.aboutwelcome.enabled", false);

      /** THEME ADJUSTMENTS ***/
      lockPref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
      lockPref("browser.compactmode.show", true);
      lockPref("browser.display.focus_ring_on_anything", true);
      lockPref("browser.display.focus_ring_style", 0);
      lockPref("browser.display.focus_ring_width", 0);
      lockPref("layout.css.prefers-color-scheme.content-override", 2);
      lockPref("browser.privateWindowSeparation.enabled", false); // WINDOWS

      /** COOKIE BANNER HANDLING ***/
      lockPref("cookiebanners.service.mode", 1);
      lockPref("cookiebanners.service.mode.privateBrowsing", 1);
      lockPref("cookiebanners.service.enableGlobalRules", true);

      /** FULLSCREEN NOTICE ***/
      lockPref("full-screen-api.transition-duration.enter", "0 0");
      lockPref("full-screen-api.transition-duration.leave", "0 0");
      lockPref("full-screen-api.warning.delay", -1);
      lockPref("full-screen-api.warning.timeout", 0);

      /** URL BAR ***/
      lockPref("browser.urlbar.suggest.calculator", true);
      lockPref("browser.urlbar.unitConversion.enabled", true);
      lockPref("browser.urlbar.trending.featureGate", false);

      /** NEW TAB PAGE ***/
      lockPref("browser.newtabpage.activity-stream.feeds.topsites", false);
      lockPref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

      /** POCKET ***/
      lockPref("extensions.pocket.enabled", false);

      /** DOWNLOADS ***/
      lockPref("browser.download.useDownloadDir", false);
      lockPref("browser.download.always_ask_before_handling_new_types", true);
      lockPref("browser.download.manager.addToRecentDocs", false);

      /** PDF ***/
      lockPref("browser.download.open_pdf_attachments_inline", true);

      /** TAB BEHAVIOR ***/
      lockPref("browser.bookmarks.openInTabClosesMenu", false);
      lockPref("browser.menu.showViewImageInfo", true);
      lockPref("findbar.highlightAll", true);
      lockPref("layout.word_select.eat_space_to_next_word", false);

      /****************************************************************************
       * START: MY OVERRIDES                                                      *
      ****************************************************************************/
      // visit https://github.com/yokoffing/Betterfox/wiki/Common-Overrides
      // visit https://github.com/yokoffing/Betterfox/wiki/Optional-Hardening
      // Enter your personal overrides below this line:
      // PREF: enable HTTPS-Only Mode
      // Warn me before loading sites that don't support HTTPS
      // in both Normal and Private Browsing windows.
      lockPref("dom.security.https_only_mode", true);
      lockPref("dom.security.https_only_mode_error_page_lockPuggestions", true);
      // PREF: Lock FPS to Display Refresh rate
      lockPref("layout.frame_rate", 144);
      // PREF: CSS Theme
      lockPref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

      /****************************************************************************
       * SECTION: SMOOTHFOX                                                       *
      ****************************************************************************/
      // visit https://github.com/yokoffing/Betterfox/blob/main/Smoothfox.js
      // Enter your scrolling overrides below this line:
      // recommended for 120hz+ displays
      // largely matches Chrome flags: Windows Scrolling Personality and Smooth Scrolling
      lockPref("apz.overscroll.enabled", true); // DEFAULT NON-LINUX
      lockPref("general.smoothScroll", true); // DEFAULT
      lockPref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 12);
      lockPref("general.smoothScroll.msdPhysics.enabled", true);
      lockPref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 600);
      lockPref("general.smoothScroll.msdPhysics.regularSpringConstant", 650);
      lockPref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 25);
      //lockPref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio", 2);
      lockPref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 250);
      //lockPref("general.smoothScroll.currentVelocityWeighting", 1);
      //lockPref("general.smoothScroll.stopDecelerationWeighting", 1);
      lockPref("mousewheel.default.delta_multiplier_y", 300); // 250-400; adjust this number to your liking

      /****************************************************************************
       * END: BETTERFOX                                                           *
      ****************************************************************************/
    '';
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
}
