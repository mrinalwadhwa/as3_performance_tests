package utils
{
  import flash.display.Sprite;
  import flash.text.TextField;
  import flash.text.TextFieldAutoSize;
  import flash.utils.setTimeout;
  
  [SWF(width=640, height=480, backgroundColor=0xffffff, frameRate=1)]
  public class PerfTest extends Sprite
  {
    public var logger:TextField = new TextField();

    public function PerfTest()
    {
      logger.autoSize = TextFieldAutoSize.LEFT;
      addChild(logger);
      setTimeout(test, 2000); // test is run after a 2 second delay
    }
    
    public function test():void
    {

    }    
    
    public function log(msg:*):void 
    { 
      logger.appendText(msg + "\n"); 
    }
  }
}