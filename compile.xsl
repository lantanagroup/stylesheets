<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:axsl="http://www.w3.org/1999/XSL/TransformAlias"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs xsl"
    version="1.0">
    <xsl:output indent="yes" method="xml" />
    <xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>
    <xsl:param name="styleFile" select="'Stylesheets/CDA/cda-style.xsl'" />
    <xsl:param name="jsFile" select="'Sytlesheets/CDA/cda-js-dependencies.xsl'" />
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="xsl:stylesheet">
        <axsl:stylesheet version="1.0">
            <xsl:attribute name="version">1.0</xsl:attribute>
            <xsl:apply-templates  />
            <xsl:apply-templates select="document($styleFile)/xsl:stylesheet/*" />
            <xsl:apply-templates select="document($jsFile)/xsl:stylesheet/*"/>
        </axsl:stylesheet>
    </xsl:template>
    <xsl:template match="xsl:include[@href='cda-style.xsl']">
        <!-- Ignore -->
    </xsl:template>
    <xsl:template match="xsl:include[@href='cda-js-dependencies.xsl']">
        <!-- Ignore -->
    </xsl:template>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>