//
//  Extensions.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit
import PhoneNumberKit
class Extensions: NSObject {

}
typealias Rational = (num : Int, den : Int)

protocol ObjectSavable {
  func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
  func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
extension UserDefaults: ObjectSavable {
  func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
    let encoder = JSONEncoder()
    do {
      let data = try encoder.encode(object)
      set(data, forKey: forKey)
    } catch {
      throw ObjectSavableError.unableToEncode
    }
  }
  func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
    guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
    let decoder = JSONDecoder()
    do {
      let object = try decoder.decode(type, from: data)
      return object
    } catch {
      throw ObjectSavableError.unableToDecode
    }
  }
}
enum ObjectSavableError: String, LocalizedError {
  case unableToEncode = "Unable to encode object into data"
  case noValue = "No data object found for the given key"
  case unableToDecode = "Unable to decode object into given type"
  var errorDescription: String? {
    rawValue
  }
}

extension String {
    
    func getHoursFromString() -> String{
        
        let inFormatter = DateFormatter()
        inFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        inFormatter.locale = Locale(identifier: "fr-CA")
        inFormatter.timeZone = TimeZone(abbreviation: "EDT")
        
        let inFormatter1 = DateFormatter()
        inFormatter1.setLocalizedDateFormatFromTemplate("H:mm:ss")
        inFormatter1.locale = Locale(identifier: "fr-CA")
        inFormatter1.timeZone = TimeZone(abbreviation: "EDT")
        

        let outFormatter = DateFormatter()
        
        outFormatter.setLocalizedDateFormatFromTemplate("hh:mm a")
        //outFormatter.locale = Locale(identifier: "fr-CA")
        //outFormatter.timeZone = TimeZone(abbreviation: "EDT")
        outFormatter.amSymbol = "AM"
        outFormatter.pmSymbol = "PM"
        
        
        if let time = Double.init(self) {
            
            if Date(timeIntervalSince1970: time) != nil{
            
                let date = Date(timeIntervalSince1970: time)
                let out = outFormatter.string(from: date)
                return out
                
            }
            else{
            
                return ""
            }
        }
        else{
            return ""
        }

//        if let date = inFormatter.date(from: self){
//            let out = outFormatter.string(from: date)
//            return out
//        }
//        else if let date = inFormatter1.date(from: self){
//            let out = outFormatter.string(from: date)
//            return out
//        }
//        else{
//            return ""
//        }
        
        
    }
    func getTimeFromString() -> String{
        let inFormatter = DateFormatter()
        inFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        inFormatter.locale = Locale(identifier: "fr-CA")
        inFormatter.timeZone = TimeZone(abbreviation: "EDT")
        
        let inFormatter1 = DateFormatter()
        inFormatter1.setLocalizedDateFormatFromTemplate("H:mm:ss")
        inFormatter1.locale = Locale(identifier: "fr-CA")
        inFormatter1.timeZone = TimeZone(abbreviation: "EDT")
        

        let outFormatter = DateFormatter()
        
        outFormatter.setLocalizedDateFormatFromTemplate("hh:mm a")
        outFormatter.locale = Locale(identifier: "fr-CA")
        outFormatter.timeZone = TimeZone(abbreviation: "EDT")
        outFormatter.amSymbol = "AM"
        outFormatter.pmSymbol = "PM"
        
        
        

        if let date = inFormatter.date(from: self){
            let out = outFormatter.string(from: date)
            return out
        }
        else if let date = inFormatter1.date(from: self){
            let out = outFormatter.string(from: date)
            return out
        }
        else{
            return ""
        }
        
        
    }
    
    func getDateFromString() -> String{
        let inFormatter = DateFormatter()
        inFormatter.dateFormat = "yyyy-MM-dd"
        
        let inFormatter1 = DateFormatter()
        inFormatter1.dateFormat = "yyyy-MM-dd"

        let outFormatter = DateFormatter()
        outFormatter.dateFormat = "dd MMM"

        if let date = inFormatter.date(from: self){
            let out = outFormatter.string(from: date)
            return out
        }
        else if let date = inFormatter.date(from: self){
            let out = outFormatter.string(from: date)
            return out
        }
        else{
            return ""
        }
        
        
    }
    func getDateTimeFromString() -> String{
        let inFormatter = DateFormatter()
        inFormatter.dateFormat = "yyyy-MM-dd hh:MM:ss"
        
        let inFormatter1 = DateFormatter()
        inFormatter1.dateFormat = "yyyy-MM-dd h:MM:ss"

        let outFormatter = DateFormatter()
        outFormatter.dateFormat = "dd MMM, HH:mm"

        if let date = inFormatter.date(from: self){
            let out = outFormatter.string(from: date)
            return out
        }
        else if let date = inFormatter.date(from: self){
            let out = outFormatter.string(from: date)
            return out
        }
        else{
            return ""
        }
        
        
    }
    func isTimeGreater()->Bool{
        let inFormatter = DateFormatter()
        inFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        //inFormatter.locale = Locale(identifier: "fr-CA")
        //inFormatter.timeZone = TimeZone(abbreviation: "EDT")
        
        let inFormatter1 = DateFormatter()
        inFormatter1.setLocalizedDateFormatFromTemplate("H:mm:ss")
        inFormatter1.locale = Locale(identifier: "fr-CA")
        inFormatter1.timeZone = TimeZone(abbreviation: "EDT")
        
        let curentDate = Date()
    
        if let time = Double.init(self) {
            if Date(timeIntervalSince1970: time) != nil{
                let date = Date(timeIntervalSince1970: time)
                if date > curentDate{
                    return true
                }
                else{
                    return false
                }
            }
            else{
                return false
            }
        }
        else{
            return false
        }
//        if let date = inFormatter.date(from: self){
//            let datestr = inFormatter.string(from: curentDate)
//            if let finaldate = inFormatter.date(from: datestr){
//                if date > finaldate{
//                    return true
//                }
//                else{
//                    return false
//                }
//            }
//            else{
//                return false
//            }
//
//
//        }
//        else{
//            return false
//        }
    }
    func isTimeLess()->Bool{
        let inFormatter = DateFormatter()
        inFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        inFormatter.locale = Locale(identifier: "fr-CA")
        inFormatter.timeZone = TimeZone(abbreviation: "EDT")
        
        let inFormatter1 = DateFormatter()
        inFormatter1.setLocalizedDateFormatFromTemplate("H:mm:ss")
        inFormatter1.locale = Locale(identifier: "fr-CA")
        inFormatter1.timeZone = TimeZone(abbreviation: "EDT")
        
        let curentDate = Date()
    
        if let time = Double.init(self) {
            if Date(timeIntervalSince1970: time) != nil{
                let date = Date(timeIntervalSince1970: time)
                if date < curentDate{
                    return true
                }
                else{
                    return false
                }
            }
            else{
                return false
            }
        }
        else{
            return false
        }
        
//        if let date = inFormatter.date(from: self){
//            let datestr = inFormatter.string(from: curentDate)
//            if let finaldate = inFormatter.date(from: datestr){
//                if date < finaldate{
//                    return true
//                }
//                else{
//                    return false
//                }
//            }
//            else{
//                return false
//            }
//
//
//        }
//        else{
//            return false
//        }
    }
    func isTimeEqual()->Bool{
        let inFormatter = DateFormatter()
        inFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        //inFormatter.locale = Locale(identifier: "fr-CA")
        //inFormatter.timeZone = TimeZone(abbreviation: "EDT")
        
        let inFormatter1 = DateFormatter()
        inFormatter1.setLocalizedDateFormatFromTemplate("H:mm:ss")
        inFormatter1.locale = Locale(identifier: "fr-CA")
        inFormatter1.timeZone = TimeZone(abbreviation: "EDT")
        
        let curentDate = Date()
    
        if let time = Double.init(self) {
            if Date(timeIntervalSince1970: time) != nil{
                let date = Date(timeIntervalSince1970: time)
                if date == curentDate{
                    return true
                }
                else{
                    return false
                }
            }
            else{
                return false
            }
        }
        else{
            return false
        }
//        if let date = inFormatter.date(from: self){
//            let datestr = inFormatter.string(from: curentDate)
//            if let finaldate = inFormatter.date(from: datestr){
//                if date == finaldate{
//                    return true
//                }
//                else{
//                    return false
//                }
//            }
//            else{
//                return false
//            }
//
//
//        }
//        else{
//            return false
//        }
    }
    func getTime()->Date?{
        let inFormatter = DateFormatter()
        inFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        inFormatter.locale = Locale(identifier: "fr-CA")
        inFormatter.timeZone = TimeZone(abbreviation: "EDT")
        
        if let time = Double.init(self) {
            if Date(timeIntervalSince1970: time) != nil{
                let date = Date(timeIntervalSince1970: time)
                return date
            }
            else{
                return nil
            }
        }
        else{
            return nil
        }
        
//        if let date = inFormatter.date(from: self){
//            return date
//            }
//            else{
//                return nil
//            }
    }
    func getDistance() -> Double? {
        let val =  Double(self)!
        return val.rounded(.toNearestOrEven)
    }
    func getCurrentTime()->Date?{
        let inFormatter = DateFormatter()
        inFormatter.setLocalizedDateFormatFromTemplate("HH:mm:ss")
        inFormatter.locale = Locale(identifier: "fr-CA")
        inFormatter.timeZone = TimeZone(abbreviation: "EDT")
        
        let curentDate = Date()
        let datestr = inFormatter.string(from: curentDate)
        if let finaldate = inFormatter.date(from: datestr){
            return finaldate
        }
        else{
            return nil
        }
    }
    func containsOnlyDigits() -> Bool
    {

        let notDigits = NSCharacterSet.decimalDigits.inverted

        if rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
        {
            return true
        }

        return false
    }
    func localized() ->String
    {
        let currentSelectedLang:String? = LanguageHelper.sharedInstance.getCurrentSelectedLanguage()
        guard let currentLang:String = currentSelectedLang else
        {
            fatalError("Current Language cannot be nil")
        }
        
        var lang:String = Globals.shared.kApplicationLanguage_English
        if(currentLang == Globals.shared.kAppCurrentLanguage__Urdu)
        {
            lang = Globals.shared.kApplicationLanguage_urdu
        }
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    func suffixNumber() -> String {
        
        var num:Double = Double(self)!;
        let sign = ((num < 0) ? "-" : "" );
        
        num = fabs(num);
        
        if (num < 1000.0){
            return "\(sign)\(num)";
        }
        
        let exp:Int = Int(log10(num) / 3.0 ); //log10(1000));
        
        let units:[String] = ["K","M","B"];
        
        let roundedNum:Double = round(10 * num / pow(1000.0,Double(exp))) / 10;
        
        return "\(sign)\(roundedNum)\(units[exp-1])";
    }
    func isValidPhone() -> Bool {
        let phonekit = PhoneNumberKit()
        do{
            _ = try phonekit.parse(self)
            _ = phonekit.allCountries()
            return true
        }
        catch{
            print("error parsing")
            return false
        }
        
    }
    func isValidPhone1() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^([0-9]( |-)?)?(\\(?[0-9]{3}\\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$", options: .caseInsensitive)
            let range = NSMakeRange(0, self.count)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range:range) != nil
        } catch{return false}
    }
    func isValidEmail() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            let range = NSMakeRange(0, self.count)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range:range) != nil
        } catch{return false}
    }
    func isValidSSN() -> Bool {
      let ssnRegext = "^(?!(000|666|9))\\d{3}-(?!00)\\d{2}-(?!0000)\\d{4}$"
      return self.range(of: ssnRegext, options: .regularExpression, range: nil, locale: nil) != nil
    }
    func isValidPassword() -> Bool{
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
        
    }
    func isEmail(_ text:String?) -> Bool
    {
        let EMAIL_REGEX = "^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", EMAIL_REGEX)
        return predicate.evaluate(with: text)
    }
    
    

    func validateChar(_ input: String) -> Bool {
        var allowed = CharacterSet()
        allowed.formUnion(.decimalDigits)
        allowed.insert(charactersIn: "-")
        return input.unicodeScalars.allSatisfy { allowed.contains($0) }
    }
    func insertCharSNN() -> String{
        var str = ""
        for (i,char) in self.enumerated(){
            if i == 3 || i == 5{
                str.append("-")
                str.append(char)
            }
            else{
                str.append(char)
            }
            
        }
        return str
    }
    func capitalizingFirstLetter() -> String {
        let first = String(prefix(1)).uppercased()
        let other = String(dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func monthFullNameToInt() -> Int {
        
        switch self {
        case "January":
            return 1
        case "February":
            return 2
        case "March":
            return 3
        case "April":
            return 4
        case "May":
            return 5
        case "June":
            return 6
        case "July":
            return 7
        case "August":
            return 8
        case "September":
            return 9
        case "October":
            return 10
        case "November":
            return 11
        case "December":
            return 12
        default:
            return 13
        }
    }
    
    func monthFullNameTo() -> String {
        
        switch self {
        case "January":
            return "1"
        case "February":
            return "2"
        case "March":
            return "3"
        case "April":
            return "4"
        case "May":
            return "5"
        case "June":
            return "6"
        case "July":
            return "7"
        case "August":
            return "8"
        case "September":
            return "9"
        case "October":
            return "10"
        case "November":
            return "11"
        case "December":
            return "12"
        default:
            return "13"
        }
    }
    
}

extension URL {
    
    func isEmpty(_ text:String?) -> Bool
    {
        if text == nil {return true}
        
        if text!.isEmpty == true {return true}
        
        //    if text?.lowercaseString == "null" {return true}
        
        return false
        
    }
    
    func isURLValid(_ urlString:String?) -> Bool
    {
        if isEmpty(urlString) {return false}
        
        let url =  URL(string: urlString!)
        if url == nil {return false}
        
        
        let request = URLRequest(url: url!)
        return NSURLConnection.canHandle(request)
        
    }
}

extension Date {
    
    var day:Int {
        get {
            return (Calendar.current as NSCalendar).components([.day], from: self).day!
        }
    }
    
    var weekDay:String {
        get {
            let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekday! {
            case 1:
                return "SUN"
            case 2:
                return "MON"
            case 3:
                return "TUE"
            case 4:
                return "WED"
            case 5:
                return "THU"
            case 6:
                return "FRI"
            case 7:
                return "SAT"
            default:
                return ""
            }
        }
    }
    
    var weekDayIndex:Int {
        get {
            let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekday! {
            case 1:
                return 6
            case 2:
                return 0
            case 3:
                return 1
            case 4:
                return 2
            case 5:
                return 3
            case 6:
                return 4
            case 7:
                return 5
            default:
                return 0
            }
        }
    }
    
    var weekDayWithTwoWords:String {
        get {
            let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekday! {
            case 1:
                return "Su"
            case 2:
                return "Mo"
            case 3:
                return "Tu"
            case 4:
                return "We"
            case 5:
                return "Th"
            case 6:
                return "Fr"
            case 7:
                return "Sa"
            default:
                return ""
            }
        }
    }
    
    var weekDayWithThreeWords:String {
        get {
            let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekday! {
            case 1:
                return "Sun"
            case 2:
                return "Mon"
            case 3:
                return "Tue"
            case 4:
                return "Wed"
            case 5:
                return "Thu"
            case 6:
                return "Fri"
            case 7:
                return "Sat"
            default:
                return ""
            }
        }
    }
    
    var weekFullDay:String {
        get {
            let weekFullDay = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekFullDay! {
            case 1:
                return "Sunday"
            case 2:
                return "Monday"
            case 3:
                return "Tuesday"
            case 4:
                return "Wednesday"
            case 5:
                return "Thursday"
            case 6:
                return "Friday"
            case 7:
                return "Saturday"
            default:
                return ""
            }
        }
    }
    
    var monthThreeWordsName: String {
        get {
            let nameInt = (Calendar.current as NSCalendar).components([.month], from: self).month
            switch nameInt! {
            case 1:
                return "Jan"
            case 2:
                return "Feb"
            case 3:
                return "Mar"
            case 4:
                return "Apr"
            case 5:
                return "May"
            case 6:
                return "Jun"
            case 7:
                return "Jul"
            case 8:
                return "Aug"
            case 9:
                return "Sep"
            case 10:
                return "Oct"
            case 11:
                return "Nov"
            case 12:
                return "Dec"
                
            default:
                return ""
            }
        }
    }
    
    var monthFullName: String {
        get {
            let nameInt = (Calendar.current as NSCalendar).components([.month], from: self).month
            switch nameInt! {
            case 1:
                return "January"
            case 2:
                return "February"
            case 3:
                return "March"
            case 4:
                return "April"
            case 5:
                return "May"
            case 6:
                return "June"
            case 7:
                return "July"
            case 8:
                return "August"
            case 9:
                return "September"
            case 10:
                return "October"
            case 11:
                return "November"
            case 12:
                return "December"
                
            default:
                return ""
            }
        }
    }
    
    var getMonth: Int {
        return (Calendar.current as NSCalendar).components([.month], from: self).month!
    }
    
    var dateDayOfMonth: String? {
        get {
            let dateDay = (Calendar.current as NSCalendar).components([.day], from: self).day!
            return String(describing: dateDay)
        }
    }
    
    var year:Int {
        get {
            return (Calendar.current as NSCalendar).components([.year], from: self).year!
        }
    }
    
    // you can create a read-only computed property to return just the nanoseconds as Int
    var nanosecond: Int { return Calendar.current.component(.nanosecond,  from: self)}
    var milisecond: Double { return Double(self.timeIntervalSince1970 * 1000)}
    // or an extension function to format your date
    func formattedWith(_ format:String)-> String {
        let formatter = DateFormatter()
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)  // you can set GMT time
        formatter.timeZone = NSTimeZone.local        // or as local time
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func underAge()-> Bool {
        let date = Calendar.current.date(byAdding: .year, value: -18, to: Date())
        if self < date!{
           return true
        }
        else{
            return false
        }
        
    }
    //Replica
    func formattedWithString(_ format:String)-> String {
        let formatter = DateFormatter()
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)  // you can set GMT time
        formatter.timeZone = NSTimeZone.local        // or as local time
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    //12:18 PM
    static func timeStringFromUnixTime(_ unixTime: Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    static func dayStringFromTime(_ unixTime: Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.dateFormat = "dd-MMMM"
        return dateFormatter.string(from: date)
    }
    
    //2016-19-18 12:18 PM
    static func timeAndDateFromUnix(_ unixTime:Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "yyyy-dd-MM hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    static func yearFromUnixTime(_ unixTime:Double) -> Date {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "MM dd yyyy"
        let string = dateFormatter.string(from: date)
        return dateFormatter.date(from: string)!
    }
    
    static func yearStringFromUnixTime(_ unixTime:Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
        //        return dateFormatter.dateFromString(string)!
    }
    
    static func dateFromStrings(_ stringDate:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm:ss a"
        //        dateFormatter.dateFormat = "hh:mm:ss a"
        //        dateFormatter.dateStyle = .NoStyle
        //        dateFormatter.timeStyle = .ShortStyle
        let date = dateFormatter.date(from: stringDate)
        return date!
    }
    
    static func dateFromStringConvertToString(_ stringDate: String) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: stringDate)
        dateFormatter.dateFormat =  "hh:mm a"
        let  newTime =  dateFormatter.string(from: date!)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: date!)
        return newDate + " " + newTime
    }
    
    //    static func date(withFormat format: String, dateString: String) -> Date? {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = format
    //        let newDate = dateFormatter.date(from: dateString)
    //        return newDate
    //    }
    
    static func date(withFormat format: String, dateString: String) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let newDate = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = format
        let newDate1 = dateFormatter.string(from: newDate!)
        return newDate1
    }
    
    static func date(fromString: String) -> Date?  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let newDate = dateFormatter.date(from: fromString)
        return newDate
    }
    
    static func date2(fromString: String) -> Date?  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.date(from: fromString)
        return newDate
    }
    static func getTodayDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: Date())
        return newDate
    }
    static func getTodayTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let newDate = dateFormatter.string(from: Date())
        return newDate
    }
    static func getTodayNameString(str:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.date(from: str)
        let strng = newDate!.weekFullDay
        return strng
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: .distantFuture)!
    }
    static func getTommorowDateString() -> String {
        
        var tomorrow:  Date { return Date().dayAfter }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: tomorrow)
        return newDate
    }
    static func getTommorowTimeString() -> String {
        
        var tomorrow:  Date { return Date().dayAfter }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:MM:ss a"
        let newDate = dateFormatter.string(from: tomorrow)
        return newDate
    }
    
    
    //    static func date(withFormat format: String, date: Date) -> Date? {
    //        let dateString = String(describing: date)
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
    //        let newDate = dateFormatter.date(from: dateString)
    //        dateFormatter.dateFormat = format
    //        let newDate1 = dateFormatter.string(from: date)
    //        return newDate1
    //    }
    
    static func date(withFormat format: String, date: Date) -> String  {
        let dateString = String(describing: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = format
        let newDate = dateFormatter.string(from: date!)
        return newDate
    }
    
    static func dateFromStringConvertToStringInTuple(_ stringDate: String) -> (newDate:String,newTime:String)  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date = dateFormatter.date(from: stringDate)
        dateFormatter.dateFormat =  "hh:mm a"
        let  newTime =  dateFormatter.string(from: date!)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: date!)
        return (newDate,newTime)
    }
    
    static func checkDate(_ date: Date) -> String {
        var returnedDate = ""
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            returnedDate = "Today"
        } else if calendar.isDateInYesterday(date) {
            returnedDate = "Yesterday"
        }
        else if calendar.isDateInTomorrow(date){
            returnedDate = "Tommorow"
        }
        else {
            returnedDate = "None"
        }
        return returnedDate
    }
    
    static func dateFromStringConvertToDate(_ stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.date(from: stringDate)
        return newDate!
    }
    
    func lastDayOfMonth() -> (Date,Int)
    {
        let calendar = Calendar.current
        let now = self
        var components = calendar.dateComponents([.year, .month, .day], from: now)
        let range = calendar.range(of: .day, in: .month, for: now)!
        //        return range.upperBound - 1
        components.day = range.upperBound - 1
        return (calendar.date(from: components)!, range.upperBound - 1)
    }
    
    func lowerDate(limit: Int = -5) -> Date
    {
        return Calendar.current.date(byAdding: .day, value: limit, to: self)!
    }
    
    func upperDate(limit: Int = 5) -> Date
    {
        return Calendar.current.date(byAdding: .day, value: limit, to: self)!
    }
    
    /// Returns a Date with the specified days added to the one it is called with
    func add(days: Int = 0) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    /// Returns a Date with the specified days subtracted from the one it is called with
    func subtract(days: Int = 0) -> Date {
        let inverseDays = -1 * days
        return add(days: inverseDays)
    }
    
    func hour() -> Int
    {
        //Get Hour
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        
        //Return Hour
        return hour
    }
    
    
    func minute() -> Int
    {
        //Get Minute
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: self)
        
        //Return Minute
        return minute
    }
    
    func toShortTimeString() -> String
    {
        //Get Short Time String
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let timeString = formatter.string(from:self)
        
        //Return Short Time String
        return timeString
    }
}
extension Float {
    func getFullTime() -> String{
        let val = Int(self)
        if val == 23{
           return "\(val):50:00"
        }
        else{
           return "\(val):00:00"
        }
    }
    var round: String {
        return String(format: "%.1f", self)
    }
    var string2: String {
        return String(format: "%.2f", self)
    }
}

extension Double {
    
    /**
     Rounds the double to decimal places value
     */
    
    
    mutating func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
    mutating func calculatePercentage(percentageVal:Double)->Double{
        var val = self * percentageVal
        val = val/100.0
        
        return val
    }
    mutating func calculateServiceChargePercentage(percentageVal:Double)->Double{
        var val = self * percentageVal
        val = val/100.0
        
        return val
    }
}
extension Double{
    func getDateTimeFromString() -> String{

        let outFormatter = DateFormatter()
        outFormatter.dateFormat = "dd MMM yyyy, hh:mm a"
        let date = Date(timeIntervalSince1970: self)
        let outDate = outFormatter.string(from: date)
        return outDate
        
    }
}
extension Int64{
    func dollerToSilla() -> Int64{
        if self == 0{
            return 0
        }
        else{
            return self*100
        }
        
    }
    func sillaToDoller() -> Int64{
        if self == 0{
            return 0
        }
        else{
            return self/100
        }
    }
}
extension CALayer {
    
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
}

func *=(left:CGSize, right:CGFloat) -> CGSize {
    return CGSize(width: left.width * right, height: left.height * right)
}
enum GradientDirection {
    case topBottom, leftRight, rightLeft
}
extension UIDevice {
    func getDeviceModel() -> String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        switch identifier {
        // iPhones
        case "iPhone1,1":
            return "iPhone 2G (A1203)"
        case "iPhone1,2":
            return "iPhone 3G (A1241/A1324)"
        case "iPhone2,1":
            return "iPhone 3GS (A1303/A1325)"
        case "iPhone3,1":
            return "iPhone 4 (A1332)"
        case "iPhone3,2":
            return "iPhone 4 (A1332)"
        case "iPhone3,3":
            return "iPhone 4 (A1349)"
        case "iPhone4,1":
            return "iPhone 4S (A1387/A1431)"
        case "iPhone5,1":
            return "iPhone 5 (A1428)"
        case "iPhone5,2":
            return "iPhone 5 (A1429/A1442)"
        case "iPhone5,3":
            return "iPhone 5C (A1456/A1532)"
        case "iPhone5,4":
            return "iPhone 5C (A1507/A1516/A1526/A1529)"
        case "iPhone6,1":
            return "iPhone 5C (A1453/A1533)"
        case "iPhone6,2":
            return "iPhone 5S (A1457/A1518/A1528/A1530)"
        case "iPhone7,1":
            return "iPhone 6 Plus (A1522/A1524)"
        case "iPhone7,2":
            return "iPhone 6 (A1549/A1586)"
        case "iPhone8,1":
            return "iPhone 6s"
        case "iPhone8,2":
            return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":
            return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":
            return "iPhone 7 Plus"
        case "iPhone8,4":
            return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":
            return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":
            return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":
            return "iPhone X"
            
        // iPods
        case "iPod1,1":
            return "iPod Touch 1G (A1213)"
        case "iPod2,1":
            return "iPod Touch 2G (A1288)"
        case "iPod3,1":
            return "iPod Touch 3G (A1318)"
        case "iPod4,1":
            return "iPod Touch 4G (A1367)"
        case "iPod5,1":
            return "iPod Touch 5G (A1421/A1509)"
            
        // iPads
        case "iPad1,1":
            return "iPad 1G (A1219/A1337)"
        case "iPad2,1":
            return "iPad 2 (A1395)"
        case "iPad2,2":
            return "iPad 2 (A1396)"
        case "iPad2,3":
            return "iPad 2 (A1397)"
        case "iPad2,4":
            return "iPad 2 (A1395+New Chip)"
        case "iPad2,5":
            return "iPad Mini 1G (A1432)"
        case "iPad2,6":
            return "iPad Mini 1G (A1454)"
        case "iPad2,7":
            return "iPad Mini 1G (A1455)"
        case "iPad3,1":
            return "iPad 3 (A1416)"
        case "iPad3,2":
            return "iPad 3 (A1403)"
        case "iPad3,3":
            return "iPad 3 (A1430)"
        case "iPad3,4":
            return "iPad 4 (A1458)"
        case "iPad3,5":
            return "iPad 4 (A1459)"
        case "iPad3,6":
            return "iPad 4 (A1460)"
        case "iPad4,1":
            return "iPad Air (A1474)"
        case "iPad4,2":
            return "iPad Air (A1475)"
        case "iPad4,3":
            return "iPad Air (A1476)"
        case "iPad4,4":
            return "iPad Mini 2G (A1489)"
        case "iPad4,5":
            return "iPad Mini 2G (A1490)"
        case "iPad4,6":
            return "iPad Mini 2G (A1491)"
            
        // Simulators
        case "i386":
            return "iPhone Simulator 32Bit"
        case "x86_64":
            return "iPhone Simulator 64Bit"
            
        // Default
        default:
            return "watting to update"
        }
        
    }
    
    func getDeviceTypeOn456() -> Int {
        switch getDeviceModel() {
        case "iPhone 4 (A1332)", "iPhone 4 (A1349)", "iPhone 4S (A1387/A1431)":
            return 4
        case "iPhone 5 (A1428)", "iPhone 5 (A1429/A1442)", "iPhone 5C (A1456/A1532)", "iPhone 5C (A1507/A1516/A1526/A1529)",
             "iPhone 5C (A1453/A1533)", "iPhone 5S (A1457/A1518/A1528/A1530)":
            return 5
        case "iPhone 6 Plus (A1522/A1524)", "iPhone 6 (A1549/A1586)":
            return 6
        default:
            return 4
        }
    }
    
    func getSystemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getIdfv() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
}

//MARK:- UIColor Extension
extension UIColor {
    enum assetColors:String {
        case alertColor
        case bgColor
        case greenback
        case lightblack
        case pinkColor
        case textColor
        case text1Color
        case tabbar
        case yellowColor
        case white1Color
        
    }
    /**
     To get UIColor from hex string.
     - parameter hex: Hex value of color code.
     */
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func colorsFromAsset(name: assetColors) -> UIColor{
        switch name {
        case .alertColor:
            return UIColor(named: name.rawValue)!
        case .bgColor:
            return UIColor(named: name.rawValue)!
        case .greenback:
            return UIColor(named: name.rawValue)!
        case .lightblack:
            return UIColor(named: name.rawValue)!
        case .textColor:
            return UIColor(named: name.rawValue)!
        case .text1Color:
            return UIColor(named: name.rawValue)!
        case .tabbar:
            return UIColor(named: name.rawValue)!
        case .yellowColor:
            return UIColor(named: name.rawValue)!
        case .pinkColor:
            return UIColor(named: name.rawValue)!
        case .white1Color:
            return UIColor(named: name.rawValue)!
        default:
            return UIColor.white
        
        }
    }
    
    
    
}
public extension Bundle{
    var displayName: String? {
        let name = self.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        debugPrint(name)
        return name
        //return "I Was Framed"
    }
}
public extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}

extension Dictionary {
    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}
extension UIFont{
    static func fractionFont(ofSize pointSize: CGFloat,weight: UIFont.Weight) -> UIFont
    {
        //let systemFontDesc = UIFont(name: "Exo", size: pointSize)?.fontDescriptor
        let systemFontDesc = UIFont.systemFont(ofSize: pointSize, weight: weight).fontDescriptor
        
        let fractionFontDesc = systemFontDesc.addingAttributes(
            [
                UIFontDescriptor.AttributeName.featureSettings: [
                    [
                        UIFontDescriptor.FeatureKey.featureIdentifier: kFractionsType,
                        UIFontDescriptor.FeatureKey.typeIdentifier: kDiagonalFractionsSelector,
                    ], ]
            ] )
        return UIFont(descriptor: fractionFontDesc, size:pointSize)
    }
}

extension UINavigationController {
    func previousViewController(_ index: Int = 0) -> UIViewController? {
        if index > 1{
            return viewControllers[index]
        }
        else{
            return nil
        }
    }
    func popPreviousViewController(_ index: Int = 0){
        if let controller = previousViewController(index){
            popToViewController(controller, animated: true)
        }
        
        
    }
}
extension UIAlertController {
    
    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }
    
    //Set title font and title color
    func setTitle(font: UIFont?, color: UIColor?) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)//1
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : titleFont],//2
                                          range: NSMakeRange(0, title.utf8.count))
        }
        
        if let titleColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor],//3
                                          range: NSMakeRange(0, title.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedTitle")//4
    }
    
    //Set message font and message color
    func setMessage(font: UIFont?, color: UIColor?) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : messageFont],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        
        if let messageColorColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : messageColorColor],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedMessage")
    }
    
    //Set tint color of UIAlertController
    func setTint(color: UIColor) {
        self.view.tintColor = color
    }
}
extension UIAlertAction {
    
    var titleTextColor: UIColor? {
        get {
            return self.value(forKey: "titleTextColor") as? UIColor
        } set {
            self.setValue(newValue, forKey: "titleTextColor")
        }
    }
}

