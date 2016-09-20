# CDA Stylesheet
## Introduction
This folder contains the Lantana CDA stylesheet, an open-source
renderer for CDA documents. The stylesheet transforms the XML of a CDA document
into a webpage that can be viewed in a browser or other XSLT-compatible application.

#### Some Features
-	Adapt to any device, including paper (responsive)
-	Drag and drop re-ordering of sections from the Table of Contents
-	Indicate context by highlighting current section while navigating
-	Map common header identifiers to human readable display text (mostly US)
-	Logical grouping, revamped color palette, clearer text

## Installation
No installation necessary. Make sure both CDA-Lantana.xsl and CDA-Lantana-Style.xsl
are in the same directory. CDA-Lantana calls on CDA-Lantana-Style.

## Use
Simply reference the stylesheet in the XML file and open the XML file in
Internet Explorer (Edge or older IE). To use the navigation features, select
"Allow blocked content"
```
<?xml-stylesheet type="text/xsl" href="./CDA-Lantana.xsl"?>
```
Alternatively use an XSLT transformation engine and open the output in your browser of
choice. The output is confirmed to work on Chrome, Internet Explorer (Edge or Older)
and Firefox.
