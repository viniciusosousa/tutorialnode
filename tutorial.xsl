<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"
        version="1.0"
        encoding="UTF-8"
        omit-xml-declaration="yes"
        doctype-public="html"
        indent="yes"/>

<xsl:template match="/root">
    <html>
        <head>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/styles/vs2015.min.css" />
            <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
        </head>
        <body>
            <h1><xsl:value-of select = "./@t" /></h1>
            <p class="float-right"><xsl:value-of select = "./@obs" /></p>                    
            <p><xsl:value-of select = "./@st" /></p>
            <hr />            
            <span class="clearfix"></span>            
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2" style="padding:0">
                        <div id="menu" class="navbar navbar-light bg-light" style="align-items:stretch; padding:0; overflow: scroll; height:500px;">
                            <xsl:for-each select="c">
                                <xsl:variable name="id"><xsl:value-of select="./@id"/></xsl:variable>
                                <b><a class="nav-link" href="#{$id}" style="padding:.2em"><xsl:value-of select="./@t"/></a></b>
                                <nav class="nav nav-pills" style="padding:0">
                                    <xsl:for-each select="./t">
                                    <xsl:variable name="id2"><xsl:value-of select="./@id"/></xsl:variable>
                                    <a class="nav-link ml-3" href="#{$id2}" style="padding:.2em"><xsl:value-of select="./@t"/></a>
                                </xsl:for-each>
                                </nav>
                            </xsl:for-each>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div data-spy="scroll" data-target="#menu" data-offset="0" style="position: relative;overflow: auto;height:500px;" id="editor">
                            <xsl:apply-templates/>
                        </div>
                    </div>
                </div>
            </div>
            
        </body>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
        <!--<script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/quill-table@1.0.0/dist/quill-table.min.js"></script>        
        <script>
        hljs.initHighlightingOnLoad();
        const quill = new Quill('#editor', {
            theme: 'snow'
        });
        </script>-->
    </html>
</xsl:template>
<xsl:template match="alert">
    <div class="alert alert-warning" role="alert">
        <p><xsl:apply-templates /></p>
    </div>
</xsl:template>            
<xsl:template match="c">
    <div>
    <xsl:attribute name="id">
        <xsl:value-of select="./@id"/>
    </xsl:attribute>
    <h2><xsl:value-of select="./@t"/></h2>
    <xsl:apply-templates select="node() | @*"/>    
    </div>
</xsl:template>
<xsl:template match="t">
    <div>
    <xsl:attribute name="id">
        <xsl:value-of select="./@id"/>
    </xsl:attribute>
    <h4><xsl:value-of select="./@t"/></h4>
    <xsl:apply-templates select="node() | @*"/>
    </div>
</xsl:template>

<xsl:template match="node() | @*">
    <xsl:copy>
        <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
</xsl:template>
</xsl:stylesheet>