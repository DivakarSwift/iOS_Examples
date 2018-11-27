//
//  ListUsersModel.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

import Foundation

protocol ListUsersModelProtocol: Model {
    var itemsCount: Int { get }
    func item(at index: Int) -> UserProtocol
    func loadMorePhotos()
}

class ListUsersModel: BaseModel, ListUsersModelProtocol {
    
    var users: [UserProtocol] = [] {
        didSet {
            didUpdate?()
        }
    }
    
    var currentPageNumber: Int = 1
    var totalPages: Int = 1
    
    override init(dataManager: NetworkManagerProtocol) {
        super.init(dataManager: dataManager)
        firstRequest(page: currentPageNumber)
    }
    
    var itemsCount: Int {
        return users.count
    }
    
    func item(at index: Int) -> UserProtocol {
        return users[index]
    }
    
    private func firstRequest(page: Int) {
        getListUsers(page: currentPageNumber) { [weak self] users in
            self?.users = users
        }
        self.currentPageNumber = 1
    }
    
    func reloadPhotos() {
        getListUsers(page: 1) { [weak self] users in
            self?.users = users
        }
    }
    
    func loadMorePhotos() {
        guard !(totalPages <= currentPageNumber) else { return }
        
        currentPageNumber += 1
        getListUsers(page: currentPageNumber) { [weak self] users in
            self?.users.append(contentsOf: users)
        }
    }
    
    private func getListUsers(page: Int, completion: (([User]) -> Void)?) {
        dataManager.getListUsers(page: page) { [weak self] (result) in
            switch result {
            case .success(let listUsers):
                self?.totalPages = listUsers.totalPages
                completion?(listUsers.users)
            case .failure(let error):
                self?.handleError?(error)
            }
        }
    }
}
