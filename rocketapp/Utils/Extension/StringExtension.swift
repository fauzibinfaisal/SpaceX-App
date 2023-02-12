//
//  StringExtension.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 12/02/23.
//

import Foundation

extension String {
    func convertDateString(fromFormat: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
    }
}
