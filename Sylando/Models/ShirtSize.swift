//
//  ShirtSize.swift
//  Sylando
//
//  Created by Mykyta on 08.09.26.
//

import Foundation

enum Size: String, Identifiable, CaseIterable {
    case xs, s, m, l, xl
    
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .xs: "XS"
        case .s: "S"
        case .m: "M"
        case .l: "L"
        case .xl: "XL"
        }
    }
}
