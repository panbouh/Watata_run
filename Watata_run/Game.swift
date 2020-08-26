//
//  game.swift
//  Watata_run
//
//  Created by bouh on 13/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation

class	Game  //crash if many bike have same name
{
	//	var P1: Player
	//	var P2: Player
	
	//	init() {
	//		create()
	//	}
	
	func start(player1 P1: Player, player2 P2: Player) {
		print("ALLLRIIIGTH! LET THE RUN BEGIIIIIIIIIIIIIIIIN\n")
		
		var whoTurn = true
		
		repeat {
			
			if (whoTurn) {// P1 Turn
				run(attak: P1, victim: P2)
				whoTurn = false
			}
			else if (!whoTurn) {
				run(attak: P2, victim: P1)
				whoTurn = true
			}
			
			print("++++++++++++++BOUCLE+++++++++++")
			
		} while P1.nbDies != 3 && P2.nbDies != 3
		
		
		if (P1.nbDies > P2.nbDies) {
			displayWinner(win: P2, los: P1)
		} else {
			displayWinner(win: P1, los: P2)
		}
		//		displayWinner(win: P1.nbDies>P2.nbDies, los: P2.nbDies>P1.nbDies)
	}
	
	func run(attak: Player, victim: Player) {
		print("------- \(attak.name) turn. team : \(attak.motoInLife.count)----\n")
		
		let boostChest = Bool.random()
		

		guard let bam = attak.motoInLife.first else {print("BAM ERROR"); exit(-1)}
		guard let aie = victim.motoInLife.first else {print("AIE ERROR"); exit(-1)}
		
		let oldMotor = bam.motor
		if boostChest {
			print("+++++++++++++++++++++\nOh! A treasure chest is appear, it contain a COMPRESSOR\n"
				+ "\(attak.name) Equiped it on his bike!\n++++++++++++++++++\n")
			bam.motor = Compressor()
		}
		
		bam.gaz(target: aie, player: victim)
		
		if (boostChest) {
			print("\(attak.name) lost his compressor")
			bam.motor = oldMotor
		}
		print("------------------------\n")
	}
	
	func create() {
		
		// Take information from user
		print("Welcome in Watata RUNS !\n")
		
		let p1Name = askName(message: "player 1 Annonce your name :\n")
		let p2Name = askName(message: "player 2 Annonce your name :\n")
		
		print("p1 = \(p1Name)\np2 = \(p2Name)\n")
		
		print("wewewelll wellll! Now tell us with what beast you will figt!\n")
		
		let p1Team = selectTeam(who: p1Name)
		let p2Team = selectTeam(who: p2Name)
		
		// Initialize PLayer
		let P1 = Player(name: p1Name, team: p1Team)
		let P2 = Player(name: p2Name, team: p2Team)
		
		print("--------------- \(P1.name) ---------------")
		P1.printMotoInLife()
		print("--------------- \(P2.name) ---------------")
		P2.printMotoInLife()
		
		start(player1: P1, player2: P2)
	}
	
	func askName(message: String) -> String {
		var name : String = ""
		var check : Bool = false
		
		print(message)
		
		repeat {
			name = Tools.shared.readLineString()
			if name != "" {
				check = true
			} else {
				print("Well.... Choose a real name.")
			}
		} while check == false
		
		return name
	}
	
	func createYamasaki() -> Moto {
		print("You choose yamasaki, right choice.\n")
		
		return Yamasaki(name: askName(message: "name your bike"))
	}
	
	func createNobrake() -> Moto {
		print("You choose to not have no brake.\n")
		
		return Nobrake(name: askName(message: "name your bike"))
	}
	
	func createDieudlapan() -> Moto {
		print("You choose... ooooh... Hope you have a good mecanic man.\n")
		
		return Dieudlapan(name: askName(message: "name your bike"))
	}
	
	func createMowerBrand() -> Moto {
		print("You choose a mower, oh sorry.\n")
		
		return MowerBrand(name: askName(message: "name your bike"))
	}
	
	func selectTeam(who: String) -> [Moto] {
		
		var team: [Moto] = [Moto]()
		
		print("\(who) Annonce your bikes!")
		
		repeat {
			print("Choose your \(team.count + 1) motocycle :\n"
				+ "1. Yamasaki\n"
				+ "2. Nobrake\n"
				+ "3. Dieudlapan\n"
				+ "4. Mowerbrand \n")
			
			var choice: Int
			repeat {
				choice = Tools.shared.readLineInt()
			} while !(1...4 ~= choice)
			
			switch choice {
			case 1:
				team.append(createYamasaki())
			case 2:
				team.append(createNobrake())
			case 3:
				team.append(createDieudlapan())
			case 4:
				team.append(createMowerBrand())
			default:
				print("Error");
			}
		} while team.count < 3
		
		Tools.shared.testPrintTeam(team: team)
		print("----------END\n----------") //debug
		return team
	}
	
	
	func displayWinner(win: Player, los: Player) {
		print("win: \(win.name)\nlos: \(los.name)\n")
	}
}



//	func askNName(n: Int, who: String) -> [String] {
//		var tabChar : [String] = [String]()
//
//		repeat {
//			print("\(who) -> \(tabChar.count + 1) : ")
//			var check : Bool = false
//
//			repeat {
//				let name = Tools.shared.readLineString()
//				if !tabChar.contains(name) {
//					check = true
//					tabChar.append(name)
//				} else {
//					print("\(name) is already taken\n")
//				}
//			} while check == false
//
//		} while tabChar.count != n
//
//		return tabChar
//	}
