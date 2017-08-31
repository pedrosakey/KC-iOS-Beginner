//
//  DateExtensions.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 29/8/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import Foundation

extension Date {
    
    func shortDateString() -> String {
        

        let dateFormatter = DateFormatter()
        
        //:to '.short'
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: self)
    }
    
    static func createDate (day: Int, month: Int, year: Int) -> Date{
        
        let someDateComponents = DateComponents(calendar: Calendar.current,year:year, month:month, day:day)
        let someDate : Date = someDateComponents.date!
        
        return someDate

    }
    
}
