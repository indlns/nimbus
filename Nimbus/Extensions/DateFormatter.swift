//
//  DateFormatter.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.
//

import Foundation

class DateHelper {
    static let shared = DateHelper()
    
    private let formatter: DateFormatter
    
    private init() {
        formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.timeZone = TimeZone.current
    }

    func currentDateString(format: String = "dd MMMM") -> String {
        formatter.dateFormat = format
        return formatter.string(from: Date())
    }
}
