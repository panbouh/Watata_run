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
	var nbCheated: Int = 0
 
	init(name: String, team: [Moto]) {
		self.name = name
		team.forEach { (moto) in
			self.motoInLife.append(moto)
		}
	}

	func printMotoInLife() {
		print("#----------------- \(name) Bike -----------------#")
		motoInLife.enumerated().forEach { (index, moto) in
			print("   \(index + 1) : \(moto.name) (\(moto.type) \(moto.life) KM - (\(moto.motor.power)) POW")
		}
		print("#------------------------------------------------#\n")
	}
	
	func printCard() {
		var team: [Moto] = motoDead + motoInLife
		team.sort {
			$0.name < $1.name
		}
		
		print("#----------------- \(name) card -----------------#")
		team.enumerated().forEach { (index, moto) in
			print("   \(index + 1) : \(moto.name) (\(moto.type)) ", terminator: "")
			if (moto.life > 0)
			{
				print("\(moto.life) KM", terminator: "")
			} else
			{
				print("Dead", terminator: "")
			}
			print(" - (\(moto.motor.power)) POW")
		}
		print("#-----------------------------------------------#\n")
	}
}
