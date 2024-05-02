//
//  Date+Extension.swift
//  ExampleIntro
//
//  Created by Diego on 10/12/23.
//

import Foundation
import UIKit


enum DateFormatIdentifier : String {
    case day = "dd"
    case dateApi = "dd-MM-yyyy"
    case dateApi2 = "yyyy/MM/dd"
    case facebookApi = "MM/DD/YYYY"
    case dateTime = "dd-MM-yyyy HH:mm"
    case dateTimeApi = "yyyy-MM-dd'T'HH:mm:ss.SSZ"
    case dateTimeApi2 = "dd/MM/yyyy'T'HH:mm"
    case dateTimeApiProfile = "yyyy-MM-dd'T'HH:mm:ss"
    case dateTimeNotification = "dd/MM/yyyy HH:mm"
    case dateTimeNotificationAMPM = "dd/MM/yyyy HH:mm a"
    case dateTimeNotification2 = "yyyy/MM/dd HH:mm"
    case dateTimeAMPM = "dd/MM/yyyy h:mm a"
    case dateEvent = "dd/MM/yyyy"
    case dateTimeEventCard = "MMMM dd '|' HH:mm'h'"
    case dateEmergency = "dd-MMM-yyyy"
    case time24 = "HH:mm"
    case calendar = "dd MM yyyy"
    case playerTime = "mm:ss"
}

enum LocaleIdentifier: String {
    case gt = "es_GT"
    case none = "none"
}

extension Date {
    func getString(fromFormat format: DateFormatIdentifier? = .dateApi, localeIdentifier identifier: LocaleIdentifier = .gt) -> String {
        let dateFormatter = DateFormatter()
        let locale: Locale
        
        switch identifier {
        case .none:
            locale = Locale.current
        default:
            locale = Locale.init(identifier: identifier.rawValue)
        }
        
        dateFormatter.locale = locale
        dateFormatter.dateFormat = format?.rawValue
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"

        return dateFormatter.string(from: self)
    }
}
