//
//  Marquez.swift
//  Watata_run
//
//  Created by bouh on 25/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation

class MowerBrand: Moto {
	
	static let type = "MowerBrand"
	static let lifeMax = 2000
	static let life = 2000
	static let motor = Twin()
	
	init(name: String){
		super.init(name: name, type: "MowerBrand", life: 2000, lifeMax: 2000, motor: Twin())
	}
}
