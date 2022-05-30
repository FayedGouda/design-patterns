class Address{
    var city:String
    var street:String
    var buildNumber:Int

    init(city:String, street:String, buildNumber:Int){
        self.city = city
        self.street = street
        self.buildNumber = buildNumber

    }
}

protocol Employee {
    var id:Int{get set}
    var name:String{get set}
    var address:Address{get set}
    func deepCopy()->Employee
    func getEmpDetails()->String
}

class RegularEmployee:Employee{
    var id:Int
    var name:String
    var address:Address
    init(id:Int, name:String, address:Address){
        self.id = id
        self.name = name
        self.address = address
    }
    func getEmpDetails()->String{
        return "ID : \(self.id), Name : \(self.name), Address ->  City : \(self.address.city), Street : \(self.address.street),Building Num : \(self.address.buildNumber)"
    }
     func deepCopy()->Employee{
         print(self)
        var myClone:RegularEmployee
        myClone.address = Address(city:address.city, street:address.street, buildNumber:address.buildNumber)
        return myClone
    }
}

// class TempEmployee:Employee{
//     var id:Int
//     var name:String
//     var address:Address

//     init(id:Int, name:String, address:Address){
//             self.id=id
//             self.name=name
//             self.address=address
//         }
//      func deepCopy()->Employee{
//         var myClone = self
//         myClone.address = Address(city:address.city, street:address.street, buildNumber:address.buildNumber)
//         return myClone
//     }
//      func getEmpDetails()->String{
//         return "ID : \(self.id), Name : \(self.name), Address ->  City : \(self.address.city), Street : \(self.address.street),Building Num : \(self.address.buildNumber)"
//     }
//  }
var address1 = Address(city:"City1", street:"Street1", buildNumber:1)
var address2 = Address(city:"City2", street:"Street2", buildNumber:2)
 var engineer = RegularEmployee(id:1, name:"Ali", address:address1 )
 var teacher:Employee =  TempEmployee(id:2, name:"Ahmed", address:address2 )
 print("********  Original Values *********")
 print(engineer.getEmpDetails())
 print(teacher.getEmpDetails())
 teacher = engineer.deepCopy()
//  print(Unmanaged.passUnretained(emp).toOpaque())
//  print(Unmanaged.passUnretained(empCopy).toOpaque())
 teacher.name="NewName"
 teacher.address.city="NewCity"

 print("********  Copy Values *********")
 print(engineer.getEmpDetails())
 print(teacher.getEmpDetails())

