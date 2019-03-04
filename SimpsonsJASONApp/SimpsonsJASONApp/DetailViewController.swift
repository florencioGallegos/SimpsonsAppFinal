//
//  DetailViewController.swift
//  SimpsonsJASONApp
//
//  Created by MAC Consultant on 3/4/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var Namelabel: UILabel!
    @IBOutlet weak var CharImage: UIImageView!
    @IBOutlet weak var Description: UITextView!
    
//    var character : SimpsonsCharacters
 //   var name = ""
 //   var desc = ""
//    var image : UIImage

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
   //     var delimiter = "-"
    //     let  text = character.RelatedTopics[0].Text.components(separatedBy: delimiter)
   //     Namelabel.text = text[0]
   //     Description.text = text[1]
        }

    @IBAction func BackButton(_ sender: Any) {
    }
}
