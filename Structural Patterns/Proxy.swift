protocol SMS {
    func sendSMS(_ customerId:String, _ mobileNumber:String, _ sms:String)->String
}


class Base:SMS{
    init(){

    }

    func sendSMS(_ customerId:String, _ mobileNumber:String, _ sms:String)->String{
        //Send realworld SMS short messages

        return "Message sent to : \(mobileNumber)"
    }
}

class ProxySMS{

    var base = Base()
    var counter:Int = 1
    var users = [String]()
    init(){
        
    }
    func sendSMS(_ customerId:String, _ mobileNumber:String, _ sms:String)->String{
        //Send realworld SMS short messages
        if counter < 3{
            counter += 1
            return base.sendSMS(customerId, mobileNumber, sms)

        }
        return "Message not sent"
    }
}


var p = ProxySMS()
print("Result : ", p.sendSMS("1", "011111111", "message 1"))
print("Result : ", p.sendSMS("1", "011111111", "message 2"))
print("Result : ", p.sendSMS("1", "011111111", "message 3"))