<xsl:transform version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <rss version="2.0">
      <books>
        <xsl:apply-templates select="books"/>
      </books>
    </rss>
  </xsl:template>

  <xsl:template match="book">
    <book>
      <xsl:apply-templates select="book_header"/>
      <xsl:apply-templates select="book_details"/>
    </book>
  </xsl:template>

  <xsl:template match="book_header">
    <title>
      <xsl:value-of select="book_name"/>
    </title>
    <cover>
      <xsl:variable name="entryLink" select="cover_path[@path][1]/@path"/>
      <xsl:choose>
        <xsl:when test="$entryLink">
          <xsl:value-of select="$entryLink"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="book_name"/>
        </xsl:otherwise>
      </xsl:choose>
    </cover>
  </xsl:template>

  <xsl:template match="book_details">
    <author>
      <xsl:for-each select="authors/author">
        <xsl:value-of select="author_name"/>
        <xsl:text>; </xsl:text>
      </xsl:for-each>
    </author>
    <genre>
      <xsl:for-each select="genres/genre">
        <xsl:value-of select="@name"/>
        <xsl:text>; </xsl:text>
      </xsl:for-each>
    </genre>
  </xsl:template>

</xsl:transform>