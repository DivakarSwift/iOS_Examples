//
//  ListUsersCell.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

import Foundation
import Nuke

class ListUsersCell: BaseTableViewCell {
    
    var avatarImageVew: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    var secondNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    var user: UserProtocol? {
        didSet {
            guard let user = user else { return }
            setupViewModel(user)
        }
    }
    
    private func setupViewModel(_ user: UserProtocol) {
        firstNameLabel.text = user.firstName
        secondNameLabel.text = user.lastName
        
        if let avatarUrl = URL(string: user.avatar) {
            Nuke.loadImage(with: avatarUrl, into: avatarImageVew)
        }
    }
    
    override func layoutSubviews() {
        avatarImageVew.layoutIfNeeded()
        avatarImageVew.circle()
    }
    
    override func setupViews() {
        contentView.addSubview(avatarImageVew)
        avatarImageVew.anchorSize(size: CGSize(width: 100, height: 100))
        avatarImageVew.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constraints.padding).isActive = true
        avatarImageVew.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constraints.padding).isActive = true
        avatarImageVew.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constraints.padding).isActive = true
        contentView.addSubview(firstNameLabel)
        firstNameLabel.leftAnchor.constraint(equalTo: avatarImageVew.rightAnchor, constant: Constraints.padding).isActive = true
        firstNameLabel.topAnchor.constraint(equalTo: avatarImageVew.topAnchor).isActive = true
        firstNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constraints.padding).isActive = true
        
        contentView.addSubview(secondNameLabel)
        secondNameLabel.leftAnchor.constraint(equalTo: avatarImageVew.rightAnchor, constant: Constraints.padding).isActive = true
        secondNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: Constraints.padding).isActive = true
        secondNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constraints.padding).isActive = true
    }
    
}
