//
//  ListUsersController.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

import Nuke

class ListUsersController: UIViewController, ListUsersView {

    var onUserSelected: ((UserProtocol) -> Void)?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 400
        tableView.tableFooterView = UIView()
        tableView.registerClass(ListUsersCell.self)
        return tableView
    }()
    
    var viewModel: ListUsersViewModelProtocol!
    var isNearTheBottomEdge: Bool = false {
        didSet {
            guard oldValue != isNearTheBottomEdge, isNearTheBottomEdge else { return }
            viewModel.loadMorePhotos()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
        setupNavigationBar()
    }

    private func bindViewModel() {
        viewModel.didUpdate = {[weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.handleError = { error in
            HUDService.showError(withStatus: error.localizedDescription)
        }
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        tableView.fillSuperview()
    }
    
    private func setupNavigationBar() {
        guard let navigationController = self.navigationController else { return }
        let image = #imageLiteral(resourceName: "logo")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navigationController.navigationBar.frame.size.width
        let bannerHeight = navigationController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        isNearTheBottomEdge = scrollView.isNearTheBottomEdge()
    }

}

extension ListUsersController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListUsersCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.user = viewModel.item(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.item(at: indexPath.row)
        onUserSelected?(user)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
