//
//  Moto.swift
//  Watata_run
//
//  Created by bouh on 15/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation

class Moto {
	var name: String
	var type: String
	var lifeMax: Int
	var life: Int
	var motor: Motor		//wapeons
	
	init(name: String, type: String, life: Int, lifeMax:Int, motor: Motor) {
		self.name = name
		self.type = type
		self.lifeMax = lifeMax
		self.life = life
		self.motor = motor
	}
	// Attaque
	func gaz(target: Moto, player: Player) {
		target.life -= motor.power
		
		print("\(self.name) pass \(target.name) for \(target.motor.power) KM\n")
		
		if target.life <= 0 {
			target.life = 0
			print("Oh ! \(target.name) of \(player.name) is out of the race !")
			player.nbDies += 1
			player.motoInLife.removeAll { (moto) -> Bool in
				return target.name == moto.name ? true : false
			}
			player.motoDead.append(target)
		}
	}
	
	func heal() {
		let percentHeal = lifeMax * 12 / 100
		
		life += percentHeal
		
		//Check if overflow for life
		if (life > lifeMax)
		{
			life = lifeMax
		}

		print("\(name) stay at the paddoc, need check-up !")
		print("\(name) be repaired for \(percentHeal) KM\n")
		print("\(name) km : \(life)")
	}
}
