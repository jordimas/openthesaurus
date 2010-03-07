<%@page import="com.vionto.vithesaurus.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="api.title" /></title>
    </head>
    <body>

        <div class="body">

		<h1>API-Zugriff</h1>
		
		<p>Viele Daten dieser Website können direkt über eine HTTP-Schnittstelle
		abgefragt werden. Bisher wird nur die direkte Suche nach Synonymen und nach ähnlich geschriebenen Wörtern
		unterstützt. Noch nicht unterstützt wird die Suche nach Teilwörtern und die Wikipedia/Wiktionary-Suche.</p>
		
		<p><strong>Hinweis: das Ausgabe-Format kann sich unter Umständen noch ändern!</strong></p>
		
		<h2>Suchanfrage</h2>
		
		<p>Mit der folgenden HTTP-Anfrage via GET können alle Synonymgruppen,
		die das Wort <span class="bsp">query</span> beinhalten, abgefragt werden.</p>
		
		<pre>http://www.openthesaurus.de/synset/search?q=<strong>query</strong>&amp;format=text/xml</pre>
		
		<h2>Ergebnis</h2>
		
		<p>Das Ergebnis der Anfrage ist eine XML-Datei mit folgendem Format:</p>
		
<pre>
&lt;matches>
  &lt;metaData>
    &lt;apiVersion content="0.1.2"/>
    &lt;warning content="WARNING -- this API is in beta -- the format may change without warning!"/>
    &lt;copyright content="Copyright (C) 2009 Daniel Naber (www.danielnaber.de)"/>
    &lt;license content="GNU LESSER GENERAL PUBLIC LICENSE Version 2.1"/>
    &lt;source content="http://www.openthesaurus.de"/>
    &lt;date content="Sat Mar 06 22:47:25 CET 2010"/>
  &lt;/metaData>
  &lt;synset id="1234">
    &lt;categories>
      &lt;category name="Name der Kategorie"/>
    &lt;/categories>
    &lt;term term="Bedeutung 1, Wort 1"/>
    &lt;term term="Bedeutung 1, Wort 2"/>
  &lt;/synset>
  &lt;synset id="2345">
    &lt;categories/>
    &lt;term term="Bedeutung 2, Wort 1"/>
  &lt;/synset>
&lt;/matches>
</pre>


        <h2>Optionen</h2>

        <ul>
          <li><span class="apioption">format=text/xml</span>: Hiermit wird die Anwort als XML zurückgeliefert. Andere
            einfach auswertbare Formate werden derzeit nicht unterstützt, diese Option ist also  </li>
          <li><span class="apioption">similar=true</span>: Hiermit werden bei jeder Antwort auch bis zu fünf
          ähnliche Wörter zurückgegeben. Dies ist nützlich, um dem User einen Vorschlag im Falle eines möglichen
          Tippfehlers machen zu können. Beispielanfrage:

          <pre>http://www.openthesaurus.de/synset/search?q=<strong>Umstant</strong>&amp;format=text/xml&amp;similar=true</pre>

          Antwort (Ausschnitt):

<pre>
&lt;similarterms>
  &lt;term term="Umstand" distance="1"/>
  &lt;term term="(zeitlicher) Abstand" distance="3"/>
  &lt;term term="Abstand" distance="3"/>
  &lt;term term="amüsant" distance="3"/>
  &lt;term term="Anstalt" distance="3"/>
&lt;/similarterms>
</pre>
          <tt>distance</tt> gibt den Levenshtein-Abstand zum Suchwort an (Wörter in Klammern werden dabei ignoriert).
            Die Wörter sind bereits nach diesem Abstand sortiert. Es werden nur Wörter vorgeschlagen, die auch
            in OpenThesaurus vorhanden sind. Dieses Feature eignet sich also nicht dazu, die Vorschläge einer
            Rechtschreibprüfung zu generieren.
          </li>
          <li><span class="apioption">mode=all</span>: Aktiviert alle zusätzlichen Abfragen. Bisher ist das nur <tt>similar=true</tt>.</li>
        </ul>


        <h2>Bekannte Probleme</h2>

        <ul>
          <li>Umlaute werden bei der Suche wie ihre nicht-Umlaute behandelt, so findet <span class="bsp">tur</span>
            auch den Eintrag zu <span class="bsp">Tür</span> und umgekehrt.</li>
        </ul>


		<h2>Download</h2>
		
		<p>Zusätzlich zur direkten Abfrage stehen weiterhin
		<g:link action="download">Downloads</g:link> der gesamten Datenbank zur Verfügung.</p>
		
		</div>

    </body>
</html>
