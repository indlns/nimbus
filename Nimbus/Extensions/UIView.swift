//
//  UIView.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.
//

import UIKit

extension UIView {
    func roundedView(corners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = 20
        layer.maskedCorners = corners
    }
}
