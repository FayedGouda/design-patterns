//Creational Patterns
    //Abstract Factory 

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
protocol PaymentCrad{
    func getCardName()->String
    func getCardProvider()->String
}
class VisaCrad:PaymentCrad{
    func getCardName()->String{
        return "Visa Card"
    }
    func getCardProvider()->String{
        return "Provider is Visa "
    }
}
class MasterCrad:PaymentCrad{
    func getCardName()->String{
        return "MasterCard"
    }
    func getCardProvider()->String{
        return "Provider is MsterCard "
    }
}

protocol ATM{

    // deposit 
    func deposit()->String

    // Withdrawal
    func withdrawal()->String
}
class BankA_ATM:ATM{
     func deposit()->String{
            return "You have 100$"
    }

    // Withdrawal
    func withdrawal()->String{
            return "You withdrawaled 100$"
    }
    
}
class BankB_ATM:ATM{
    func deposit()->String{
            return "You have 100$"
    }

    // Withdrawal
    func withdrawal()->String{
            return "You withdrawaled 100$"
    }

}

protocol IBankFactory{
    func getBank(bankCode:String)->IBank
    func getPaymentCard(cardNumber:String)->PaymentCrad?
    func getBankATM(bankCode:String)->ATM?
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

    func getPaymentCard(cardNumber:String)->PaymentCrad?{
        var myPaymentCard:PaymentCrad?
        switch cardNumber {
        case "12":
            myPaymentCard = VisaCrad();break
            
        case "34":
            myPaymentCard = MasterCrad();break
        default:
             myPaymentCard = nil
        }
        return myPaymentCard
    }

    func getBankATM(bankCode:String)->ATM?{
            var atm:ATM?
            switch bankCode {
            case "a":
                atm = BankA_ATM();break
                
            case "b":
                atm = BankB_ATM();break
            default:
                atm = nil
            }
            return atm

        }

}

var bankFactory = BankFactory()

 if let paymentCard:PaymentCrad = bankFactory.getPaymentCard(cardNumber:"34"){

    print(paymentCard.getCardName(), ",", paymentCard.getCardProvider())   

}else{
    print("Wrong card number")
}

//  if let atm:ATM = bankFactory.getBankATM(bankCode:"v"){
//     print(atm)
//     print(atm.deposit())
//     print(atm.withdrawal())   
// }else{
//     print("Wrong Bankcode number")
// }