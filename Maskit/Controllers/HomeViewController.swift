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
    
    fileprivate let testview: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = .red
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
            
    }

    func generateUI() {
        
        view.backgroundColor = UIColor(named: UITools().backgroundColorString)
        
        let constraints = [
            
            headerTitle.topAnchor.constraint(equalTo: margins.topAnchor, constant: UITools().PADDING * 3/2),
            headerTitle.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: UITools().PADDING),
            headerTitle.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
                    
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }

}

