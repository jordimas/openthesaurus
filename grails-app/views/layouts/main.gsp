<!doctype html>
<html lang="${message(code:'html.lang')}">
    <head>
        <title><g:layoutTitle default="OpenThesaurus" /></title>
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'reset-min.css')}" />
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'layout.css')}?v20140505" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:message(code:'favicon.name'))}" />
        <link rel="search" type="application/opensearchdescription+xml" title="OpenThesaurus" href="${createLinkTo(dir:'openSearch')}" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <g:render template="/script"/>
        <g:layoutHead />
        <g:render template="/layouts/scripts"/>
    </head>
    <body>

    <g:render template="/navigation"/>

    <div id="body">

        <div id="content">

            <g:render template="/searchform" model="${[homepage: true]}"/>

            <g:if test="${session.user}">
                <noscript>
                    <div class="nojs">
                        <g:message code='no.javascript.warning'/>
                    </div>
                </noscript>
            </g:if>

            <g:render template="/loggedin"/>

            <div id="searchResultArea" class="searchResultPopup">

                <g:layoutBody />
                
            </div>

        </div>

    </div>

    <g:render template="/footer" model="${[homepage:false]}"/>

    <g:render template="/analytics"/>

    </body>
</html>
