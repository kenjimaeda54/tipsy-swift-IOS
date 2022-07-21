//
//  ResultModel.swift
//  Tipsy
//
//  Created by kenjimaeda on 20/07/22.
//

import Foundation

struct ResultModel {
	var quatityPerson: Double = 0.0
	var valueAccount: Double = 0.0
	var valueDiscount: Double = 0.0

 
	mutating func calculePerPerson () -> String {
		let discontPercent = valueDiscount / 100
		let perPerson = (valueAccount -  (valueAccount * discontPercent)) / quatityPerson
		return String(format: "%.2f", perPerson)
		
	}
	

	
}
