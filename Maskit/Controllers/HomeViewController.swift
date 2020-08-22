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
        view.layer.shadowRadius = UITools().sRadius * 2
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
        view.layer.shadowRadius = UITools().sRadius * 3/2
        view.layer.cornerRadius = UITools().CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    fileprivate let monateryTitle: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.systemFont(ofSize: UITools().CARDHEADER_FONT_SIZE)
        label.text = UITools().monateryTitleString
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
            
        return label
            
    }()
    
    fileprivate let monateryItem: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.boldSystemFont(ofSize: UITools().CARDITEM_FONT_SIZE)
        label.text = "£00,00"
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
            
        return label
            
    }()
    
    fileprivate let monateryAvg: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.systemFont(ofSize: UITools().CARDHEADER_FONT_SIZE)
        label.text = "Avg: ~£0,00"
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
            
        return label
            
    }()

    
    fileprivate let wasteCardView: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = UIColor(named: UITools().cardBackgroundColorString)
        view.layer.shadowOffset = CGSize(width: 0, height: UITools().sOffset)
        view.layer.shadowOpacity = UITools().sOpacity
        view.layer.shadowRadius = UITools().sRadius * 3/2
        view.layer.cornerRadius = UITools().CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    fileprivate let wasteTitle: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.systemFont(ofSize: UITools().CARDHEADER_FONT_SIZE)
        label.text = UITools().wasteTitleString
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
            
        return label
            
    }()
    
    fileprivate let wasteItem: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.boldSystemFont(ofSize: UITools().CARDITEM_FONT_SIZE)
        label.text = "000 g"
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
            
        return label
            
    }()
    
    fileprivate let wasteAvg: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.systemFont(ofSize: UITools().CARDHEADER_FONT_SIZE)
        label.text = "Avg: ~0,00 g"
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
            
        return label
            
    }()
    
    fileprivate let usageCardView: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = UIColor(named: UITools().cardBackgroundColorString)
        view.layer.shadowOffset = CGSize(width: 0, height: UITools().sOffset)
        view.layer.shadowOpacity = UITools().sOpacity
        view.layer.shadowRadius = UITools().sRadius * 3/2
        view.layer.cornerRadius = UITools().CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    
    }()
    
    fileprivate let usageTitle: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.systemFont(ofSize: UITools().CARDHEADER_FONT_SIZE)
        label.text = UITools().usageTitleString
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
            
        return label
            
    }()
    
    fileprivate let usageItem: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.boldSystemFont(ofSize: UITools().CARDITEM_FONT_SIZE)
        label.text = "00 Hours"
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
            
        return label
            
    }()
    
    fileprivate let usageAvg: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.systemFont(ofSize: UITools().CARDHEADER_FONT_SIZE)
        label.text = "Avg: ~0h"
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
            
        return label
            
    }()
    
    fileprivate let infoButton: UIButton = {
            
        let button = UIButton()
            
        button.tintColor = UIColor(named: UITools().darkTextColorString)
        button.alpha = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
            
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
        view.addSubview(infoButton)
        
        view.addSubview(monateryCardView)
        monateryCardView.addSubview(monateryTitle)
        monateryCardView.addSubview(monateryItem)
        monateryCardView.addSubview(monateryAvg)
        
        view.addSubview(wasteCardView)
        wasteCardView.addSubview(wasteTitle)
        wasteCardView.addSubview(wasteItem)
        wasteCardView.addSubview(wasteAvg)
        
        view.addSubview(usageCardView)
        usageCardView.addSubview(usageTitle)
        usageCardView.addSubview(usageItem)
        usageCardView.addSubview(usageAvg)
        
        view.addSubview(addBackgroundView)
        addBackgroundView.addSubview(addButton)
            
    }

    func generateUI() {
        
        view.backgroundColor = UIColor(named: UITools().backgroundColorString)
        
        let constraints = [
            
            headerTitle.topAnchor.constraint(equalTo: margins.topAnchor, constant: UITools().PADDING * 2),
            headerTitle.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: UITools().PADDING / 2),
            headerTitle.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor),
            
            infoButton.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor),
            infoButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -UITools().PADDING / 2),
            
            addBackgroundView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -UITools().PADDING * 2),
            addBackgroundView.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            addBackgroundView.widthAnchor.constraint(equalToConstant: view.frame.width / 2.5),
            addBackgroundView.heightAnchor.constraint(equalToConstant: UITools().BUTTON_HEIGHT),
            
            addButton.topAnchor.constraint(equalTo: addBackgroundView.topAnchor),
            addButton.bottomAnchor.constraint(equalTo: addBackgroundView.bottomAnchor),
            addButton.leadingAnchor.constraint(equalTo: addBackgroundView.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: addBackgroundView.trailingAnchor),
            
            monateryCardView.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: UITools().PADDING * 2),
            monateryCardView.leadingAnchor.constraint(equalTo: headerTitle.leadingAnchor),
            monateryCardView.trailingAnchor.constraint(equalTo: infoButton.trailingAnchor),
            monateryCardView.bottomAnchor.constraint(equalTo: monateryAvg.bottomAnchor, constant: UITools().PADDING),
            
            monateryTitle.topAnchor.constraint(equalTo: monateryCardView.topAnchor, constant: UITools().PADDING),
            monateryTitle.leadingAnchor.constraint(equalTo: monateryCardView.leadingAnchor, constant: UITools().PADDING * 3/2),
            monateryTitle.trailingAnchor.constraint(equalTo: monateryCardView.trailingAnchor),
            
            monateryItem.topAnchor.constraint(equalTo: monateryTitle.bottomAnchor, constant: UITools().PADDING),
            monateryItem.leadingAnchor.constraint(equalTo: monateryTitle.leadingAnchor),
            monateryItem.trailingAnchor.constraint(equalTo: monateryTitle.trailingAnchor),
            
            monateryAvg.topAnchor.constraint(equalTo: monateryItem.bottomAnchor, constant: UITools().PADDING / 1.5),
            monateryAvg.leadingAnchor.constraint(equalTo: monateryTitle.leadingAnchor),
            monateryAvg.trailingAnchor.constraint(equalTo: monateryTitle.trailingAnchor),
            
            wasteCardView.topAnchor.constraint(equalTo: monateryCardView.bottomAnchor, constant: UITools().PADDING),
            wasteCardView.leadingAnchor.constraint(equalTo: headerTitle.leadingAnchor),
            wasteCardView.trailingAnchor.constraint(equalTo: infoButton.trailingAnchor),
            wasteCardView.bottomAnchor.constraint(equalTo: wasteAvg.bottomAnchor, constant: UITools().PADDING),
            
            wasteTitle.topAnchor.constraint(equalTo: wasteCardView.topAnchor, constant: UITools().PADDING),
            wasteTitle.leadingAnchor.constraint(equalTo: wasteCardView.leadingAnchor, constant: UITools().PADDING * 3/2),
            wasteTitle.trailingAnchor.constraint(equalTo: wasteCardView.trailingAnchor),
            
            wasteItem.topAnchor.constraint(equalTo: wasteTitle.bottomAnchor, constant: UITools().PADDING),
            wasteItem.leadingAnchor.constraint(equalTo: wasteTitle.leadingAnchor),
            wasteItem.trailingAnchor.constraint(equalTo: wasteTitle.trailingAnchor),
            
            wasteAvg.topAnchor.constraint(equalTo: wasteItem.bottomAnchor, constant: UITools().PADDING / 1.5),
            wasteAvg.leadingAnchor.constraint(equalTo: wasteTitle.leadingAnchor),
            wasteAvg.trailingAnchor.constraint(equalTo: wasteTitle.trailingAnchor),
            
            usageCardView.topAnchor.constraint(equalTo: wasteCardView.bottomAnchor, constant: UITools().PADDING),
            usageCardView.leadingAnchor.constraint(equalTo: headerTitle.leadingAnchor),
            usageCardView.trailingAnchor.constraint(equalTo: infoButton.trailingAnchor),
            usageCardView.bottomAnchor.constraint(equalTo: usageAvg.bottomAnchor, constant: UITools().PADDING),
            
            usageTitle.topAnchor.constraint(equalTo: usageCardView.topAnchor, constant: UITools().PADDING),
            usageTitle.leadingAnchor.constraint(equalTo: usageCardView.leadingAnchor, constant: UITools().PADDING * 3/2),
            usageTitle.trailingAnchor.constraint(equalTo: usageCardView.trailingAnchor),
            
            usageItem.topAnchor.constraint(equalTo: usageTitle.bottomAnchor, constant: UITools().PADDING),
            usageItem.leadingAnchor.constraint(equalTo: usageTitle.leadingAnchor),
            usageItem.trailingAnchor.constraint(equalTo: usageTitle.trailingAnchor),
            
            usageAvg.topAnchor.constraint(equalTo: usageItem.bottomAnchor, constant: UITools().PADDING / 1.5),
            usageAvg.leadingAnchor.constraint(equalTo: usageTitle.leadingAnchor),
            usageAvg.trailingAnchor.constraint(equalTo: usageTitle.trailingAnchor),
                    
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        addButton.addTarget(self, action: #selector(self.add), for: .touchUpInside)
        
        infoButton.addTarget(self, action: #selector(self.info), for: .touchUpInside)
        infoButton.setImage(UITools().infoImage, for: .normal)
        
    }

    
    @objc func add(sender : UITapGestureRecognizer) {
        print("boop")
    }
    
    @objc func info(sender : UITapGestureRecognizer) {
        
        guard let url = URL(string: "https://www.rdehospital.nhs.uk/documents/patients/wearing-a-face-mask-or-face-covering-during-covid-19-leaflet.pdf") else { return }
        UIApplication.shared.open(url)
        
    }
}

