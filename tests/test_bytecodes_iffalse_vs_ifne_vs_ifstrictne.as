/*  

  Observed results:
    Description, Time
    boolean, 61
    boolean == , 61
    boolean === , 60
    number, 243
    number == , 64
    number === , 63
    integer, 61
    integer == , 61
    integer === , 60
    unsigned_integer, 61
    unsigned_integer == , 61
    unsigned_integer === , 61
    object, 231
    object == , 312
    object === , 237

  seems its is better to use if(variable) except when the variable is a Number and testing for Number == 0 
  iffalse uses one less instruction and seems to run at almost the same speed 

*/

package
{
  import flash.utils.getTimer;
  import utils.PerfTest;
  
  public class test_bytecodes_iffalse_vs_ifne_vs_ifstrictne extends PerfTest
  {
    override public function test():void
    {
      log("Description, Time");
      
      var beforeTime:int;
      var afterTime:int;
      var i:int;
      const REPS:int = 10000000;


      var boolean:Boolean = false;
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        // push local variable to stack using get_local
        // test if the top value on stack is false using iffalse
        if(boolean) {} // saves one instruction because false doesn't need to be pushed first
      }
      afterTime = getTimer();
      log("boolean, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        // push local variable to stack using get_local
        // push false to stack using push_false
        // test if top two values not equal using ifne, then jump accordingly 
        if(boolean == false) {}
      }
      afterTime = getTimer();
      log("boolean ==, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(boolean === false) {}
      }
      afterTime = getTimer();
      log("boolean ===, " + (afterTime - beforeTime));
      
      
      
      var number:Number = 0;
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(number) {}
      }
      afterTime = getTimer();
      log("number, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(number == 0) {}
      }
      afterTime = getTimer();
      log("number ==, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(number === 0) {}
      }
      afterTime = getTimer();
      log("number ===, " + (afterTime - beforeTime));
      
      
      
      var integer:int = 0;
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(integer) {}
      }
      afterTime = getTimer();
      log("integer, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(integer == 0) {}
      }
      afterTime = getTimer();
      log("integer ==, " + (afterTime - beforeTime));     
       
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(integer === 0) {}
      }
      afterTime = getTimer();
      log("integer ===, " + (afterTime - beforeTime));


      
      
      var unsigned_integer:uint = 0;
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(unsigned_integer) {}
      }
      afterTime = getTimer();
      log("unsigned_integer, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(unsigned_integer == 0) {}
      }
      afterTime = getTimer();
      log("unsigned_integer ==, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(unsigned_integer === 0) {}
      }
      afterTime = getTimer();
      log("unsigned_integer ===, " + (afterTime - beforeTime));
      
      
      
      var object:Object = null;
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(object) {}
      }
      afterTime = getTimer();
      log("object, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(object == null) {}
      }
      afterTime = getTimer();
      log("object ==, " + (afterTime - beforeTime));
      
      beforeTime = getTimer();
      for(i = 0; i < REPS; ++i)
      {
        if(object === null) {}
      }
      afterTime = getTimer();
      log("object ===, " + (afterTime - beforeTime));

    }
  }
}