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
	private var Player1: Player?
	private var Player2: Player?
	
	//	init() {
	//		create()
	//	}
	
	//	func start(player1 P1: Player, player2 P2: Player) {
	func start() {
		print("ALLLRIIIGTH! LET THE RUN BEGIIIIIIIIIIIIIIIIN\n")
		
		var whoTurn = true
		guard let P1 = Player1 else {return}
		guard let P2 = Player2 else {return}
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
		
		
		guard let bam = attak.motoInLife.first else {return}
		guard let aie = victim.motoInLife.first else {return}
		
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
		Player1 = Player(name: p1Name, team: p1Team)
		Player2 = Player(name: p2Name, team: p2Team)
		
		guard let P1 = Player1 else {return}
		guard let P2 = Player2 else {return}
		
		//		print("--------------- \(player1.name) ---------------")
		//		player1.printMotoInLife()
		//		print("--------------- \(player2.name) ---------------")
		//		player2.printMotoInLife()
		
		print("--------------- \(P1.name) ---------------")
		P1.printMotoInLife()
		print("--------------- \(P2.name) ---------------")
		P2.printMotoInLife()
		
		//		start(player1: P1, player2: P2)
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
	
	func createYamasaki(name: String) -> Moto {
		print("You choose yamasaki, right choice.\n")
		
		return Yamasaki(name: name)
	}
	
	func createNobrake(name: String) -> Moto {
		print("You choose to not have no brake.\n")
		
		return Nobrake(name: name)
	}
	
	func createDieudlapan(name: String) -> Moto {
		print("You choose... ooooh... Hope you have a good mecanic man.\n")
		
		return Dieudlapan(name: name)
	}
	
	func createMowerBrand(name: String) -> Moto {
		print("You choose a mower, oh sorry.\n")
		
		return MowerBrand(name: name)
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
			var check = true
			var name: String
			
			repeat {
				choice = Tools.shared.readLineInt()
			} while !(1...4 ~= choice)
			//----------------------check les double nom-----------------------------
			repeat {
				name = askName(message: "name your bike")
				
				check = true
				team.forEach { (moto) in
					if moto.name == name {
						check = false
					}
				}
				
//				for moto in team {
////					print("\n\nAWDBWAKJBDKJHAWBDHJKAWBDKJWAB\n\n")
////					check = true
////					print("**********\(moto.name)************")
//					if moto.name == name {
//						print("name already taken, choose another")
//						check = false
//					}
//				}
				
			} while check != true
			//---------------------mais ca marche pas---------------------------------
			switch choice {
			case 1:
				team.append(createYamasaki(name: name))
			case 2:
				team.append(createNobrake(name: name))
			case 3:
				team.append(createDieudlapan(name: name))
			case 4:
				team.append(createMowerBrand(name: name))
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
