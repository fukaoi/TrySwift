import sys.FileSystem;
import sys.io.File;
import haxe.Json;

class Config {
  private static inline var CONFIG_PATH:String = "config.json";
  public static function get(key_name:String):Dynamic {
    if (!FileSystem.exists(CONFIG_PATH)) {throw "Not found config.json";}
    var config = File.getContent(CONFIG_PATH);
    return Reflect.getProperty(Json.parse(config), key_name);
  }
}
