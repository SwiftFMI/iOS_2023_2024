//
//  ViewController.swift
//  MyFirstUIKitApp
//
//  Created by Emil Atanasov on 10/19/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleHelloButton(_ sender: UIButton) {
        print("Hello Swift!")
    }
    

}


class ViewController2: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        myButton.isHidden = true
    }
    
    @IBAction func handleHelloButton(_ sender: UIButton) {
        print("Hello Swift2!")
    }
    

}
