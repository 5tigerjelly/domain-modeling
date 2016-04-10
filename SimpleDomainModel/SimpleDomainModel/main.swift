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

////////////////////////////////////
// Job
//
public class Job {
    
    public var title: String
    public var salary: JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.salary = type
  }
  
    public func calculateIncome(hours: Int) -> Int {
        switch salary {
        case .Hourly:
            let numner = salary.Hourly.rawValue
            return Int(salary.Hourly())*hours
        case .Salary: return salary
        }
    }
  
  public func raise(amt : Double) {
  }
}

////////////////////////////////////
// Person
//
public class Person {
  public var firstName : String = ""
  public var lastName : String = ""
  public var age : Int = 0

  public var job : Job? {
    get {
        return self.job
    }
    set(value) {
        if age < 16 {
            self.job = Job(title: (value?.title)!, type: (value?.salary)!)
        }else{
            self.job = nil
        }
    }
  }
  
  public var spouse : Person? {
    get { }
    set(value) {
        if age < 18 {
            self.spouse = Person(firstName: (value?.firstName)!, lastName: (value?.lastName)!, age: (value?.age)!)
        }else{
            // isn't the default nil anyway?
            self.spouse = nil
        }
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  public func toString() -> String {
    return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(job) spouse:\(spouse)]"
  }
}

////////////////////////////////////
// Family
//
public class Family {
  private var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
    if spouse1.spouse == nil && spouse2.spouse == nil{
        spouse1.spouse = spouse2
        spouse2.spouse = spouse1
        members = [spouse1, spouse2]
    }
  }
  
    public func haveChild(child: Person) -> Bool {
        var check = false
        for person in members {
            if person.age > 21{
                check = true
            }
        }
        if check {
            members += [child]
        }
    }
  
  public func householdIncome() -> Int {
    var total = 0
    for person in members {
        if ((person.job?.salary) != nil) {
            total += person.job?.salary
        }
    }
  }
}





