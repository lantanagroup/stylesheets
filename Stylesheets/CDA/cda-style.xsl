<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="1.0">

  <xsl:template name="lantana-css">
    <style>
      /* Catch all for the document */
      .cda-render{
          font-family:CenturyGothic, sans-serif;
          /*font-size:1.25em;*/
      }

      /* One-off - CDA Document Title */
      .cda-render h1.cda-title{
        color:#b3623d;
        font-size:1.5em;
        font-weight:bold;
        text-align:center;
        text-transform: uppercase;
      }


      /* One-off - Table of contents formatting */
      .cda-render .toc-header-container {
        padding-top:0.5em;
        border-bottom-width:0.1em;
        border-bottom-style:solid;
        border-bottom-color:#b3623d;
        padding-bottom:0.5em;
      }
      
      .cda-render .toc-header {
        text-transform:uppercase;
        color:#b3623d;
        font-weight:bold;
      }
      
      .cda-render .toc {
        margin-top:3em;
        padding: 0px 15px;
      }

      .cda-render .toc-box {
        
      }


      /* One-off - Patient Name Formatting */
      .cda-render .patient-name {
        color:#336b7a;
        font-size:1.25em;
        font-weight:bold;
      }

     /* Patient ID Formatting */
     .patient-id {
       border-left-width: 0.15em;
       border-left-style: solid;
       border-left-color: #478B95;
     }
      /* Re-usable - Section-Title */
      .cda-render .section-title {
        color:#336b7a;
        font-size:1.09em;
        font-weight:bold;
        text-transform: uppercase;
      }

      /* Re-usable - Attribute title */
      .cda-render .attribute-title {
        color:#000000;
        font-weight:bold;
        font-size:1.04em;
      }


      /***** Header Grouping */
      .cda-render .header{
          border-bottom-width:0.1em;
          border-bottom-style:solid;
          border-bottom-color:#1B6373;
          padding-bottom:0.5em;
      }

      .cda-render .header-group-content{
          margin-left:1em;
          padding-left:0.5em;
          border-left-width:0.15em;
          border-left-style:solid;
          border-left-color:#478B95;
      }

      .cda-render .tight{
          margin:0;
      }
      .cda-render .generated-text{
          white-space:no-wrap;
          margin:0em;
          color:#B0592C;
          font-style:italic;
      }
      .cda-render .bottom{
          border-top-width:0.2em;
          border-top-color:#B0592C;
          border-top-style:solid;
      }

      /***** Table of Contents Attributes */
      /* Table of contents entry */
      .cda-render .lantana-toc {
        text-transform: uppercase;
      }
      
      .cda-render .bold {
        font-weight: bold;
      }

      .cda-render .active {
        border-right-color: #336b7a;
        border-right-style: solid;
        border-left-color: #336b7a;
        border-left-style: solid;
        background-color:#eee;
      }

      #navbar-list-cda {
        overflow: auto;
      }
    </style>
  </xsl:template>
  <xsl:template name="lantana-js">
    <script type="text/javascript">
      <![CDATA[
$(document).ready(function(){
    $('#navbar-list-cda').height($(window).height()-100);
});
$(window).resize(function(){
    $('#navbar-list-cda').height($(window).height()-100);
});

$(document).ready(function(){
    $('#navbar-list-cda').height($(window).height()-100);
});

$(window).resize(function(){
    $('#navbar-list-cda').height($(window).height()-100);
});

$(document).ready(function(){
    $('.cda-render a[href*="#"]:not([href="#"])').bind('click.smoothscroll',function (e) {
        e.preventDefault();
      
        var target = this.hash,
        $target = $(target);
      
        $('html, body').stop().animate({
            'scrollTop': $target.offset().top
        }, 1000, 'swing', function () {
            window.location.hash = target;
            
            // lets add a div in the background
            $('<div />').css({'background':'#336b7a'}).prependTo($target).fadeIn('fast', function(){
                $(this).fadeOut('fast', function(){
                    $(this).remove();
                });
            });
            
        });
    });
});

$( function() {
    $( "#navbar-list-cda-sortable" ).sortable();
    $( "#navbar-list-cda-sortable" ).disableSelection();
  } );

  $( function( ) {
    var $nav = $( '#navbar-list-cda-sortable' );
    var $content = $( '#doc-clinical-info' );
    var $originalContent = $content.clone( );
    $nav.sortable( {
        update: function ( e ) {
            $content.empty( );
            $nav.find( 'a' ).each( function ( ) {
                $content.append( $originalContent.clone( ).find( $( this ).attr( 'href' ) ).parent ( ) );
            } );

              $('[data-spy="scroll"]').each(function () {
  var $spy = $(this).scrollspy('refresh')
})
        }
    } );
  } );


      ]]>
    </script>
  </xsl:template>
</xsl:stylesheet>
