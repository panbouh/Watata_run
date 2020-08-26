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
	var life: Int
	var motor: Motor		//wapeons
	
	init(name: String, type: String, life: Int, motor: Motor) {
		self.name = name
		self.type = type
		self.life = life
		self.motor = motor
	}
	
	func gaz(target: Moto, player: Player) {			// Attaque
		target.life -= motor.power
		
		print("\(self.name) attaque \(target.name) pour \(target.motor.power) damage\n")
		
		if target.life <= 0 {
			target.life = 0
			print("/!\\ \(target.name) of \(player.name) is dead /!\\")
			player.nbDies += 1
			player.motoInLife.removeAll { (moto) -> Bool in
				return target.name == moto.name ? true : false
			}
			player.motoDead.append(target)
		}
	}

//	func getOverpassed (byWho: Motor) {	// Attaque
//		self.speed -= byWho.power
//			print("\(self.brand)")
//	}
}
