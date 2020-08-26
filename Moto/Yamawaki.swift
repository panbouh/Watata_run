//
//  Yawasaki.swift
//  Watata_run
//
//  Created by bouh on 15/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation

class Yamasaki: Moto {
	
	static let type = "Yamasaki"
	static let life = 800
	static let motor = FourCyl()
	
	init(name: String){
		super.init(name: name, type: "Yamasaki", life: 800, motor: FourCyl())
	}
}
