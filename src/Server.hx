import sys.io.File;
import sys.io.Process;
import neko.Web;
import neko.Lib;
import haxe.Json;

class Server {
  public static function main():Void {
    try {
      var code = Web.getParams().get("input_code");
      var response = createCodeFile(code, cmd);
      Lib.print(Json.stringify({result: response}));
    } catch (error_message:String) {
      Web.setReturnCode(500);
      Lib.print(Json.stringify({result: error_message}));
    }
  }

  static function cmd(path:String):Dynamic {
    var process = new Process("swift", ["-i", path]);
    var error = process.stderr.readAll().toString();
    if (error != "") {
      Web.logMessage("Compile Errror");
      throw error;
    }
    Web.logMessage("Compile Success!!");
    return process.stdout.readAll().toString();
  }

  static function createCodeFile(input:String, func:String -> Dynamic):Dynamic {
    var fname = "/tmp/test.swift";
    var fout = File.write(fname, false);
    fout.writeString(input);
    fout.close();
    return func(fname);
  }
}
