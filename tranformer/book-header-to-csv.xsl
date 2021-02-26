<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="utf-8" media-type="text/csv"/>

  <xsl:decimal-format name="european" decimal-separator="," grouping-separator="."/>

  <xsl:template match="/">
    <xsl:text>"Име", "Цена", "Корица"</xsl:text>
    <xsl:text>&#10;</xsl:text>

    <xsl:for-each select="books/book/book_header">
      <xsl:call-template name="quote_string">
        <xsl:with-param name="string_to_quote" select="book_name"/>
      </xsl:call-template>
      <xsl:text>,</xsl:text>
      <xsl:call-template name="quote_string">
        <xsl:with-param name="string_to_quote" select="price"/>
      </xsl:call-template>
      <xsl:text>,</xsl:text>
      <xsl:call-template name="quote_string">
        <xsl:with-param name="string_to_quote" select="cover_path/@path"/>
      </xsl:call-template>
      <xsl:text>&#10;</xsl:text>
    </xsl:for-each>

    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="quote_string">
    <xsl:param name="string_to_quote"/>

    <xsl:variable name="striped_string">
      <xsl:value-of select="translate($string_to_quote, '&quot;', '')"/>
    </xsl:variable>

    <xsl:value-of select="concat('&quot;', $striped_string ,'&quot;')"/>
  </xsl:template>

  <xsl:template name="number">
    <xsl:param name="num"/>

    <xsl:if test="$num">
      <xsl:call-template name="quote_string">
        <xsl:with-param name="string_to_quote" select="format-number($num, '0,00', 'european')"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
