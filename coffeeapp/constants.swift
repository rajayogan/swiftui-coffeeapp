//
//  constants.swift
//  coffeeapp
//
//  Created by Rajayogan on 22/04/25.
//

import Foundation
import SwiftUI

//Font helper extension
extension Font {
    static func sourcesans(fontStyle: Font.TextStyle = .body, fontWeight: Weight = .regular, fontSize: CGFloat = 16) -> Font {
        return Font.custom(CustomFont(weight: fontWeight).rawValue, size: fontStyle.size)
    }
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 34
        case .title: return 30
        case .title2: return 22
        case .title3: return 20
        case .headline: return 18
        case .body: return 16
        case .callout: return 15
        case .subheadline: return 14
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: return 8
        }
    }
}

enum CustomFont: String {
    case regular = "SourceSans3-Regular"
    case semibold = "SourceSans3-Semibold"
    case bold = "SourceSans3-Bold"
    case light = "SourceSans3-Light"
    case ultraLight = "SourceSans3-ExtraLight"
    case medium = "SourceSans3-Medium"
    
    //Note - Ensure that all the font names you use are actually provided as assets in the fonts directory
    
    init(weight: Font.Weight) {
        switch weight {
        case .regular:
            self = .regular
        case .semibold:
            self = .semibold
        case .bold:
            self = .bold
        case .light:
            self = .light
        case .ultraLight:
            self = .ultraLight
        case .medium:
            self = .medium
        default:
            self = .regular
        }
    }
}
