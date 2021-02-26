<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
    <head>
      <link rel="stylesheet" href="../style/details.css"/>
    </head>
    <body>
      <h1>Детайли за книгите</h1>
      <table style="width:100%">
        <xsl:for-each select="books/book">
            <tr class="book_info">
              <td><xsl:apply-templates select="book_header" /></td>
              <td><xsl:apply-templates select="book_details" /></td>
            </tr>
        </xsl:for-each>
      </table>
    </body>
  </html>
  </xsl:template>

  <xsl:template match="book_header">
    <div class = "header">
      <xsl:apply-templates select="cover_path" />
      <div class="text book_name"><xsl:value-of select="book_name"/></div>
      <div class="text"><xsl:value-of select="price"/> лв.</div>
    </div>
  </xsl:template>

  <xsl:template match="cover_path">
    <img src="{@path}" />
  </xsl:template>


  <xsl:template match="book_details">
    <div class = "details">
      <xsl:apply-templates select="authors" />
      <xsl:apply-templates select="genres" />
      <p><b>Брой странци: </b> <xsl:value-of select="pages"/></p>
      <p><b>Издателство: </b> <xsl:value-of select="publisher"/></p>
      <xsl:if test="rating &gt; 0">
        <p><b>Рейтинг: </b> <xsl:value-of select="rating"/> / 5</p>
      </xsl:if>
      <p><b>Резюме: </b> <xsl:value-of select="summary"/></p>
    </div>
  </xsl:template>

  <xsl:template match="authors">
    <p><b>Автор: </b>
      <xsl:for-each select="author">
        <xsl:value-of select="author_name"/>
        <xsl:text>; </xsl:text>
      </xsl:for-each>
    </p>
  </xsl:template>

  <xsl:template match="genres">
    <p><b>Жанр: </b>
      <xsl:for-each select="genre">
        <xsl:value-of select="@name"/>
        <xsl:text>; </xsl:text>
      </xsl:for-each>
    </p>
  </xsl:template>
</xsl:stylesheet>