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
	
	func testPrintTeam(team: [Moto]) {
		team.enumerated().forEach { (index, moto) in
			print("\(index + 1) : \(moto.name) (\(moto.type) \(moto.life) LP - (\(moto.motor.power)) WD")
		}
	}
}
