//
//  AddViewController.swift
//  Maskit
//
//  Created by Adrien Zier on 23/08/2020.
//  Copyright © 2020 Adrien Zier. All rights reserved.
//

import UIKit
import AVFoundation

class AddViewController: UIViewController {

    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var VIEW_HEIGHT = CGFloat()
    var margins = UILayoutGuide()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialise()
        generateUI()
    }
    
    func initialise() {
            
        margins = view.layoutMarginsGuide
            
        VIEW_HEIGHT = view.frame.height
        
        maskTypeCollectionView.delegate = self
        maskTypeCollectionView.dataSource = self
        
        view.addSubview(headerBackground)
        headerBackground.addSubview(headerTitle)
        headerBackground.addSubview(maskTypeCollectionView)
        headerBackground.addSubview(scanButton)
            
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
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        scanButton.addTarget(self, action: #selector(self.scan), for: .touchUpInside)
        scanButton.setImage(UITools().scanImage, for: .normal)
        
    }
    
    @objc func scan(sender : UITapGestureRecognizer) {
        
        //openScanner()
        
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

}

extension AddViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UITools().maskCellString, for: indexPath) as! maskCollectionViewCell
        //cell.data = self.data[indexPath.item]
        return cell
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
