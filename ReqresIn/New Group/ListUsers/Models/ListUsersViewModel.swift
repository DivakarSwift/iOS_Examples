//
//  ListUsersViewModel.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

import Foundation

protocol ListUsersViewModelProtocol: ViewModel {
    var itemsCount: Int { get }
    func item(at index: Int) -> UserProtocol
    func loadMorePhotos()
}

class ListUsersViewModel: BaseViewModel, ListUsersViewModelProtocol {

    var model: ListUsersModelProtocol
    
    init(model: ListUsersModelProtocol) {
        self.model = model
        super.init()
        bindModel()
    }
    
    override func bindModel() {
        model.didUpdate = {[weak self] in
            self?.didUpdate?()
        }
        
        model.handleError = {[weak self] error in
            self?.handleError?(error)
        }
    }
    
    var itemsCount: Int {
        return model.itemsCount
    }
    
    func item(at index: Int) -> UserProtocol {
        return model.item(at: index)
    }
    
    func loadMorePhotos() {
        model.loadMorePhotos()
    }
}
