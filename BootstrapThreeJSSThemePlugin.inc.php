<?php

/**
 * @file plugins/themes/default/BootstrapThreeJSSThemePlugin.inc.php
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class BootstrapThreeJSSThemePlugin
 * @ingroup plugins_themes_bootstrap3
 *
 * @brief Default theme
 */

import('lib.pkp.classes.plugins.ThemePlugin');
class BootstrapThreeJSSThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme
	 *
	 * @return null
	 */
	public function init() {
        $this->setParent('bootstrapthreethemeplugin');
		// Register option for bootstrap themes
		$this->removeOption('bootstrapTheme', 'FieldOptions');
		#$this->addStyle('stylesheet', 'styles/jss-variables.less');
		$this->modifyStyle('bootstrap', array('addLess' => array('styles/jss.less')));
		#$this->addStyle('stylesheet', 'styles/jss.less');
		
		$this->addMenuArea(array("footerMenu"));
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return "Bootstrap 3 for JSS";
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return "Bootstrap 3 for JSS";
	}
}
