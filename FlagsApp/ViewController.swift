//
//  ViewController.swift
//  FlagsApp
//
//  Created by Stefan Milenkovic on 2/23/19.
//  Copyright © 2019 Stefan Milenkovic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        countries += ["estonia","france","germany","ireland","italy",
                      "monaco","nigeria","poland","russia","spain","uk","us"]
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell")
        
        cell?.textLabel?.text = countries[indexPath.row].uppercased()
        cell?.imageView?.contentMode = .scaleAspectFit
        cell?.imageView?.clipsToBounds = true
        cell?.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.imageView?.layer.borderWidth = 1.0
        
        cell?.imageView?.image = UIImage(named: countries[indexPath.row])
        
        return cell!
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let country = countries[indexPath.row]
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FlagDetail") as? FlagDetailViewController {
        
        vc.recivedImageName = country
        vc.recivedCountryName = country.uppercased()
        
        navigationController?.pushViewController(vc, animated: true)

        }
    }
    
    
    
    
    
}

