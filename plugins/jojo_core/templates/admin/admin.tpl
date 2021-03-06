{include file="admin/header.tpl"}

<div class="admin-home">

<div class="admin-home-left">

{if !($browser->getBrowser() == 'mozilla' ||
                       $browser->hasFeature('issafari') ||
                       $browser->hasFeature('ischome'))}
<div class="admin-home-item-left">

    <h3>Browser Warning!</h3>
    <p>Jojo CMS is currently in a beta release, and this version has only been tested in the <a href="http://www.getfirefox.com" target="_BLANK">Firefox</a> and <a href="www.apple.com/safari/" target="_BLANK">Safari</a> browsers. There are several known issues with Internet Explorer in particular which will prevent some features of the admin area from working.</p>

    <p>You are currently using the <strong>{$browser->getBrowser()}</strong> browser</p>

    <p>We recommend you download the latest version of <a href="http://www.getfirefox.com">Firefox</a> or <a href="www.apple.com/safari/" target="_BLANK">Safari</a>, both free.</p>

</div>
{/if}

<div class="admin-home-item-left">

    <h3>Welcome</h3>
    Welcome to the admin section of your website.{if $jojoversion} Currently running Jojo CMS {$jojoversion}{/if}

</div>

<div class="admin-home-item-left">

    <h3>Quick Tasks</h3>
    <ul>
      <li><a href="{$ADMIN}/edit/page/">Add new page</a></li>
      <li><a href="{$ADMIN}/edit/page/">Edit an existing page</a><ul>
      {section name=t loop=$toppages}
      <li><a href="{$ADMIN}/edit/page/{$toppages[t].pageid}/" onclick="document.cookie='jstree_select=' + escape('#{$toppages[t].pageid}') + ';path={if strlen($SITEFOLDER) > 0}/{$SITEFOLDER}{/if}/{$ADMIN}/edit/page/;';return true;">{if $toppages[t].pg_menutitle}{$toppages[t].pg_menutitle}{else}{$toppages[t].pg_title}{/if}</a></li>
      {/section}
      </ul>
            </li>
            {if $articles}
            <li><a href="{$ADMIN}/edit/article/">Add / Edit articles</a></li>
            {/if}
    </ul>
</div>

<div class="admin-home-item-left">

    <h3>Help!</h3>
    <p>Documentation for Jojo CMS is available <a href="http://www.jojocms.org/docs/" target="_BLANK">online</a>.
    Support is also available for Jojo CMS in several forms...</p>
    <ul>
    <li>Contact your {if $OPTIONS.webmasteraddress}<a href="mailto:{$OPTIONS.webmasteraddress}">web developer</a>{else}web developer{/if} for direct support</li>
    <li>Read the <a href="http://www.jojocms.org/docs/" target="_BLANK">Jojo documentation</a></li>
    <li>Browse or search the <a href="http://www.jojocms.org/forums/" target="_BLANK">Forums</a></li>
    <li>Submit a <a href="http://bugs.jojocms.org" target="_BLANK">bug report</a></li>
    <li>Contact the Jojo team directly - <a href="http://www.jojocms.org/contact/">www.jojocms.org/contact/</a> (if posting in the <a href="http://www.jojocms.org/forums/" target="_BLANK">forums</a> is not appropriate)</li>
    </ul>

</div>

</div>

<div class="admin-home-right">


<div class="admin-home-item-right">
    <h3>Edit Site Options</h3>
    <p>These options are for managing your website. Unless you know what these do, they are best left unchanged</p>


<div class="options-title">

    <!-- [Content Cache] -->
    <strong>Content Cache: </strong>
    <input type="radio" name="content-cache" id="content-cache-on" onclick="$('#savemsg_contentcache').hide().html('Saving...').show(); frajax('admin-set-options','contentcache','yes');"{if $OPTIONS.contentcache == 'yes'} checked="checked"{/if} /> <label for="content-cache-on">On</label>
    <input type="radio" name="content-cache" id="content-cache-off" onclick="$('#savemsg_contentcache').hide().html('Saving...').show(); frajax('admin-set-options','contentcache','no');"{if $OPTIONS.contentcache == 'no'} checked="checked"{/if} /> <label for="content-cache-off">Off</label>
    <span id="savemsg_contentcache" style="color: red;"></span>
    <br />
    Caching your website's content makes it run a lot faster, and reduces load on the server. It should usually be left on, unless new features are being tested
    <br /><br />

    <!-- [Empty Content Cache] -->
    <strong>Empty Cache: </strong>
    <input type="submit" name="empty-cache" id="empty-cache" value="Empty"
           onclick="{literal}$(this).attr('value', 'Emptying cache'); $.get(siteurl + '/json/admin-empty-cache.php', null, function(data) {$('#empty-cache').attr('value', 'Cache Emptied');}); return false;{/literal}"
           />
    <br />
    Every page has a maximum cache time of 8 hours, however emptying the cache will ensure everyone will see fresh content immediately.
    <br /><br />

    <!-- [Enable GZip] -->
    <strong>GZip: </strong>
    <input type="radio" name="enable-gzip" id="enable-gzip-on" onclick="$('#savemsg_enablegzip').hide().html('Saving...').show(); frajax('admin-set-options','enablegzip','1');"{if $OPTIONS.enablegzip == '1'} checked="checked"{/if} /> <label for="enable-gzip-on">Enabled</label>
    <input type="radio" name="enable-gzip" id="enable-gzip-off" onclick="$('#savemsg_enablegzip').hide().html('Saving...').show(); frajax('admin-set-options','enablegzip','0');"{if $OPTIONS.enablegzip == '0'} checked="checked"{/if} /> <label for="enable-gzip-off">Disabled</label>
    <span id="savemsg_enablegzip" style="color: red;"></span>
    <br />
    GZipping your content reduces the amount of data that needs to be downloaded, and this can make a big difference to speed. Does not work correctly on some webhosts.
    <br /><br />
    All options are available from the <a href="{$ADMIN}/options/">options page</a>.
</div>
</div>
</div>
<div class="clear"></div>

</div>

{include file="admin/footer.tpl"}