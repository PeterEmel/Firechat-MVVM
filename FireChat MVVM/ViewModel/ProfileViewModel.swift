//
//  ProfileViewModel.swift
//  FireChat MVVM
//
//  Created by Peter Emel on 6/24/21.
//  Copyright © 2021 Peter Emel. All rights reserved.
//

import Foundation

enum ProfileViewModel: Int, CaseIterable {
    case accounInfo
    case settings
    
    var description: String {
        switch self {
        case .accounInfo: return "Account Info"
        case .settings: return "Settings"
        }
    }
    
    var iconImageName: String {
        switch self {
        case .accounInfo: return "person.circle.fill"
        case .settings: return "gear"
        }
    }
}
