//
//  Constants.swift
//  Malmo
//
//  Created by Кирилл on 13.02.2018.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

import Foundation

enum Constants {
    enum RestApi {
        enum Request {
            static let id = "id"
            static let page = "page"
            static let perPage = "per_page"
        }
    
        
        enum Response {
        }
    }

}

enum Constraints {
    static let defaultCellLeftRight: CGFloat = 15.0
    static let defaultCellTopBottom: CGFloat = 10.0
    static let padding: CGFloat = 8.0
    static let padding2x: CGFloat = 16.0
    static let padding3x: CGFloat = 24.0
    static let padding4x: CGFloat = 32.0
    static let cornerRadius: CGFloat = 8.0
    static let zero: CGFloat = 0.0
    
}
