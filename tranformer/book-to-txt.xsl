<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="utf-8" />
  <xsl:template match="/">
    <xsl:for-each select="books/book">
      Основни данни:
        <xsl:call-template name="header"/>

      Детайли:
        <xsl:call-template name="details"/>
____________________________________________________________________________________________________
    </xsl:for-each>

    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="header">
        Име: <xsl:value-of select="book_header/book_name"/>
        Цена: <xsl:value-of select="book_header/price"/>
  </xsl:template>

  <xsl:template name="details">
        Език: <xsl:value-of select="book_details/language"/>
        Стриници:<xsl:value-of select="book_details/pages"/>
        Дата на публикуване: <xsl:call-template name="genres"/>
        Тип корица: <xsl:value-of select="book_details/cover_type/@type"/>
        Резюме: <xsl:value-of select="book_details/summary"/>
  </xsl:template>

  <xsl:template name="genres" >
    <xsl:value-of select="book_details/publish_date/date/@year"/>.<xsl:value-of select="book_details/publish_date/date/@month"/>.<xsl:value-of select="book_details/publish_date/date/@day"/>
  </xsl:template>

</xsl:stylesheet>
