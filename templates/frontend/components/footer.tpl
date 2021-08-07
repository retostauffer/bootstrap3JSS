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

                        {if $jssPublisherTop != "1" && $requestedPage != "article"}
                            <div class="pkp_block" id="jss-publisher-list">
                                <h2 class="title pkp_screen_reader">{translate|escape key="plugins.themes.bootstrap3JSS.journalinformation"}</h2>
                                <h2 class="title">{translate|escape key="plugins.themes.bootstrap3JSS.journalinformation"}</h2>
                                <div class="content">
                                    {$jssPublishedBy}<br />
                                    <strong>Editors-in-chief:</strong>{$jssEditorsInChief}<br />
                                    <strong>ISSN:</strong> {$jssISSN}<br />
                                    <strong>CODEN:</strong> {$jssCoden}
                                </div>
                            </div>
                        {/if}

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
                                        <div class="col-md-4">
                                                <a href="https://uibk.ac.at/", target="_new">
                                                <img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/uibk.png" />
                                                </a>
                                        </div>  
                                        <div class="col-md-4">
                                                <a href="https://www.uzh.ch/", target="_new">
                                                        <img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/uzh.png" />
                                                </a>
                                        </div>  
                                        <div class="col-md-4">
                                                <a href="https://ucla.edu/", target="_new">
                                                        <img src="{$baseUrl}/plugins/themes/bootstrap3JSS/images/logos/ucla.png" />
                                                </a>
                                        </div>  
                                    
                                    </div> <!-- end .row -->
                                </div> <!-- end .content -->
                            </div>
                            <!-- end of custom block with sponsors -->

                        {/if}
                        {* END OF ONLY SHOW IF VIEW IS NOT TYPE ARTICLE *}


                        {* CUSTOM BLOCKS ONLY SHOWN IF NOT ARTICLE VIEW *}
                        {if $requestedPage == "article" && ($licenseTerms || $licenseUrl)}
                            <div class="pkp_block copyright">
                                <h2 class="title">{translate|escape key="plugins.themes.bootstrap3JSS.license"}</h2>
				
                                <div class="content">
<i class="fab fa-2x fa-creative-commons"></i>
<i class="fab fa-2x fa-creative-commons-by"></i><br />

                                    {if $licenseUrl}
                                        {if $ccLicenseBadge}
                                            {$ccLicenseBadge}
                                        {else}
                                            <a href="{$licenseUrl|escape}" class="copyright">
                                                {if $copyrightHolder}
                                                    {translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder copyrightYear=$copyrightYear}
                                                {else}
                                                    {translate key="submission.license"}
                                                {/if}
                                            </a>
                                        {/if}
                                    {/if}
                                    {$licenseTerms}
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
                                <div class="col-md-5">
                                        {$pageFooter}
                                </div>
                                <div class="col-md-4">
                                        {capture assign="footerMenu"}
                                                {load_menu name = "footerMenu"}
                                        {/capture}
                                        {$footerMenu}
                                </div>
                                <div class="col-md-1" role="complementary">
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
