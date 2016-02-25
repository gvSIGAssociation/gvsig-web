jQuery(document).ready(function() {

//Setting layer control collapse toc
	// Setting max height of layer control
	/* jQuery(".mapviewer_layers").css("max-height", finalHeight - 90 + "px"); */

	// Setting position of layer control collapse button
	//	var layerControlWidth = jQuery(".leaflet-control-layers").width();
	//	var layerControlHeight = jQuery(".leaflet-control-layers").height();
	//	var buttonHeight = jQuery(".leaflet-control-layers-collapse-button").height();
	//	var buttonWidth = jQuery(".leaflet-control-layers-collapse-button").width();
	//	jQuery(".leaflet-control-layers-collapse-button").css("top", "0px" );

	// Setting position of layer control collapse button image
	//	jQuery(".leaflet-control-layers-collapse-button").css("margin-left", (layerControlWidth - (buttonWidth)/4) + "px" );
	/* jQuery(".leaflet-control-layers-collapse-button").css("margin-left", (layerControlWidth - (layerControlWidth)) + "px" ); */

	// Setting position of layer control collapse button image
	//	var imageHeight = jQuery(".leaflet-control-layers-collapse-button > img").height();
	//	jQuery(".leaflet-control-layers-collapse-button > img").css("margin-top",  (buttonHeight/2) -  (imageHeight/2) + "px");

	// Setting max width of toolbar control
	/* jQuery(".leaflet-control-toolbar").css("max-width", windowWidth - 20 + "px"); */

// Container layers

	// Creamos un div container
		jQuery(".leaflet-control-layers").append("<div id='toc-container' class='tab-content'></div>");

   // situado dentro del tab
	  jQuery(".tab-content").append(jQuery(".tab-pane"))

		//general collapse
	    jQuery(".tab-content").addClass("collapse");

//	Layer settings

	//opacity tool collapsed
	jQuery(".leaflet-control-layers-toolbar").addClass("collapse");
	jQuery(".leaflet-control-layers-toolbar").attr("id","toc-tools");
	// added button to show opacity
	jQuery(".fancytree-node .col-xs-3").prepend("<a class='btn-toc-tools' data-original-title='Control de opacidad de la capa' title='Control de opacidad de la capa'><span aria-hidden='true' class='toc-tools glyphicon glyphicon-cog'></span></a>");

	// Ubicamos capa
	//init toggle
	$('.btn-toc-tools').click(function(){
		var $boton = jQuery(this);
		var $parent = $boton.closest("span");
		var $opacityTool = jQuery(".tool-opacity");
		//comprobamos si la capa ya tiene la opacidad anyadida
		if($parent.find(".tool-opacity").length == 0){
			//sino la tiene anyadimos opacidad a la capa
			$parent.append($opacityTool);
			$opacityTool.show();
		}else{
			//si la tiene la quitamos y ocultamos
			$opacityTool.hide();
			jQuery('.fancytree-container').prepend($opacityTool);

		}
	});


	//Images Toc
	jQuery("div[id^='ps_es_gva_dgti_gvgeoportal_web_'] img").addClass("img-responsive");


});


//init tabs toc height

var tabsFn = (function() {

	   function init() {
	     setHeight();
	   }

	   function setHeight() {
		   tabsHeight = $('.tabs-left').height();
		   var $tabContent = $('.tab-content');
	       var $tabPane = $('.tab-pane');

	     $tabPane.css({
	       height: tabsHeight
	     });
	     $tabContent.css({
		       height: tabsHeight
		     });
	   }

	   $(init);
})();

//altura tabs
$(document).ready(function(){
$('.ui-tabs-anchor').click(function(){
	   $('.nav-tabs.tabs-left').css("height","55vh");
	   $('.tab-pane').css("height","55vh");

	});
});

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});



