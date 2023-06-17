//
//  Color+extension.swift
//
//
//  Created by Afifi, Mohamed on 7/23/21.
//

import SwiftUI

extension Color {
    static var appIdentity: Color {
        Color("appTint", bundle: .module)
    }
}

public extension UIColor {
    static var appIdentity: UIColor {
        UIColor(named: "appTint", in: .module, compatibleWith: nil) ?? .systemIndigo
    }

    static var reading: UIColor {
        UIColor(named: "reading", in: .module, compatibleWith: nil)!
    }

    static var pageSeparatorLine: UIColor {
        UIColor(named: "pageSeparatorLine", in: .module, compatibleWith: nil)!
    }

    static var pageSeparatorBackground: UIColor {
        UIColor(named: "pageSeparatorBackground", in: .module, compatibleWith: nil)!
    }

    static var pageMarkerTint: UIColor {
        UIColor { collection in
            collection.userInterfaceStyle == .dark ? UIColor(rgb: 0x039F85) : UIColor(rgb: 0x004D40)
        }
    }
}