import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"; 


actor DBank{
  stable var currentValue : Float = 300.0; 
  // currentValue := 100;

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  let id = 736723648263478;
  //Debug.print(debug_show(id));


  public func topUp(amount : Float) { 
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount : Float) { 
    if (amount <= currentValue) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Insufficient funds");
    };
  };

  public query func checkBalance(): async Float { 
    return currentValue;
  };

  //topUp();

  public func compound(){
    let currentTime = Time.now();
    let timeElapsed = currentTime - startTime;
    let timeElapsedInSeconds = timeElapsed / 1_000_000_000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedInSeconds));
  }

}