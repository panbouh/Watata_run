//
//  Player.swift
//  Watata_run
//
//  Created by bouh on 24/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation

class Player {
	var name: String
	var motoInLife: [Moto] = [Moto]()
	var motoDead: [Moto] = [Moto]()
	var nbDies: Int = 0
 
	init(name: String, team: [Moto]) {
		self.name = name
		team.forEach { (moto) in
			self.motoInLife.append(moto)
		}
	}

	func printMotoInLife() {
		motoInLife.enumerated().forEach { (index, moto) in
			print("\(index + 1) : \(moto.name) (\(moto.type) \(moto.life) LP - (\(moto.motor.power)) WD")
		}
	}
	
	func printMotoDead() {
		motoDead.enumerated().forEach { (index, moto) in
			print("\(index + 1) : \(moto.name) (\(moto.type) - Out")
		}
	}
	

}
