<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:axsl="http://www.w3.org/1999/XSL/TransformAlias"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs xsl"
    version="1.0">
    <xsl:output indent="yes" method="xml" />
    <xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>
    <xsl:param name="combineFile" select="'Stylesheets/CDA/CDA-Lantana-Style.xsl'" />
    <xsl:param name="bootstrap-css-cdn" />
    <xsl:param name="bootstrap-js-cdn" />
    <xsl:param name="jquery-js-cdn" />
    <xsl:param name="jquery-ui-js-cdn" />
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="xsl:stylesheet">
        <axsl:stylesheet version="1.0">
            <xsl:attribute name="version">1.0</xsl:attribute>
            <xsl:apply-templates />
            <xsl:apply-templates select="document($combineFile)/xsl:stylesheet/*" />
        </axsl:stylesheet>
    </xsl:template>
    <xsl:template match="xsl:template[@name='bootstrap-css']/style">
        <xsl:choose>
            <xsl:when test="$bootstrap-css-cdn">
                <link rel="stylesheet">
                    <xsl:attribute name="href"><xsl:value-of select="$bootstrap-css-cdn"/></xsl:attribute>
                </link>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="xsl:template[@name='bootstrap-javascript']/script">
        <xsl:choose>
            <xsl:when test="$bootstrap-js-cdn">
                <script type="text/javascript">
                    <xsl:attribute name="src"><xsl:value-of select="$bootstrap-js-cdn"/></xsl:attribute>
                </script>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="xsl:template[@name='jquery']/script">
        <xsl:choose>
            <xsl:when test="$jquery-js-cdn">
                <script type="text/javascript">
                    <xsl:attribute name="src"><xsl:value-of select="$jquery-js-cdn"/></xsl:attribute>
                </script>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="xsl:template[@name='jquery-ui']/script">
        <xsl:choose>
            <xsl:when test="$jquery-ui-js-cdn">
                <script type="text/javascript">
                    <xsl:attribute name="src"><xsl:value-of select="$jquery-ui-js-cdn"/></xsl:attribute>
                </script>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="xsl:include[@href='CDA-Lantana-Style.xsl']">
        <!-- Ignore -->
    </xsl:template>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>