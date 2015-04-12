//
//  RoosterDatesTests.swift
//  RoosterDatesTests
//
//  Created by Bas Broek on 12/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import UIKit
import XCTest
import RoosterDates

class RoosterDatesTests: XCTestCase
{
    var sunday12April2015: NSDate!
    var monday13April2015: NSDate!
    var tuesday14April2015: NSDate!
    var wednesday15April2015: NSDate!
    var thursday16April2015: NSDate!
    var friday17April2015: NSDate!
    var saturday18April2015: NSDate!
    
    var monday20April2015: NSDate!
    
    let formatter = NSDateFormatter()
    
    override func setUp()
    {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sunday12April2015 = NSDate(timeIntervalSince1970: 1428796800)
        monday13April2015 = NSDate(timeIntervalSince1970: 1428883200)
        tuesday14April2015 = NSDate(timeIntervalSince1970: 1428969600)
        wednesday15April2015 = NSDate(timeIntervalSince1970: 1429056000)
        thursday16April2015 = NSDate(timeIntervalSince1970: 1429142400)
        friday17April2015 = NSDate(timeIntervalSince1970: 1429228800)
        saturday18April2015 = NSDate(timeIntervalSince1970: 1429315200)
        
        monday20April2015 = NSDate(timeIntervalSince1970: 1429488000)
        
        formatter.dateFormat = "EEEE dd-MM-yyyy"
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidDays()
    {
        XCTAssertTrue(sunday12April2015.isDay(.Sunday), "Was not sunday")
        XCTAssertTrue(monday13April2015.isDay(.Monday), "Was not monday")
        XCTAssertTrue(tuesday14April2015.isDay(.Tuesday), "Was not tuesday")
        XCTAssertTrue(wednesday15April2015.isDay(.Wednesday), "Was not wednesday")
        XCTAssertTrue(thursday16April2015.isDay(.Thursday), "Was not thursday")
        XCTAssertTrue(friday17April2015.isDay(.Friday), "Was not friday")
        XCTAssertTrue(saturday18April2015.isDay(.Saturday), "Was not saturday")
        
        XCTAssertTrue(monday20April2015.isDay(.Monday), "Was not monday")
    }
    
    func testRoosterMonday()
    {
        XCTAssertEqual(sunday12April2015.roosterMonday(), monday13April2015, "The roosterMonday was not the 13th")
        
        XCTAssertEqual(monday13April2015.roosterMonday(), monday13April2015, "The roosterMonday was not the 13th")
        
        XCTAssertEqual(tuesday14April2015.roosterMonday(), monday13April2015, "The roosterMonday was not the 13th")
        
        XCTAssertEqual(wednesday15April2015.roosterMonday(), monday13April2015, "The roosterMonday was not the 13th")
        
        XCTAssertEqual(thursday16April2015.roosterMonday(), monday13April2015, "The roosterMonday was not the 13th")
        
        XCTAssertEqual(friday17April2015.roosterMonday(), monday13April2015, "The roosterMonday was not the 13th")
        
        XCTAssertEqual(saturday18April2015.roosterMonday(), monday20April2015, "The roosterMonday was not the 20th")
    }
}