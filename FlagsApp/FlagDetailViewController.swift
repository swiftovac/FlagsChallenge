//
//  FlagDetailViewController.swift
//  FlagsApp
//
//  Created by Stefan Milenkovic on 2/23/19.
//  Copyright © 2019 Stefan Milenkovic. All rights reserved.
//

import UIKit

class FlagDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var recivedCountryName: String?
    var recivedImageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
        // Do any additional setup after loading the view.
        
        if let imageName = recivedImageName {
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: imageName)
        }
        if let countryName = recivedCountryName {
            title = countryName
        }
      
    }
    
    @objc func shareTapped() {
        
        guard let image = imageView.image else {
            print("No image data")
            return
        }
        
        guard let countryName = recivedCountryName else {
            print("No name there")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image,countryName], applicationActivities: [])
        
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true, completion: nil)
        
        
        
        
    }
    
    
    



}
