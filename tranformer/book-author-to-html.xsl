<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <xsl:variable name="author" select="books/book/book_details/authors/author[author_name='Джордж Оруел'][1]"/>
    <xsl:variable name="author_books" select="books/book[book_details/authors/author/author_name='Джордж Оруел'][1]"/>

    <html>
      <head>
        <link rel="stylesheet" href="../style/author.css"/>
      </head>
      <body>
        <h1>Основна информация:</h1>
        <xsl:for-each
          select="$author">
          <p>
            <b>Име:</b>
            <xsl:value-of select="author_name"/>
          </p>
          <p>
            <b>Дата на раждане:</b>
            <xsl:value-of select="birth_day/date/@day"/>.<xsl:value-of
            select="birth_day/date/@month"/>.<xsl:value-of select="birth_day/date/@year"/>г.
          </p>
          <xsl:if test="death_day">
            <p>
              <b>Починал(а):</b>
              <xsl:value-of select="death_day/date/@day"/>.<xsl:value-of
              select="birth_day/date/@month"/>.<xsl:value-of select="birth_day/date/@year"/>г.
            </p>
          </xsl:if>
          <p>
            <b>Публикувани книги:</b>
            <xsl:value-of select="publishes_book"/>
          </p>
          <p>
            <b>Биография:</b>
            <xsl:value-of select="biography"/>
          </p>

        </xsl:for-each>

        <hr/>
        <h1>Книги:</h1>
        <div class = "book">
          <xsl:for-each select="$author_books">
            <xsl:apply-templates select="book_header/cover_path" />
            <p><xsl:value-of select="book_header/book_name"/></p>
          </xsl:for-each>
        </div>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="book_header/cover_path">
    <img src="{@path}" />
  </xsl:template>
</xsl:stylesheet>