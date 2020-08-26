//
//  Dieudlapan.swift
//  Watata_run
//
//  Created by bouh on 25/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation

class Dieudlapan: Moto {
	
	static let type = "Dieudlapan"
	static let life = 500
	static let motor = VFour()
	
	init(name: String){
		super.init(name: name, type: "Dieudlapan", life: 500, motor: VFour())
	}
}
