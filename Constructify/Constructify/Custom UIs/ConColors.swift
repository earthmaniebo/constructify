//
//  ConColors.swift
//  Constructify
//
//  Created by Earth Maniebo on 28/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import Foundation
import UIKit

public enum ConColors {

    case darkTeal
    case gold
    case darkGold
    case greenProgress
    case redProgress
    case orangeProgress
    case grayProgress
    
    public var uiColor: UIColor {
        
        switch self {
        case .darkTeal:
            return UIColor(netHex: 0x004D57)
        case .gold:
            return UIColor(netHex: 0xFFD86E)
        case .darkGold:
            return UIColor(netHex: 0xC79625)
        case .greenProgress:
            return UIColor(netHex: 0x3AC796)
        case .redProgress:
            return UIColor(netHex: 0xFF5C3E)
        case .orangeProgress:
            return UIColor(netHex: 0xEDAB21)
        case .grayProgress:
            return UIColor(netHex: 0x979797)
        }
    }
    
}

