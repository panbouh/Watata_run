//
//  game.swift
//  Watata_run
//
//  Created by bouh on 13/08/2020.
//  Copyright © 2020 bouh. All rights reserved.
//

import Foundation

class	Game
{
	private var Player1: Player?
	private var Player2: Player?
	var nbTurn: Int = 0
	
	
	func create() {
		
		// Take information from user
		print("#---------------------------------------------------#\n" +
				" |   _ __o                                 _ __o   |\n" +
				" |    `\\<,)     Welcome in Watata RUNS !    `\\<,)  |\n" +
				" | (*)---(*)                             (*)---(*) |\n" +
				"#---------------------------------------------------#\n" +
				"\n" +
				"Be ready for the most famous and epic race of your LIIIIIFE !\n" +
				"But for now, let me introduce you our chalenger for this run\n" +
				"\n" +
				"#---------------------------------------------------#\n")
		
		let p1Name = askName(message: "-Runner 1 Annonce your name-")
		print("\n")
		let p2Name = askName(message: "-Runner 2 Annonce your name-")
		print("\n")
		print("#---------------------------------------------------#\n")

		// Initialize PLayer 1
		let p1Team = selectTeam(who: p1Name)
		Player1 = Player(name: p1Name, team: p1Team)
		guard let P1 = Player1 else {return}
		P1.printMotoInLife()
		
		print("#---------------------------------------------------#\n")
		
		// Initialize PLayer 2
		let p2Team = selectTeam(who: p2Name)
		Player2 = Player(name: p2Name, team: p2Team)
		guard let P2 = Player2 else {return}
		P2.printMotoInLife()
		
		print("#---------------------------------------------------#\n")
		print("At my right, his name is \(P1.name), at my left : \(P2.name)!\n" +
				"Theese pilot have both 3 bike, the last man up win !\n" +
				"\n" +
				"ALLLRIIIGTH! LET THE RUN BEGIIIIIIIIIIIIIIIIN\n" +
				"\n")
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
				print("/!\\ Well.... Choose a real name. /!\\")
			}
		} while check == false
		
		return name
	}
	
	func start() {
		var whoTurn = true
		guard let P1 = Player1 else {return}
		guard let P2 = Player2 else {return}
		
		// Main loop
		repeat {
			nbTurn += 1
			if (whoTurn) {			// P1 Turn
				turn(Runner: P1, Oppenent: P2)
				whoTurn = false
			}
			else if (!whoTurn) {	// P2 Turn
				turn(Runner: P2, Oppenent: P1)
				whoTurn = true
			}
		} while P1.nbDies != 3 && P2.nbDies != 3
		
		// End of game
		if (P1.nbDies > P2.nbDies) {
			displayWinner(win: P2, los: P1)
		} else {
			displayWinner(win: P1, los: P2)
		}
	}
	
	func turn(Runner: Player, Oppenent: Player)
	{
		//ask player with what moto attak
		print("-Select your runner-\n")
		Runner.printMotoInLife()
		let run = Tools.shared.makeChoiceInt(between: 1...Runner.motoInLife.count)
		
		//ask player who attack with
		print("-Select your oppenent-\n\n   0 : Stay Stand to be repaired\n")
		Oppenent.printMotoInLife()
		let opp = Tools.shared.makeChoiceInt(between: 0...Oppenent.motoInLife.count)
		
		//lunch run
		//		if heal
		if (opp == 0)
		{
			StayPaddoc(Broken: Runner.motoInLife[run-1])
		}
		else
		{
			LunchRun(attak: Runner.motoInLife[run-1], victim: Oppenent.motoInLife[opp-1], attOwn: Runner, vicOwn: Oppenent)
		}
	}
	
	func StayPaddoc(Broken: Moto)
	{
		if (Broken.life >= Broken.lifeMax)
		{
			print("Your bike if fine, go run.")
		}
		else
		{
			Broken.heal()
		}
	}
	
	func LunchRun(attak: Moto, victim: Moto, attOwn: Player, vicOwn: Player) {
		let boostChest: Bool = Tools.shared.randNb()
		
		// Random chest feature
		let oldMotor = attak.motor
		if boostChest {
			print("/!\\ ------------------------------------------------/!\\\n" +
					"   Oh! Someone throw a COMPRESSOR on the track !\n" +
					"   \(attak.name) Equiped it on his bike!\n" +
					"/!\\ ------------------------------------------------/!\\\n")
			attak.motor = Compressor()
		}
		
		attak.gaz(target: victim, player: vicOwn)
		
		// Remove avantage from random chest
		if (boostChest) {
			print("\(attak.name) trow away his compressor, not seen not caught.\n")
			attak.motor = oldMotor
			attOwn.nbCheated += 1;
		}
	}
	
	func createYamasaki(name: String) -> Moto {
		print("\nYou choose yamasaki, right choice.\n")
		
		return Yamasaki(name: name)
	}
	
	func createNobrake(name: String) -> Moto {
		print("\nYou choose to not have no brake.\n")
		
		return Nobrake(name: name)
	}
	
	func createDieudlapan(name: String) -> Moto {
		print("\nYou choose... ooooh... Hope you have a good mecanic man.\n")
		
		return Dieudlapan(name: name)
	}
	
	func createMowerBrand(name: String) -> Moto {
		print("\nYou choose a mower, oh sorry.\n")
		
		return MowerBrand(name: name)
	}
	
	func selectTeam(who: String) -> [Moto] {
		
		var team: [Moto] = [Moto]()
		
		print("-\(who) Choose your team-")
		
		// Ask the team
		repeat {
			print("Choose your \(team.count + 1) bike :\n"
					+ "1. Yamasaki\n"
					+ "2. Nobrake\n"
					+ "3. Dieudlapan\n"
					+ "4. Mowerbrand \n")
			
			var choice: Int
			var check = true
			var name: String
			
			// Be sure that the Int given by the user is correct
			choice = Tools.shared.makeChoiceInt(between: 1...4)
			
			repeat {
				// Be sure that the name given by the user is correct
				name = askName(message: "-name your bike-")
				
				check = true
				// Be sure that the name given by the user isn't alreasy taken
				team.forEach { (moto) in
					if moto.name == name {
						print("/!\\ name already taken, choose another /!\\")
						check = false
					}
				}
			} while check != true
			
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
				print("Error")
			}
		} while team.count < 3
		return team
	}
	
	func displayWinner(win: Player, los: Player) {
		print("\n#---------------------------------------------------#\n\n")
		print("And we have a WIIIINEER, \(win.name) have run over all his oppenemt team !\n" +
				"Thanks you for you to come here, and see you to the next run !\n" +
				"\n")
		
		print("#------------------ Result Bord --------------------#\n" +
				"Winner : [\(win.name)] ------ Looser : [\(los.name)]\n" +
				"this race end in \(nbTurn) turn\n\n" +
				"Pilot card :\n")

		win.printCard()
		los.printCard()
		
		print("\n\n\n\n\n" +
				"\(win.name) had cheated \(win.nbCheated) time, \(los.name) \(los.nbCheated) time.)\n" +
				"#---------------------------------------------------#\n")
	}
}
