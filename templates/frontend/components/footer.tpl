{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 * @uses $requestedPage string Used to suppress one or another thing maybe.
 *}

        </main>

        {* Sidebars *}
	<!--
        $requestedPage: {$requestedPage}
	-->


        {if empty($isFullWidth)}
                {capture assign="retoCode"}{call_hook name="Templates::Common::Reto"}{/capture}

                {capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
                {if $sidebarCode}

                        <aside id="sidebar" class="pkp_structure_sidebar left col-sm-12 col-md-4" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">

			<div class="sidebar-separator hidden-md hidden-lg"></div>

                        {if $requestedPage != "article"}
                            <div class="pkp_block" id="jss-publisher-list">
                                <h2 class="title pkp_screen_reader">{translate|escape key="plugins.themes.bootstrap3JSS.journalinformation"}</h2>
                                <h2 class="title">{translate|escape key="plugins.themes.bootstrap3JSS.journalinformation"}</h2>
                                <div class="content">
                                    <strong>{translate|escape key="plugins.themes.bootstrap3JSS.publisher"}:</strong>{$jssPublishedBy}<br />
                                    <strong>{translate|escape key="plugins.themes.bootstrap3JSS.editorsinchief"}:</strong>{$jssEditorsInChief}<br />
                                    <strong>{translate|escape key="plugins.themes.bootstrap3JSS.ISSN"}:</strong>{$jssISSN}<br />
                                    <strong>{translate|escape key="plugins.themes.bootstrap3JSS.CODEN"}:</strong>{$jssCoden}<br />
                                </div>
                            </div>
                        {/if}

						{* --------------------- BEGIN OF ROLE DEPENDENT NAVIGATION -------------------- *} 
						{* CHECK IF THE USER HAS ANY OF THESE RULES ASSIGNED *}
						{if in_array(ROLE_ID_MANAGER, (array) $userRoles) || in_array(ROLE_ID_SUB_EDITOR, (array) $userRoles) || in_array(ROLE_ID_ASSISTANT, (array) $userRoles) || in_array(ROLE_ID_REVIEWER, (array) $userRoles) || in_array(ROLE_ID_AUTHOR, (array) $userRoles)}
						
							<div class="pkp_block">
								<h2 class="title">
									{translate|escape key="plugins.themes.bootstrap3JSS.rolenav"}
								</h2>
								<div class="content">
									<ul>
										{if in_array(ROLE_ID_MANAGER, (array) $userRoles)}
											{capture assign="forManagersUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="managers"}{/capture}
											<li><a href="{$forManagersUrl}" target="_self">For Managers</a></li>
										{/if}
										{if in_array(ROLE_ID_SUB_EDITOR, (array) $userRoles)}
											{capture assign="forEditorsUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="editors"}{/capture}
											<li><a href="{$forEditorsUrl}" target="_self">For Editors</a></li>
										{/if}
										{if in_array(ROLE_ID_ASSISTANT, (array) $userRoles)}
											{capture assign="forAssistantsUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="assistants"}{/capture}
											<li><a href="{$forAssistantsUrl}" target="_self">For Assistants</a></li>
										{/if}
										{if in_array(ROLE_ID_REVIEWER, (array) $userRoles)}
											{capture assign="forReviewersUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="reviewers"}{/capture}
											<li><a href="{$forReviewersUrl}" target="_self">For Reviewers</a></li>
										{/if}
										{if in_array(ROLE_ID_AUTHOR, (array) $userRoles)}
											{capture assign="forAuthorsUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="authors"}{/capture}
											<li><a href="{$forAuthorsUrl}" target="_self">For Authors</a></li>
										{/if}
									</ul>
								</div>
							</div>
						
						{/if}
						{* ----------------------- END OF ROLE DEPENDENT NAVIGATION -------------------- *} 


                        {$retoCode}

                        {$sidebarCode}

                        {* CUSTOM BLOCKS ONLY SHOWN IF NOT ARTICLE VIEW *}
                        {if $requestedPage != "article"}
                            <div class="pkp_block" id="jss-announcement-list">
                                    <h2 class="title pkp_screen_reader">List of latest announcements</h2>
                                    <h2 class="title">Latest announcements</h2>
                                            
                                    <ul>
                                            {foreach from=$announcements item=announcement}
                                                    {include file="frontend/objects/announcement_list.tpl"}
                                            {/foreach}
                                    </ul>
                            </div>


                            <!-- custom block with sponsors -->
                            <div class="pkp_block jss-sponsors">
                                <h2 class="title">{translate|escape key="plugins.themes.bootstrap3JSS.sponsors"}</h2>
                                    <div class="content">
                                    <div class="row">
                                        <div class="col-xs-4">
                                                <a class="image-link" href="https://uibk.ac.at/", target="_new">
                                                <img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/uibk.png" />
                                                </a>
                                        </div>  
                                        <div class="col-xs-4">
                                                <a class="image-link" href="https://www.uzh.ch/", target="_new">
                                                        <img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/uzh.png" />
                                                </a>
                                        </div>  
                                        <div class="col-xs-4">
                                                <a class="image-link" href="https://ucla.edu/", target="_new">
                                                        <img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/ucla.png" />
                                                </a>
                                        </div>  
                                    
                                    </div> <!-- end .row -->
                                </div> <!-- end .content -->
                            </div>
                            <!-- end of custom block with foas -->

                            <!-- custom block with foas information -->
				<div class="pkp_block jss-foas">
					<h2 class="title">{translate|escape key="plugins.themes.bootstrap3JSS.foas"}</h2>
					<div class="content text-justify">
						<div class="logo-foas pull-left"><img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/foas.png" /></div>
						As a matter of principle, <strong>JSS charges no author fees or subscription fees</strong>. Our editors, reviewers, and programmers are volunteers. UCLA Statistics and Universität Innsbruck contribute support staff, website maintenance, website hosting, and some graduate student support. Because of our success and growth we do need more resources in the future. You can support us by becoming a member of the <a href="http://www.foastat.org/" target="_new">Foundation for Open Access Statistics</a> at <a href="http://www.foastat.org/" target="_new">www.foastat.org</a>, and by contributing on their <a href="https://www.foastat.org/donate.html" target="_new">donation page</a>.
					</div>
				</div>
                            <!-- end of custom block with foas -->


                        {/if}
                        {* END OF ONLY SHOW IF VIEW IS NOT TYPE ARTICLE *}


                        {* CUSTOM BLOCKS ONLY SHOWN IF NOT ARTICLE VIEW *}
                        {if $requestedPage == "article" && ($licenseTerms || $licenseUrl)}
                            <div class="pkp_block" id="jss-copyright">
                                <h2 class="title">{translate|escape key="plugins.themes.bootstrap3JSS.license"}</h2>
				
                                <div class="content">
					
					<i class="fab fa-2x fa-creative-commons"></i>
					<i class="fab fa-2x fa-creative-commons-by"></i>
					<img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/GNU.svg">
					<img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/GPLv3.svg"><br />
					
					Article: <a href="http://creativecommons.org/licenses/by/3.0/" target="_new">Creative Commons Attribution License (CC-BY)</a>

					

Code: GNU General Public License <a href="http://www.gnu.org/licenses/gpl-2.0.html" target="_self">version 2</a> or <a href="http://www.gnu.org/licenses/gpl-3.0.html" target="_self">version 3</a> or a <a href="https://gnu.org/licenses/license-list.html#GPLCompatibleLicenses" target="_self">GPL-compatible license</a>.

                                </div>
                            </div>
                        {/if}
                        {* END OF ONLY SHOW IF VIEW IS AN ARTICLE *}

                        </aside><!-- pkp_sidebar.left -->
                {/if}
        {/if}
        </div><!-- pkp_structure_content -->

        <footer class="footer" role="contentinfo">

                <div class="container">

                        <div class="row">
                                <div class="col-sm-12 col-md-5">
                                        {$pageFooter}
                                </div>
                                <div class="col-sm-12 col-md-3">
					<strong>{translate|escape key="plugins.themes.bootstrap3JSS.footermenutitle"}</strong>
                                        {capture assign="footerMenu"}
                                                {load_menu name = "footerMenu" id="jss-footer-menu" ulClass='footer-menu'}
                                        {/capture}
                                        {$footerMenu}
                                </div>
                                <div class="col-sm-12 col-md-2 pkpinfo" role="complementary">

                                        <a href="{url page="about" op="aboutThisPublishingSystem"}">
                                                <img class="img-responsive" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
                                        </a>
                                </div>

                        </div> <!-- .row -->
                </div><!-- .container -->
        </footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
