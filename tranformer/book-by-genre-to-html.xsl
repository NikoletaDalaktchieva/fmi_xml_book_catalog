<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
    <head>
      <link rel="stylesheet" href="../style/header.css"/>
    </head>
    <body>
      <h1>Екшън книги</h1>
      <hr></hr>
      <xsl:for-each select="books/book[book_details/genres/genre/@name='action'][1]">
        <div  class="flip-container" ontouchstart="this.classList.toggle('hover')">
          <div class="flipper">
           <div class="front">
             <div class="img_div">
               <xsl:apply-templates select="book_header/cover_path" />
             </div>
             <div class="text book_name"><xsl:value-of select="book_header/book_name"/></div>
             <div class="text"><xsl:value-of select="book_header/price"/> лв.</div>
            </div>
            <div class="back">
              <div class="long_text"><xsl:value-of select="book_details/summary"/></div>
            </div>
          </div>
        </div>

      </xsl:for-each>
    </body>
  </html>
  </xsl:template>

  <xsl:template match="book_header/cover_path">
    <img src="{@path}" />
  </xsl:template>
</xsl:stylesheet>