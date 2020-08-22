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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateUI()
        
    }

    func generateUI() {
        
        view.backgroundColor = UIColor(named: UITools().backgroundColorString)
        
    }

}

