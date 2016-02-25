/* global L */

// A toolbar control for TOC with fancytree
L.Control.HtmlLayersToolbarControl = L.Control.extend({

  initialize: function (options) {
	  this._html = "";
	  this._lastZIndex = 0;
	  this._handlingClick = false;
	  this._initLayout();
  },

  _initLayout: function () {
    var className = 'leaflet-control-layers-toolbar',
        container = this._container = L.DomUtil.create('div', className);

    //Makes this work on IE10 Touch devices by stopping it from firing a mouseout event when the touch is released
    container.setAttribute('aria-haspopup', true);

    if (!L.Browser.touch) {
      GvNIX_Map_Leaflet.Util.disableClickPropagation(container);
      L.DomEvent.on(container, 'wheel', L.DomEvent.stopPropagation);
    } else {
      L.DomEvent.on(container, 'click', L.DomEvent.stopPropagation);
    }

    // Generating TOC toolbar
    var form = this._form = L.DomUtil.create('form', className + '-list');

    container.appendChild(form);
  },

  _setHtmlContent: function (html) {
	  this._html = html;
	  jQuery(this._form).html(html);
  },

  _setLayerToolbar: function () {

  },

  _onLayerChange: function (e) {
  },

});

L.control.htmlLayersToolbar = function (options) {
  return new L.Control.HtmlLayersToolbarControl(options);
};
