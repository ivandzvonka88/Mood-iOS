//
//  DateTimeHelper.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class DateTimeHelper
{
    static let sharedInstance = DateTimeHelper() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    var defaultDateFormatter = DateFormatter()
    
    // MARK: - Time Zone Types
    enum TimeZoneType : Int
    {
        case Local
        case UTC
    }
    
    func convertStringIntoDate(dateString:String) -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Globals.shared.DateFormate__yyyy_MM_dd //Your date format
        //        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        let date = dateFormatter.date(from: dateString) //according to date format your date string
        print(date ?? "") //Convert String to Date
        
        return date
    }
    
    func GetDateFromString(DateStr: String)-> Date
    {
        let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let DateArray = DateStr.components(separatedBy: "-")
        let components = NSDateComponents()
        components.year = Int(DateArray[0])!
        components.month = Int(DateArray[1])!
        components.day = Int(DateArray[2])!
        components.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = calendar?.date(from: components as DateComponents)
        
        return date!
    }
    
    func getCurrentDateString(withFormate formatString: String?, inTimeZone timeZoneType: TimeZoneType) -> String?
    {
        let currentDate = Date()
        let dateFormatter: DateFormatter? = self.defaultDateFormatter
        dateFormatter?.dateStyle = .full
        dateFormatter?.timeStyle = .full
        var timeZone: NSTimeZone? = nil
        if timeZoneType == .Local
        {
            timeZone = NSTimeZone.system as NSTimeZone
        } else if timeZoneType == .UTC
        {
            timeZone = NSTimeZone(abbreviation: "UTC")
        }
        
        if let aZone = timeZone
        {
            dateFormatter?.timeZone = aZone as TimeZone
        }
        
        dateFormatter?.locale = NSLocale.autoupdatingCurrent
        if ValidationHelper.isStringEmpty(formatString)
        {
            dateFormatter?.dateFormat = "yyyy-MM-dd"
        }
        else
        {
            dateFormatter?.dateFormat = formatString ?? ""
        }
        
        let DateString = dateFormatter?.string(from: currentDate)
        return DateString
    }
    
    
    func getCurrentTimeString(withFormate formatString: String?, inTimeZone timeZoneType: TimeZoneType) -> String?
    {
        let currentDate = Date()
        let dateFormatter: DateFormatter? = self.defaultDateFormatter
        dateFormatter?.dateStyle = .full
        dateFormatter?.timeStyle = .full
        var timeZone: NSTimeZone? = nil
        
        if timeZoneType == .Local
        {
            timeZone = NSTimeZone.system as NSTimeZone
        }
        else if timeZoneType == .UTC
        {
            timeZone = NSTimeZone(abbreviation: "UTC")
        }
        
        if let aZone = timeZone
        {
            dateFormatter?.timeZone = aZone as TimeZone
        }
        
        dateFormatter?.locale = NSLocale.autoupdatingCurrent
        if ValidationHelper.isStringEmpty(formatString)
        {
            dateFormatter?.dateFormat = "HH:mm:ss"
        }
        else
        {
            dateFormatter?.dateFormat = formatString ?? ""
        }
        
        let DateString = dateFormatter?.string(from: currentDate)
        return DateString
        
    }
    
    
    func getCurrentDateAndTimeString(withFormate formatString: String?, inTimeZone timeZoneType: TimeZoneType) -> String?
    {
        let currentDate = Date()
        let dateFormatter: DateFormatter? = self.defaultDateFormatter
        dateFormatter?.dateStyle = .full
        dateFormatter?.timeStyle = .full
        var timeZone: NSTimeZone? = nil
        
        if timeZoneType == .Local
        {
            timeZone = NSTimeZone.system as NSTimeZone
        }
        else if timeZoneType == .UTC
        {
            timeZone = NSTimeZone(abbreviation: "UTC")
        }
        
        if let aZone = timeZone
        {
            dateFormatter?.timeZone = aZone as TimeZone
        }
        
        dateFormatter?.locale = NSLocale.autoupdatingCurrent
        if ValidationHelper.isStringEmpty(formatString)
        {
            dateFormatter?.dateFormat = Globals.shared.DateTimeFormate__yyyy_MM_dd_HH_mm_ss
        }
        else
        {
            dateFormatter?.dateFormat = formatString ?? ""
        }
        let DateString = dateFormatter?.string(from: currentDate)
        
        return DateString
    }
    
    func getTimeString(fromDateTime dateTimeString: String?) -> String?
    {
        var timeStr = ""
        let array = dateTimeString?.components(separatedBy: " ")
        if (array?.count ?? 0) > 1
        {
            timeStr = array?[1] ?? ""
        }
        
        return timeStr
    }
    
    func getDateString(fromDateTime dateTimeString: String?) -> String?
    {
        var dateStr = ""
        let array = dateTimeString?.components(separatedBy: " ")
        if (array?.count ?? 0) > 0
        {
            dateStr = array?[0] ?? ""
        }
        
        return dateStr
    }
    
    
    //MARK: - Convert Date Time Methods
    func convertStringToDateObject(dateString: String?, withDateFormate dateFormate: String?, inTimeZone timeZoneType: TimeZoneType) -> Date?
    {
        if ValidationHelper.isStringEmpty(dateString)
        {
            return nil
        }
        
        var dateFormatter: DateFormatter? = self.defaultDateFormatter
        //        [dateFormatter setDateStyle:NSDateFormatterFullStyle];
        //        [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
        dateFormatter?.dateFormat = dateFormate ?? ""
        var timeZone: NSTimeZone? = nil
        if timeZoneType == .Local
        {
            timeZone = NSTimeZone.system as NSTimeZone
        }
        else if timeZoneType == .UTC
        {
            timeZone = NSTimeZone(abbreviation: "UTC")
        }
        
        if let aZone = timeZone
        {
            dateFormatter?.timeZone = aZone as TimeZone
        }
        
        dateFormatter?.locale = NSLocale.autoupdatingCurrent
        let dateFromString: Date? = dateFormatter?.date(from: dateString ?? "")
        if dateFromString == nil
        {
            print("convertStringToDateObject = nil")
        }
        
        dateFormatter = nil
        if dateFromString == nil
        {
            print("[ERROR]")
        }
        
        return dateFromString
    }
    
    
    func convertDateObjectToString(dateObject: Date?, withDateFormate dateFormate: String?, inTimeZone timeZoneType: TimeZoneType) -> String?
    {
        if dateObject == nil
        {
            return nil
        }
        
        var dateFormatter: DateFormatter? = self.defaultDateFormatter
        //        [dateFormatter setDateStyle:NSDateFormatterFullStyle];
        //        [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
        dateFormatter?.dateFormat = dateFormate ?? ""
        
        var timeZone: NSTimeZone? = nil
        if timeZoneType == .Local
        {
            timeZone = NSTimeZone.system as NSTimeZone
        }
        else if timeZoneType == .UTC
        {
            timeZone = NSTimeZone(abbreviation: "UTC")
        }
        
        if let aZone = timeZone
        {
            dateFormatter?.timeZone = aZone as TimeZone
        }
        dateFormatter?.locale = NSLocale.autoupdatingCurrent
        var strDate: String? = nil
        if let anObject = dateObject
        {
            strDate = dateFormatter?.string(from: anObject)
        }
        dateFormatter = nil
        
        return strDate
    }
    
    
    //MARK: - get Date by Offsets
    func getDateBySubtractingYears(_ years: Int, from dateObj: Date?) -> Date?
    {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var addComponents = DateComponents()
        addComponents.year = addComponents.year! - years
        if let anObj = dateObj
        {
            return calendar.date(byAdding: addComponents, to: anObj, wrappingComponents: false)
        }
        
        return nil
    }
    
    func getDateByAddingMinutes(_ minutes: Int, in dateObj: Date?) -> Date?
    {
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var addComponents = DateComponents()
        addComponents.minute = addComponents.minute! + minutes
        
        if let anObj = dateObj
        {
            return calendar.date(byAdding: addComponents, to: anObj, wrappingComponents: false)
        }
        
        return nil
    }
    
    
    //MARK: - Convert Date (Unix TimeStamp)
    func getUnixTimeStringInMilliSeconds(for dateObj: Date?) -> String?
    {
        let secondsFromDate = Int64((dateObj?.timeIntervalSince1970)! * 1000.0)
        let unixTimeStringInMilliSeconds = String(format: "%lld", secondsFromDate)
        
        return unixTimeStringInMilliSeconds
    }
    
    
    func getDateObject(fromTheUnixTimestampString unixTimeStampString: String?) -> Date?
    {
        let unixTimeStampInterval = TimeInterval(Int64(unixTimeStampString ?? "") ?? 0)
        let unixTimeStampDate = Date(timeIntervalSince1970: unixTimeStampInterval)
        
        return unixTimeStampDate
    }
    
    
    
    //MARK: - Time Zones
    func getAllAvailableTimeZones() -> [Any]?
    {
        let timezoneNames = NSTimeZone.knownTimeZoneNames
        let timezonesMutable = [AnyHashable](repeating: 0, count: timezoneNames.count)
        
        //        timezonesMutable = timezonesMutable.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.OrderedAscending }
        
        return timezonesMutable
    }
    
    func getTheDeviceLocalTimeZone() -> String?
    {
        let timeZoneObj = NSTimeZone.local as NSTimeZone
        let timeZoneStr = timeZoneObj.name
        
        return timeZoneStr
    }
    
}
