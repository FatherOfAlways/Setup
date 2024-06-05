## Config

URL: [`about:config`](about:config)

**Cross-platform:**

* `browser.tabs.tabmanager.enabled` - enable or disable tab dropdown menu
* `browser.tabs.tabMinWidth`: **1** - set minimum tab width

**Mac:**

* `mousewheel.min_line_scroll_amount`: **70** - set scroll amount

**Windows:**

* `mousewheel.min_line_scroll_amount`: **20** - set scroll amount


## userChrome.css

* Enable the following flags in [`about:config`](about:config):

	* `toolkit.legacyUserProfileCustomizations.stylesheets`: **true** - enable custom stylesheets
	* `widget.macos.native-context-menus`: **false** - disable native context menus

* Quick access to user's profile folder:

	1. Navigate to [`about:support`](about:support)
	2. Click *Show in Finder* (under Profile Folder)

* Locating CSS elements to modify:

	1. Open *Tools > Browser Tools > Web Developer Tools*

	2. Navigate to *[Ellipsis] > Settings*

	3. Check the following boxes:

		*Advanced settings > Enable browser chrome and add-on debugging toolboxes*
		*Advanced settings > Enable remote debugging*
	
	4. Open *Tools > Browser Tools > Browser toolbox*


## ZeroTab

1. Navigate to [Mozilla Developer Hub](https://accounts.firefox.com/) and login
2. Navigate to *My Add-ons > ZeroTab >  View All > Version 1.0*
3. Under *Files*, click on the *.xpi* file link which will offer an extension install. 


## Resources

* [userchrome.org](https://www.userchrome.org/adding-style-recipes-userchrome-css.html)
* [simpleMenuWizard](https://github.com/stonecrusher/simpleMenuWizard?tab=readme-ov-file)
* [How to customize context menu entries](https://support.mozilla.org/en-US/questions/1294449)
* [Remove extension options from Context Menus](https://www.reddit.com/r/firefox/comments/7fuoyi/how_to_remove_extention_options_from_the_context/)
* [How to Have Very Small Tab Size and No Tab-Scroll Buttons](https://superuser.com/questions/1749962/firefox-how-to-have-very-small-tab-size-and-no-tab-scroll-buttons)


## Extension Settings

Can be found [here](https://github.com/FatherOfAlways/Setup/tree/main/3%20Config/Chrome).