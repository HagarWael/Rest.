//
//  MenuItemDetailViewController.swift
//  Restaurant
//
// Created by Hager on 06/08/2023.
//  View controller for the details of a particular food

import UIKit

class MenuItemDetailViewController: UIViewController {
    
  
    var menuItem: MenuItem!

    var delegate: AddToOrderDelegate?
    

    @IBOutlet weak var titleLabel: UILabel!
    
   
    @IBOutlet weak var imageView: UIImageView!
    
  
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
   
    @IBOutlet weak var addToOrderButton: UIButton!
  
    @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
    
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
      
        delegate?.added(menuItem: menuItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        updateUI()
        
       
        setupDelegate()
    }
    
   
    func updateUI() {
        titleLabel.text = menuItem.name
        
        // food price
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        
        // detailed food description
        descriptionLabel.text = menuItem.description
        
        // make button's corners round
        addToOrderButton.layer.cornerRadius = 5
        
        // get the image for the menu item
        MenuController.shared.fetchImage(url: menuItem.imageURL) { image in
            // check that we got the image loaded
            guard let image = image else { return }
            
            // assign the image to the image view in the main thread
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    /// Set the delegate so that the selected item passed to order later
    func setupDelegate() {
        // find order table view controller through navigation controller
        if let navController = tabBarController?.viewControllers?.last as? UINavigationController,
            let orderTableViewController = navController.viewControllers.first as? OrderTableViewController {
            delegate = orderTableViewController
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
