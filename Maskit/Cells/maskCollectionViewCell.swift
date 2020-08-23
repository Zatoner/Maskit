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
    
//    var eventItem: eventItem! {
//        didSet {
//            //set stuff
//        }
//    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(background)

        let constraints = [
        
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UITools().CELL_SPACING),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UITools().CELL_SPACING),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
