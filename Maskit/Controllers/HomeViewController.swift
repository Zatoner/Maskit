//
//  ViewController.swift
//  Maskit
//
//  Created by Adrien Zier on 22/08/2020.
//  Copyright © 2020 Adrien Zier. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var VIEW_HEIGHT = CGFloat()
    var margins = UILayoutGuide()
    
    fileprivate let headerTitle: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.boldSystemFont(ofSize: UITools().HEADER_FONT_SIZE)
        label.text = UITools().headerTitleString
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
            
        return label
            
    }()
    
    fileprivate let addBackgroundView: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = UIColor(named: UITools().primaryColorString)
        view.layer.shadowOffset = CGSize(width: 0, height: UITools().sOffset)
        view.layer.shadowOpacity = UITools().sOpacity
        view.layer.shadowRadius = UITools().sRadius
        view.layer.cornerRadius = UITools().BUTTON_HEIGHT / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    fileprivate let addButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(UITools().addButtonString, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: UITools().BUTTON_FONT_SIZE)
        
        return button
        
    }()
    
    fileprivate let monateryCardView: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = UIColor(named: UITools().cardBackgroundColorString)
        view.layer.shadowOffset = CGSize(width: 0, height: UITools().sOffset)
        view.layer.shadowOpacity = UITools().sOpacity
        view.layer.shadowRadius = UITools().sRadius
        view.layer.cornerRadius = UITools().CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    fileprivate let wasteCardView: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = UIColor(named: UITools().cardBackgroundColorString)
        view.layer.shadowOffset = CGSize(width: 0, height: UITools().sOffset)
        view.layer.shadowOpacity = UITools().sOpacity
        view.layer.shadowRadius = UITools().sRadius
        view.layer.cornerRadius = UITools().CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    fileprivate let usageCardView: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = UIColor(named: UITools().cardBackgroundColorString)
        view.layer.shadowOffset = CGSize(width: 0, height: UITools().sOffset)
        view.layer.shadowOpacity = UITools().sOpacity
        view.layer.shadowRadius = UITools().sRadius
        view.layer.cornerRadius = UITools().CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialise()
        generateUI()
        
    }
    
    func initialise() {
            
        margins = view.layoutMarginsGuide
            
        VIEW_HEIGHT = view.frame.height
            
        view.addSubview(headerTitle)
        
        view.addSubview(monateryCardView)
        view.addSubview(wasteCardView)
        view.addSubview(usageCardView)
        
        view.addSubview(addBackgroundView)
        addBackgroundView.addSubview(addButton)
            
    }

    func generateUI() {
        
        view.backgroundColor = UIColor(named: UITools().backgroundColorString)
        
        let constraints = [
            
            headerTitle.topAnchor.constraint(equalTo: margins.topAnchor, constant: UITools().PADDING * 3/2),
            headerTitle.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: UITools().PADDING / 2),
            headerTitle.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -UITools().PADDING / 2),
            
            addBackgroundView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -UITools().PADDING),
            addBackgroundView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            addBackgroundView.widthAnchor.constraint(equalToConstant: view.frame.width / 2.5),
            addBackgroundView.heightAnchor.constraint(equalToConstant: UITools().BUTTON_HEIGHT),
            
            addButton.topAnchor.constraint(equalTo: addBackgroundView.topAnchor),
            addButton.bottomAnchor.constraint(equalTo: addBackgroundView.bottomAnchor),
            addButton.leadingAnchor.constraint(equalTo: addBackgroundView.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: addBackgroundView.trailingAnchor),
            
            monateryCardView.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: UITools().PADDING * 3/2),
            monateryCardView.leadingAnchor.constraint(equalTo: headerTitle.leadingAnchor),
            monateryCardView.trailingAnchor.constraint(equalTo: headerTitle.trailingAnchor),
            monateryCardView.heightAnchor.constraint(equalToConstant: VIEW_HEIGHT / 4.5),
            
            wasteCardView.topAnchor.constraint(equalTo: monateryCardView.bottomAnchor, constant: UITools().PADDING),
            wasteCardView.leadingAnchor.constraint(equalTo: headerTitle.leadingAnchor),
            wasteCardView.trailingAnchor.constraint(equalTo: headerTitle.trailingAnchor),
            wasteCardView.heightAnchor.constraint(equalToConstant: VIEW_HEIGHT / 4.5),
            
            usageCardView.topAnchor.constraint(equalTo: wasteCardView.bottomAnchor, constant: UITools().PADDING),
            usageCardView.leadingAnchor.constraint(equalTo: headerTitle.leadingAnchor),
            usageCardView.trailingAnchor.constraint(equalTo: headerTitle.trailingAnchor),
            usageCardView.heightAnchor.constraint(equalToConstant: VIEW_HEIGHT / 4.5),
                    
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        addButton.addTarget(self, action: #selector(self.add), for: .touchUpInside)
        
    }

    
    @objc func add(sender : UITapGestureRecognizer) {
        print("boop")
    }
}

