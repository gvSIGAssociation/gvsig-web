/*
 * gvNIX. Spring Roo based RAD tool for Generalitat Valenciana
 * Copyright (C) 2013 Generalitat Valenciana
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* Global scope for GvNIX_Map_Coordinates_Component */
var GvNIX_Map_Coordinates_Component;

(function(jQuery, window, document) {
	GvNIX_Map_Leaflet.CONTROLS.coordinates =  function (oMap,sId,options) {
		if (!this instanceof GvNIX_Map_Leaflet.CONTROLS.coordinates) {
			alert("Warning: GvNIX_Map_Leaflet coordinates control must be initialised with the keyword 'new'");
		}

		this._default_options = jQuery.extend({},
				GvNIX_Map_Leaflet.CONTROLS.Base.default_options, {
			// No additional settings
		});

		this.s = jQuery.extend({}, this._default_options, options);

		this.fnSettings = function() {
			return this.s;
		}

		this._state = jQuery.extend({}, GvNIX_Map_Leaflet.CONTROLS.Base._state, {
			"sId" : sId,
			"oMap" : oMap,
			"oCoordinatesComponent" : null, // L.Coordinates instance
			"position" : "bottomleft",
			"decimals" : 4,
			"labelTemplateLat" : "lat: {y}",
			"labelTemplateLng" : "lng: {x}",
			"useLatLngOrder" : true,
			"removeMarkerText" : "Delete Point",
			"centerUserCoordinates" : false,
		    "enableUserInput" : true,
		    "showProjection" : false,
		    "destSRID" : "EPSG:25830"
		});

		this._fnConstructor();
	}

	GvNIX_Map_Leaflet.CONTROLS.coordinates.prototype = jQuery.extend({},
			GvNIX_Map_Leaflet.CONTROLS.Base._prototype,{
		"_fnConstructor": function () {
			this.__fnControlCoordinatesConstructor();
		},

		"__fnControlCoordinatesConstructor": function () {
			this.__fnConstructor();
			var st = this._state;
			var map = this._state.oMap;
			var s = this.s;
			st.removeMarkerText = s.coordinates_marker_remove_text;
			st.enableUserInput = s.enable_input;
			st.centerUserCoordinates = s.center_input_coordinates;
			st.showProjection = s.show_projection;
			st.destSRID = s.dest_srid;
			// Generating new coordinates component
			st.oCoordinatesComponent = new L.control.coordinates({
				position : st.position,
				decimals : st.decimals,
				labelTemplateLat : st.labelTemplateLat,
				labelTemplateLng : st.labelTemplateLng,
				enableUserInput: st.enableUserInput,
				centerUserCoordinates: st.centerUserCoordinates,
				useLatLngOrder : st.useLatLngOrder,
				markerProps : {
					removeMarkerText : st.removeMarkerText
				},
				displayUTM: {
					display: st.showProjection,
					sourceSRID : 'EPSG:4326',
					destSRID : st.destSRID,
					labelTemplateXUTM: "X: {x}",
					labelTemplateYUTM: "Y: {y}"
				}
			}).addTo(map.fnGetMapObject());
		},

	});

})(jQuery, window, document);
