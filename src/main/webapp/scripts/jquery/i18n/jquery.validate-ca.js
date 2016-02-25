/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ES (Spanish; Español)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Aquest camp és obligatori.",
		remote: "Per favor, emplena aquest camp.",
		email: "Per favor, escriu una adreça de correu vàlida",
		url: "Per favor, escriu una URL vàlida.",
		date: "Per favor, escriu una data vàlida.",
		dateISO: "Per favor, escriu una data (ISO) vàlida.",
		number: "Per favor, escriu un nombre enter vàlid.",
		digits: "Per favor, escriu només dígits.",
		creditcard: "Per favor, escriu un nombre de targeta vàlid.",
		equalTo: "Per favor, escriu el mateix valor de nou.",
		accept: "Per favor, escriu un valor amb una extensió acceptada.",
		maxlength: $.validator.format("Per favor, no escrigues més de {0} caràcters."),
		minlength: $.validator.format("Per favor, no escrigues menys de {0} caràcters."),
		rangelength: $.validator.format("Per favor, escriu un valor entre {0} i {1} caràcters."),
		range: $.validator.format("Per favor, escriu un valor entre {0} i {1}."),
		max: $.validator.format("Per favor, escriu un valor menor o igual a {0}."),
		min: $.validator.format("Per favor, escriu un valor major o igual a {0}.")
	});
}(jQuery));