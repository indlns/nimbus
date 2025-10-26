//
//  NSObject.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.
//

import Foundation

extension NSObjectProtocol {
    @discardableResult
    func apply(_ closure: (Self) -> () ) -> Self {
    { closure(self) } ()
        return self
    }
}
