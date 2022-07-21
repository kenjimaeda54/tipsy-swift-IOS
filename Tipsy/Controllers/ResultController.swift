//
//  ResultController.swift
//  Tipsy
//
//  Created by kenjimaeda on 19/07/22.
//

import UIKit

class ResultController: UIViewController {
	
	var totalAcount: String = ""
	var totalPeople: String = ""
	var totalDiscount: String = ""
	
	@IBOutlet weak var totalPerson: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		totalPerson.text = totalAcount
		descriptionLabel.text = "Split between \(String(describing: totalPeople)), with \(String(describing: totalDiscount) ) tip."
	}
	
	@IBAction func pressRecalculate(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
}
