//
//  ViewController.swift
//  Tipsy
//
//  Created by kenjimaeda on 19/07/22.
//

import UIKit

class ViewController: UIViewController {
	
	var resultModel = ResultModel()
	var discountSelect: String?
	
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var countStepper: UILabel!
	@IBOutlet weak var buttonTenPercent: UIButton!
	@IBOutlet weak var buttonZeroPercent: UIButton!
	@IBOutlet weak var buttonTwentyPercent: UIButton!
	@IBOutlet weak var buttonCalculate: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		textField.delegate = self
		buttonCalculate.isEnabled = false
	}
	
	@IBAction func percentDiscount(_ sender: UIButton) {
		buttonTenPercent.backgroundColor = .none
		buttonZeroPercent.backgroundColor = .none
		buttonTwentyPercent.backgroundColor = .none
		if	let discount =  sender.titleLabel?.text {
			let value = discount.replacingOccurrences(of: "%", with: "")
			resultModel.valueDiscount = Double(value) ?? 0
			sender.backgroundColor = .systemGreen
			discountSelect = discount
		}
		
	}
	
	@IBAction func pressStepper(_ sender: UIStepper) {
		countStepper.text = String(format: "%.0f", sender.value)
		resultModel.quatityPerson = sender.value
		enabledButton()
	}
	
	@IBAction func pressCalculete(_ sender: UIButton) {
		performSegue(withIdentifier: Constant.resultSegue, sender: self)
		
	}
	
	func enabledButton() {
		if countStepper?.text != "0" && textField.text != "" {
			buttonCalculate.isEnabled = true
		}
		
	}
	
	
	//precisa dessa  funcao para mandar para a outra screnn o valor que deseja
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == Constant.resultSegue  {
			let destination = segue.destination as! ResultController
			//acount e uma propriedade que esta na outra screen
			destination.totalAcount = 	resultModel.calculePerPerson()
			destination.totalDiscount = discountSelect ?? "0%"
			destination.totalPeople = countStepper.text ?? "0"
		}
		
	}
	
}

extension ViewController:UITextFieldDelegate {
	
	func textFieldShouldReturn(_ input: UITextField) -> Bool {
		textField.endEditing(true)
		return true
	}
	
	
	func textFieldShouldEndEditing(_ input: UITextField) -> Bool {
		if input.text == "" {
			textField.text = "Please insert something here"
			return false
		}else {
			textField.placeholder = "e.g 123"
			return true
		}
	}
	
	func textFieldDidEndEditing(_ input: UITextField) {
		if input.text != ""{
			if let value =  input.text{
				enabledButton()
				resultModel.valueAccount = Double(value) ?? 0
			}
		}else {
			textField.text = ""
		}
		
	}
	
	
}
