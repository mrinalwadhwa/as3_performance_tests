/*
  
  Test perfomance for various conditionals
  
  
  Observed results:
    Description, Time
    if-else with implicit test for == 0, 203
    ternary with implicit test for == 0, 205
    if-else with explicit test for == 0, 202
    ternary with explicit test for == 0, 201
    if-else with many conditions, 223
    ternary with many conditions, 212
  
  * if-else produces the least bytecode and performs just as well as ternary operator
  * switch is much slower than if-else or ternary ?: conditional
  * ternary ?: conditional seems to produce one unnecessary extra instruction in bytecode but execution speed 
  still seems to be about the same  


  Also see:
    http://jacksondunstan.com/articles/793
    http://jacksondunstan.com/articles/1007
    
*/

package
{
  import flash.utils.getTimer;
  import utils.PerfTest;
  
  public class test_conditinals extends PerfTest
  {

    override public function test():void
    {
      log("Description, Time");
      
      var beforeTime:int;
      var afterTime:int;
      var i:int;
      const REPS:int = 10000000;
      var val:int = 100;



      // below two tests produce exctly the same bytecode, execution speed is exactly same

      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(val) noop();
        else noop();
      }
      afterTime = getTimer();
      log("if-else with implicit test for == 0, " + (afterTime - beforeTime));

      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        val ? noop() : noop();
      }
      afterTime = getTimer();
      log("ternary with implicit test for == 0, " + (afterTime - beforeTime));
      
      
      
      // below two tests *do not* produce the same bytecode, ternary uses an extra instruction, but execution speed 
      // still seems to be about the same
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(val == 0) noop();
        else noop();
      }
      afterTime = getTimer();
      log("if-else with explicit test for == 0, " + (afterTime - beforeTime));   
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        val == 0 ? noop() : noop();
      }
      afterTime = getTimer();
      log("ternary with explicit test for == 0, " + (afterTime - beforeTime));
      
      
      
      
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(val == 0) noop();
        else if(val == 1) noop();
        else if(val == 2) noop();
        else if(val == 3) noop();
        else noop();
      }
      afterTime = getTimer();
      log("if-else with many conditions, " + (afterTime - beforeTime));   
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        val == 0 ? noop() : 
          val == 1 ? noop() : 
            val == 2 ? noop() : 
              val == 3 ? noop() : 
                noop();
      }
      afterTime = getTimer();
      log("ternary with many conditions, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        switch (val)
        {
            case 0: noop(); break;
            case 1: noop(); break;
            case 2: noop(); break;
            case 3: noop(); break;
            default: noop();
        }
      }
      afterTime = getTimer();
      log("switch with many conditions, " + (afterTime - beforeTime));
      
      
    }


    
    private function noop():void {} // a function that does nothing
    
  }
}