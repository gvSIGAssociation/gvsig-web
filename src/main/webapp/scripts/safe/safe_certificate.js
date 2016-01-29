/*
 gvGeoportal is sponsored by the General Directorate for Information
 Technologies (DGTI) of the Regional Ministry of Finance and Public
 Administration of the Generalitat Valenciana (Valencian Community,
 Spain), managed by gvSIG Association and led by DISID Corporation.

 Copyright (C) 2016 DGTI - Generalitat Valenciana

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as
 published by the Free Software Foundation, either version 3 of the
 License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.

 You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
var resultado;
function cargarAppletSafe(tipoAcceso) {
	//-- Si la version de Java no es superior a la 1.6.0_10 mostrar mensaje
	if (deployJava.versionCheck("1.6.0_10+")) {
		if (tipoAcceso == "LDAP") {
			loadAutenticacionCompletaApplet("ldap","f","datosgenerados", "", "true", "", "", "", "", "","");
		} else {
			loadAutenticacionSimpleApplet(tipoAcceso,
					"datosgenerados", "");
		}
	} else {

		alert("La version de java debe ser mayor de la 1.6");
	}
}

function appletFinalizado(s, codigoError) {
	resultado = s;
	if (resultado == null || resultado == "null") {
		showInfoSafe();
	} else {
		var oFormObject = jQuery("#form-signin-certificate")[0];
		oFormObject.elements["j_token"].value = resultado;
		oFormObject.submit();
	}
}

function showInfoSafe() {
	var infoSafe = document.getElementById("infoSafe");
	infoSafe.style.display = 'inline';
}
