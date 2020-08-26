//
//  Nobrake.swift
//  Watata_run
//
//  Created by bouh on 25/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation

class Nobrake: Moto {
	
	static let type = "Nobrake"
	static let life = 1000
	static let motor = VTwin()
	
	init(name: String){
		super.init(name: name, type: "Nobrake", life: 1000, motor: VTwin())
	}
}
