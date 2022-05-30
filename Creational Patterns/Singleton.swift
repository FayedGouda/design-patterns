
//Creational Patterns

    //Singleton Pattern

class Counter{
    var count:Int=0
    //create single instance of the class 
    static var instance = Counter()
    //private constructor, so that no new instance can't be created outside the class
    private init (){
    }
    //method to get a unique instance of this class
    public static func getInstance()->Counter{
        return instance
    }
    func increamentCount(){
        self.count += 1
    }
}

let v = Counter.getInstance()




//get instance of the Counter class
var counter1 = Counter.getInstance()

//get the same instance of the Counter class
var counter2 = Counter.getInstance()

//increament cout by one
counter1.increamentCount()
//increament the same cout by one
counter2.increamentCount()

//prints 2
print("counter1 : ", counter1.count)

//Get memory location of first instance
let counter1MemoryAddress = Unmanaged.passUnretained(counter1).toOpaque()
print("counter1 Memory Location :", counter1MemoryAddress)

print("counter2 : ", counter2.count)
//Get memory location of second instance
let counter2MemoryAddress = Unmanaged.passUnretained(counter2).toOpaque()
print("counter2 Memory Location :",counter2MemoryAddress)

//To make sure they are the same instance of that class
//Get thier location, you will find out they are pointing the same memory address
if counter1MemoryAddress == counter2MemoryAddress{
    print("counter1 & counter2 are Same instance")
}

//Notes:
//This approach is perfect of singlethread principles
//If you are working in multithread environment, you need to apply lock and unlock concepts