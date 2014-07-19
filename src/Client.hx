import StringTools;
import js.JQuery;
import haxe.Json;

@:expose class Client {
//  todo:設定ファイルに移動する
// syntax hightligt
// auto insert

  @:extern
  inline static function _(str:Dynamic):JQuery { return untyped $(str); }

  public static function main():Void {
  }

  public static function urlEncode(raw:String):String {
    return StringTools.urlEncode(raw);
  }

  public static function selectInputCode():String {

    var input_code = _("#input_code").val();
    if (input_code == "" || input_code == "undefined") {
      return "";
    }
    return input_code;
  }

  public static function clearInputCode():Void {
    _("#input_code").val("");
  }

  public static function ajax(input_code:String):Void{
    untyped $.ajax({
      type: "POST",
      url: "/out/release/server.n",
      data: "input_code=" + input_code,
      success: successAct,
      error: errorAct
    });
  }

  static function successAct(mess:Dynamic):Void {
    _("#response-result").text("Success");
    _("#response-result").removeClass("label-danger");
    _("#response-result").addClass("label-success");
    _("#output").html(Json.parse(mess).result);
  }

  static function errorAct(mess:Dynamic):Void {
    _("#response-result").text("Error!!");
    _("#response-result").removeClass("label-success");
    _("#response-result").addClass("label-danger");
    _("#output").html(Json.parse(mess.responseText).result);
    _("#output").css("color", "red");
  }
}
