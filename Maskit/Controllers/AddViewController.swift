//
//  AddViewController.swift
//  Maskit
//
//  Created by Adrien Zier on 23/08/2020.
//  Copyright © 2020 Adrien Zier. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
import FirebaseFirestore
import CoreData

struct masks {
    let type: String!
    let desc: String!
    let avgPrice: Float!
    let weight: Float!
    var selected: Bool!
    
}

class AddViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    var dataArray = Array(1...100)
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var VIEW_HEIGHT = CGFloat()
    var margins = UILayoutGuide()
    
    var masksList = [masks]()
    var selectedMask: masks!
    var selectedQuantity = 0
    
    var data: [NSManagedObject] = []
    
    fileprivate let headerTitle: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.boldSystemFont(ofSize: UITools().HEADER_FONT_SIZE)
        label.text = UITools().addTitleString
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
            
        return label
            
    }()
    
    fileprivate let headerBackground: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = UIColor(named: UITools().primaryColorString)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    fileprivate let maskTypeCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: UITools().PADDING, bottom: 0, right: UITools().PADDING)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(named: UITools().primaryColorString)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(maskCollectionViewCell.self, forCellWithReuseIdentifier: UITools().maskCellString)
        
        return cv
    }()
    
    fileprivate let scanButton: UIButton = {
            
        let button = UIButton()
            
        button.tintColor = .white
        button.alpha = 0.9
        button.translatesAutoresizingMaskIntoConstraints = false
            
        return button
            
    }()
    
    fileprivate let quantityTitle: UILabel = {
            
        var label = UILabel()
            
        label.font = UIFont.systemFont(ofSize: UITools().CARDHEADER_FONT_SIZE)
        label.text = UITools().quantityTitleString
        label.textColor = UIColor(named: UITools().darkTextColorString)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.5
            
        return label
            
    }()
    
    fileprivate let quantityPicker: UIPickerView = {
        
        var picker = UIPickerView()
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
        
    }()
    
    fileprivate let doneBackground: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.15
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    fileprivate let doneButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(UITools().doneButtonString, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: UITools().BUTTON_FONT_SIZE)
        button.setTitleColor(UIColor(named: UITools().darkTextColorString), for: .normal)
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialise()
        generateUI()
        
        getData()
    }
    
    func initialise() {
            
        margins = view.layoutMarginsGuide
            
        VIEW_HEIGHT = view.frame.height
        
        maskTypeCollectionView.delegate = self
        maskTypeCollectionView.dataSource = self
        
        quantityPicker.delegate = self as UIPickerViewDelegate
        quantityPicker.dataSource = self as UIPickerViewDataSource
        
        view.addSubview(headerBackground)
        headerBackground.addSubview(headerTitle)
        headerBackground.addSubview(maskTypeCollectionView)
        headerBackground.addSubview(scanButton)
        
        view.addSubview(quantityTitle)
        view.addSubview(quantityPicker)
        
        view.addSubview(doneBackground)
        view.addSubview(doneButton)
            
    }
    
    func getData() {
        
        let db = Firestore.firestore()
        
        let requestRef = db.collection("MasksTypes")
        
        requestRef.getDocuments { (snapshot, err) in
            
            if err == nil {
                
                for document in snapshot!.documents {
                    
                    let doc = document.data()
                    let type = document.documentID
                    let desc = doc["description"] ?? "No Description"
                    let avgPrice = doc["averageprice"] ?? 0
                    let weight = doc["weight"] ?? 10
                    
                    let maskItem = masks(type: type, desc: desc as? String, avgPrice: avgPrice as? Float, weight: weight as? Float, selected: false)
                    
                    self.masksList.append(maskItem)
                    self.maskTypeCollectionView.reloadData()
                    
                }
                
            }
            
        }
        
    }
    
    func generateUI() {
        
        view.backgroundColor = UIColor(named: UITools().backgroundColorString)
        
        let constraints = [
            
            headerBackground.topAnchor.constraint(equalTo: view.topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: VIEW_HEIGHT / 2.5),
            
            headerTitle.topAnchor.constraint(equalTo: margins.topAnchor, constant: UITools().PADDING * 2),
            headerTitle.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: UITools().PADDING / 2),
            headerTitle.trailingAnchor.constraint(equalTo: scanButton.leadingAnchor),
            
            scanButton.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor),
            scanButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -UITools().PADDING / 2),
            
            
            maskTypeCollectionView.topAnchor.constraint(equalTo: headerTitle.bottomAnchor, constant: UITools().PADDING),
            maskTypeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            maskTypeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            maskTypeCollectionView.bottomAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: -UITools().PADDING),
            
            quantityTitle.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: UITools().PADDING * 2),
            quantityTitle.leadingAnchor.constraint(equalTo: headerTitle.leadingAnchor),
            quantityTitle.trailingAnchor.constraint(equalTo: scanButton.trailingAnchor),
            
            quantityPicker.topAnchor.constraint(equalTo: quantityTitle.bottomAnchor),
            quantityPicker.leadingAnchor.constraint(equalTo: quantityTitle.leadingAnchor),
            quantityPicker.trailingAnchor.constraint(equalTo: quantityTitle.trailingAnchor),
            
            doneBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            doneBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            doneBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            doneBackground.heightAnchor.constraint(equalToConstant: VIEW_HEIGHT / 6),
            
            doneButton.centerXAnchor.constraint(equalTo: doneBackground.centerXAnchor),
            doneButton.topAnchor.constraint(equalTo: doneBackground.topAnchor, constant: UITools().PADDING * 2)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        doneButton.addTarget(self, action: #selector(self.done), for: .touchUpInside)
        
        scanButton.addTarget(self, action: #selector(self.scan), for: .touchUpInside)
        scanButton.setImage(UITools().scanImage, for: .normal)
        
    }
    
    @objc func scan(sender : UITapGestureRecognizer) {
        
        //openScanner()
        
    }
    
    @objc func done(sender : UITapGestureRecognizer) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
            return
          }
        
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          let entity =
            NSEntityDescription.entity(forEntityName: "UserData",
                                       in: managedContext)!
          
          let data = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
          
        let currentVal = data.value(forKeyPath: "monatery")
        data.setValue(currentVal as! Float + (selectedMask.avgPrice ?? 1.5 * Float(selectedQuantity)), forKeyPath: "monatery")
        
        let currentWaste = data.value(forKeyPath: "waste")
        data.setValue(currentWaste as! Float + (selectedMask.weight ?? 10 * Float(selectedQuantity)), forKeyPath: "waste")
          
        do {
            try managedContext.save()
            
            self.dismiss(animated: true, completion: {
                self.presentingViewController?.dismiss(animated: true, completion: nil)
            })
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
        
    }
    
    func openScanner() {
        
        guard let videoCaptureDevice: AVCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
            for: .video, position: .back) else {
            return
        }
        
        let avVideoInput: AVCaptureDeviceInput
        
        do {
            avVideoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            print("your device has no camera")
            return
        }
        
        self.captureSession.addInput(avVideoInput)
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (self.captureSession.canAddOutput(metadataOutput)) {
            self.captureSession.addOutput(metadataOutput)
            //metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417, .qr]
        } else {
            return
        }
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.previewLayer.frame = self.view.layer.bounds
        self.previewLayer.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(self.previewLayer)
        self.captureSession.startRunning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
       let row = String(dataArray[row])
        
       return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedQuantity = dataArray[row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return masksList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UITools().maskCellString, for: indexPath) as! maskCollectionViewCell
        cell.maskItem = masksList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        for i in 0...(masksList.count - 1) {
            masksList[i].selected = false
        }
        
        masksList[indexPath.row].selected = true
        selectedMask = masksList[indexPath.row]
        
        collectionView.reloadData()
        
    }

}

extension HomeViewController : AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let first = metadataObjects.first{
            guard let readableObject = first as? AVMetadataMachineReadableCodeObject else {
                return
            }
            guard let stringValue = readableObject.stringValue else {
                return
            }
            found(code: stringValue)
        }
        else {
            print("Not able to read the code! Please try again.")
        }
    }
    func found(code: String){
        print(code)
    }
}
