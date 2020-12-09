//
//  tools.swift
//  Watata_run
//
//  Created by bouh on 13/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation


class Tools	{
	
	static let shared : Tools = Tools()
	
	func readLineString() -> String {
		
		let str = readLine()
		
		guard let strData = str else { return "Error" }
		
		return strData
	}
	
	func readLineInt() -> Int {
		
		let str = readLine()
		
		guard let strData = str, let strDataInt = Int(strData) else { return -1 }
		
		return strDataInt
	}
	
	// Be sure that the Int given by the user is correct
	func makeChoiceInt(between: ClosedRange<Int>) -> Int
	{
		var choice: Int = 0
		var fistTime: Bool = true
		
		repeat {
			if !fistTime {
				print("Incorrect choice, please select other\n")
			}
			choice = Tools.shared.readLineInt()
			fistTime = false
		} while !(between ~= choice)
		return choice
	}
	
	// Conditional random
	func randNb() -> Bool {
		let nb: Int = Int.random(in: 1...10)
		
		if (nb > 2) {
			return false
		}
		else {
			return true
		}
	}
}
