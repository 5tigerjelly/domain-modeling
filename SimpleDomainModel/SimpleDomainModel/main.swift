//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

public class TestMe {
  public func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
  
   public init(amount: Int, currency: String){
        self.amount = amount
        self.currency = currency
    }
    
  public func convert(to: String) -> Money {
    let check = (currency, to)
        switch check {
            case ("USD", "GBP"): return Money(amount: amount/2, currency: "GBP")
            case ("GBP", "USD"): return Money(amount: amount*2, currency: "USD")
            case ("USD", "EUR"): return Money(amount: amount*15/10, currency: "EUR")
            default: return Money(amount: amount, currency: currency)
        }
    }
  
    public func add(to: Money) -> Money {
        if to.currency == currency {
            return Money(amount: amount+to.amount, currency: currency)
        }else{
            let newmoney = self.convert(to.currency)
            return Money(amount: newmoney.amount+to.amount, currency: currency)
        }
    }
  public func subtract(from: Money) -> Money {
    if from.currency == currency{
        return Money(amount: amount-from.amount, currency: currency)
    }else{
        let newmoney = self.convert(from.currency)
        return Money(amount: newmoney.amount-from.amount, currency: currency)
    }
  }
}

//////////////////////////////////////
//// Job
////
//public class Job {
//    
//    public var title : String
//    public var salary : Int
//    
//    //how do you play with enum?
//  public enum JobType {
//    case Hourly(Double)
//    case Salary(Int)
//  }
//    //very confusing !!
//    public init(title : String, type : JobType) {
//        self.title = title
//        switch type {
//        case .Hourly: JobType.Hourly = type.rawValue
//        case .Salary:<#code#>
//        }
//    }
//  
//    public func calculateIncome(hours: Int) -> Int {
//        return Int(JobType.Hourly(Double(hours)))
//    }
//  
//  public func raise(amt : Double) {
//  }
//}
//
//////////////////////////////////////
//// Person
////
//public class Person {
//  public var firstName : String = ""
//  public var lastName : String = ""
//  public var age : Int = 0
//
//  public var job : Job? {
//    get { }
//    set(value) {
//    }
//  }
//  
//  public var spouse : Person? {
//    get { }
//    set(value) {
//    }
//  }
//  
//  public init(firstName : String, lastName: String, age : Int) {
//    self.firstName = firstName
//    self.lastName = lastName
//    self.age = age
//  }
//  
//  public func toString() -> String {
//  }
//}
//
//////////////////////////////////////
//// Family
////
//public class Family {
//  private var members : [Person] = []
//  
//  public init(spouse1: Person, spouse2: Person) {
//  }
//  
//  public func haveChild(child: Person) -> Bool {
//  }
//  
//  public func householdIncome() -> Int {
//  }
//}
//
//
//
//
//
