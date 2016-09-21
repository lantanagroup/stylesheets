<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
    <xsl:output method="HTML" indent="yes" />
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="a[@href]">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="concat(substring-before(@href, '.xml'), '.html')" />
            </xsl:attribute>
            <xsl:value-of select="concat(substring-before(text(), '.xml'), '.html')" />
        </a>
    </xsl:template>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>