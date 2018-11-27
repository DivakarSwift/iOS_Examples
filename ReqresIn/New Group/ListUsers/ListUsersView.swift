//
//  ListUsersView.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

import Foundation

protocol ListUsersView: BaseView {
    var onUserSelected: ((UserProtocol) -> Void)? { get set }
}
