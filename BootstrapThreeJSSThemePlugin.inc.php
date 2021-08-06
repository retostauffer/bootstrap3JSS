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

    /*
     * @param $hookName string
     * @param $args array [
     *......@option array Params passed to the hook
     *......@option Smarty
     *......@option string The output
     * ]
     */
    public function reto($hookName, $args) {
        $params =& $args[0];
        $smarty =& $args[1];
        $output =& $args[2];


        $output = "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
        return false;
    }

	/**
	 * Initialize the theme
	 *
	 * @return null
	 */
	public function init() {

        # Required to be able to set variables for the templating engine
        HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData'));

        HookRegistry::register('Templates::Common::Reto', [$this, 'reto']);

    
        $this->setParent('bootstrapthreethemeplugin');
		// Register option for bootstrap themes
		$this->removeOption('bootstrapTheme', 'FieldOptions');
		#$this->addStyle('stylesheet', 'styles/jss-variables.less');
		$this->modifyStyle('bootstrap', array('addLess' => array('styles/jss.less')));
		#$this->addStyle('stylesheet', 'styles/jss.less');
		
		$this->addMenuArea(array("footerMenu"));

        $this->addOption("jss_publisher_top", "FieldOptions", [
                "type" => "radio",
                "label" => "Publisher shown top of page?",
                "description" => "Enable/disable publisher on top of page",
                "options" => [
                    ["value" => "1", "label" => "Yes"],
                    ["value" => "0", "label" => "No"],
                ],
            ]
        );
        $this->addOption("jss_published_by", "FieldText", [
                "name" => "jss_published_by",
                "label" => "Published by ...",
                "default" => "Published by the Foundation for Open Access Statistics"
            ]
        );
        $this->addOption("jss_editors_in_chief", "FieldText", [
                "name" => "jss_editors_in_chief",
                "label" => "Our editors in chief",
            ]
        );
        $this->addOption("jss_issn", "FieldText", [
                "name" => "jss_issn",
                "label" => "JSSN number",
                "default" => "1548-7660"
            ]
        );
        $this->addOption("jss_coden", "FieldText", [
                "name" => "jss_coden",
                "label" => "CODEN identifier",
                "default" => "JSSOBK",
            ]
        );



	}

    public function loadTemplateData($hookName, $args) {
        $templateMgr = $args[0];
        
        # Options to add
        $opts = ["jss_publisher_top"    => "jssPublisherTop",
                 "jss_coden"            => "jssCoden",
                 "jss_issn"             => "jssISSN",
                 "jss_published_by"     => "jssPublishedBy",
                 "jss_editors_in_chief" => "jssEditorsInChief"];

        # optname is the option name of the theme, varname
        # the final variable name used in the templates
        foreach ($opts as $optname=>$varname) {
            if ($this->getOption($optname)) {
                $res = $this->getOption($optname);
            } else {
                $res = "option not set!";
            }
            // Assign
            $templateMgr->assign($varname, $res);
        }
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
