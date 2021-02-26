<xsl:transform version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <rss version="2.0">
      <authors>
        <xsl:for-each select="books/book/book_details/authors/author">
          <author>
            <xsl:call-template name="author"/>
          </author>
        </xsl:for-each>
      </authors>
    </rss>
  </xsl:template>

  <xsl:template name="author">
    <name>
      <xsl:value-of select="author_name"/>
    </name>
    <biography>
      <xsl:value-of select="author_name"/>
    </biography>
    <more_info>
      <xsl:value-of select="nationality"/> родена на <xsl:value-of
      select="birth_day/date/@day"/>.<xsl:value-of select="birth_day/date/@month"/>.<xsl:value-of
      select="birth_day/date/@year"/>г.
      публикувала
      <xsl:value-of select="publishes_book"/> книги.
      <xsl:if test="death_day">
        Починал(а) на<xsl:value-of select="death_day/date/@day"/>.<xsl:value-of
        select="death_day/date/@month"/>.<xsl:value-of select="death_day/date/@year"/>г.
      </xsl:if>
    </more_info>
  </xsl:template>

</xsl:transform>