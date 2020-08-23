//
//  CollectionViewCell.swift
//  Maskit
//
//  Created by Adrien Zier on 23/08/2020.
//  Copyright © 2020 Adrien Zier. All rights reserved.
//

import UIKit

class maskCollectionViewCell: UICollectionViewCell {
    
    let background: UIView = {
        
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: UITools().cardBackgroundColorString)
        view.layer.shadowOffset = CGSize(width: 0, height: UITools().sOffset)
        view.layer.shadowOpacity = UITools().sOpacity
        view.layer.shadowRadius = UITools().sRadius
        view.layer.cornerRadius = UITools().CORNER_RADIUS
        //view.clipsToBounds = true
        
        return view
        
    }()
    
    fileprivate let maskName: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.boldSystemFont(ofSize: UITools().TYPE_FONT_SIZE)
        label.text = "TYPE"
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
            
        return label
            
    }()
    
    fileprivate let maskDesc: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.systemFont(ofSize: UITools().DESC_FONT_SIZE)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
        label.numberOfLines = 0
            
        return label
            
    }()
    
    fileprivate let checkMark: UIButton = {
            
        let button = UIButton()
            
        button.tintColor = UIColor(named: UITools().primaryColorString)
        button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
            
    }()

    
//    var eventItem: eventItem! {
//        didSet {
//            //set stuff
//        }
//    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(background)
        background.addSubview(maskName)
        background.addSubview(maskDesc)
        background.addSubview(checkMark)

        let constraints = [
        
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UITools().CELL_SPACING),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UITools().CELL_SPACING),
            
            maskName.topAnchor.constraint(equalTo: background.topAnchor, constant: UITools().PADDING),
            maskName.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: UITools().PADDING),
            maskName.trailingAnchor.constraint(equalTo: checkMark.leadingAnchor),
            maskName.heightAnchor.constraint(equalToConstant: 18),
            
            checkMark.centerYAnchor.constraint(equalTo: maskName.centerYAnchor),
            checkMark.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -UITools().PADDING),
            
            maskDesc.topAnchor.constraint(equalTo: maskName.bottomAnchor, constant: UITools().PADDING / 2),
            maskDesc.leadingAnchor.constraint(equalTo: maskName.leadingAnchor),
            maskDesc.trailingAnchor.constraint(equalTo: checkMark.trailingAnchor),
            maskDesc.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -UITools().PADDING)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        checkMark.setImage(UITools().checkImage, for: .normal)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
