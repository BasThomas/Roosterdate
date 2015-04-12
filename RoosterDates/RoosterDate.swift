//
//  RoosterDate.swift
//  RoosterDates
//
//  Created by Bas Broek on 12/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import UIKit

extension NSDate
{
    public var weekday: Weekday
    {
        let weekday = NSCalendar.currentCalendar().components(.CalendarUnitWeekday, fromDate: self).weekday
        
        switch(weekday)
        {
            case 1:
                return .Sunday
            
            case 2:
                return .Monday
            
            case 3:
                return .Tuesday
            
            case 4:
                return .Wednesday
            
            case 5:
                return .Thursday
            
            case 6:
                return .Friday
            
            case 7:
                return .Saturday
            
            default:
                return .Monday
        }
    }
    
    public func lastMonday() -> NSDate
    {
        let daysUntil: Double
        
        switch(self.weekday)
        {
            case .Monday:
                daysUntil = 0
            default:
                daysUntil = Double(self.weekday.rawValue - 2)
        }
        
        let toLastMonday = 24 * 60 * 60 * -daysUntil
        
        return self.dateByAddingTimeInterval(toLastMonday)
    }
    
    public func nextMonday() -> NSDate
    {
        let daysUntil: Double
        
        switch(self.weekday)
        {
            case .Sunday:
                daysUntil = 1
                
            case .Saturday:
                daysUntil = 2
                
            default:
                daysUntil = Double(8 - self.weekday.rawValue)
        }
        
        let toNextMonday = 24 * 60 * 60 * daysUntil
        
        return self.dateByAddingTimeInterval(toNextMonday)
    }
    
    public func roosterMonday() -> NSDate
    {
        switch(self.weekday)
        {
            case .Saturday, .Sunday:
                return self.nextMonday()
                
            case .Monday, .Tuesday, .Wednesday, .Thursday, .Friday:
                return self.lastMonday()
        }
    }
    
    public func isDay(day: Weekday) -> Bool
    {
        if self.weekday == day
        {
            return true
        }
        
        return false
    }
}

public enum Weekday: Int
{
    case Sunday = 1
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}