//
//  UserDetailController.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

import Nuke

class UserDetailController: UIViewController, UserDetailView {
    
    var avatarImageVew: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    var secondNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    var viewModel: UserDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageVew.layoutIfNeeded()
        avatarImageVew.circle()
    }
    
    private func bindViewModel() {
        firstNameLabel.text = viewModel.firstName
        secondNameLabel.text = viewModel.secondName
        
        if let avatarUrl = viewModel.avatarUrl {
            Nuke.loadImage(with: avatarUrl, into: avatarImageVew)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(avatarImageVew)
        avatarImageVew.anchorSize(size: CGSize(width: 200, height: 200))
        avatarImageVew.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatarImageVew.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: Constraints.padding2x).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, secondNameLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: avatarImageVew.bottomAnchor, constant: Constraints.padding2x).isActive = true
        stackView.leftAnchor.constraint(equalTo: avatarImageVew.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: avatarImageVew.rightAnchor).isActive = true
    }
    
}
