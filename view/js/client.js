(function ($hx_exports) { "use strict";
var Client = $hx_exports.Client = function() { };
Client.main = function() {
};
Client.urlEncode = function(raw) {
	return encodeURIComponent(raw);
};
Client.selectInputCode = function() {
	var input_code = $("#input_code").val();
	if(input_code == "" || input_code == "undefined") return "";
	return input_code;
};
Client.clearInputCode = function() {
	$("#input_code").val("");
};
Client.ajax = function(input_code) {
	$.ajax({ type : "POST", url : "/bin/server.n", data : "input_code=" + input_code, success : Client.successAct, error : Client.errorAct});
};
Client.successAct = function(mess) {
	$("#response-result").text("Success");
	$("#response-result").removeClass("label-danger");
	$("#response-result").addClass("label-success");
	$("#output").html(JSON.parse(mess).result);
};
Client.errorAct = function(mess) {
	$("#response-result").text("Error!!");
	$("#response-result").removeClass("label-success");
	$("#response-result").addClass("label-danger");
	$("#output").html(JSON.parse(mess.responseText).result);
	$("#output").css("color","red");
};
var js = {};
var q = window.jQuery;
js.JQuery = q;
Client.main();
})(typeof window != "undefined" ? window : exports);
