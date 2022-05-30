//Creational Patterns
    //Factory Method

//Create interface for the bank


protocol  IBank {
    func withdraw()->String
}

class BankA:IBank{
    func withdraw()->String{
        return "You are working with bank A "
    }

}
class BankB:IBank{
    func withdraw()->String{
        return "You are working with bank B "
    }
}

protocol IBankFactory{
    func getBank(bankCode:String)->IBank
}
class BankFactory:IBankFactory{

    func getBank(bankCode:String)->IBank{
        var myBank:IBank!
        switch bankCode {
        case "11":
            myBank = BankA(); break
        case "22":
            myBank = BankB(); break
        default:
            myBank=nil
        }
        return myBank
    }
}

let bankFactory = BankFactory()

var ibank:IBank = bankFactory.getBank(bankCode:"11")

print(ibank.withdraw())

