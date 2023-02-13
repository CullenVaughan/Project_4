//
//  PromptLogic.swift
//  MyAdventure
//
//  Created by user234052 on 2/12/23.
//

import Foundation

struct PromptLogic {
    let MAX_DECISION_TREE_DEPTH = 3
    var currentCoordinates : String = "0,0"
    let prompts = [
        "0,0" : Prompt(
            "You are in a cave there is two paths ahead of you. There is wind coming from the left opening. The air on the right side is still and stuffy",
            "Go left",
            "Go right",
            "0-0"
        ),
            "1,0" : Prompt(
                "The left opening goes to the outside of the cave. There is a beach straight ahead of you. To the left of you is a river.",
                "Go straight",
                "Go left",
                "1-0"
            ),
                "2,0" : Prompt(
                    "On the beach you see a house on a cliff and in the water is a shipwreck.",
                    "Go up the cliff",
                    "Go in the water",
                    "2-0"
                ),
                    "3,0" : Prompt(
                        "As you enter the house the cliff breaks off and you fall to your death.",
                        "Restart",
                        "Restart",
                        "3-0"
                    ),
                    "3,1" : Prompt(
                        "When you enter the water a rip current sweeps you off of your feet and takes you out into the open ocean.",
                        "Restart",
                        "Restart",
                        "3-1"
                    ),
                "2,1" : Prompt(
                    "When you get to the river there is a misty town to the left of you and straight ahead of you is a boat.",
                    "Walk to the town",
                    "Get in the boat",
                    "2-1"
                ),
                    "3,2" : Prompt(
                        "As you enter the town you feel your mind clouding up and you forget who you are.",
                        "Restart",
                        "Restart",
                        "3-2"
                    ),
                    "3,3" : Prompt(
                        "While going along in the river alot of crocodiles attack your boat and sink it and you are eaten.",
                        "Restart",
                        "Restart",
                        "3-3"
                    ),
        "1,1" : Prompt(
            "On the right side goes deaper into the cave. There is a mineshaft ahead of you and further in you hear water.",
            "Go down",
            "Go straight",
            "1-1"
        ),
            "2,2" : Prompt(
                "In the mineshaft you see something shine at the bottom and to the side of you is a minecart.",
                "Go down",
                "Get in the minecart",
                "2-2"
            ),
                "3,4" : Prompt(
                    "When you reach the bottom of the mineshaft you see a big pile of gold. As you go to touch it you are suddenly awake in your bedroom. It was all just a dream.",
                    "Restart",
                    "Restart",
                    "3-4"
                ),
                "3,5" : Prompt(
                    "When you get in the minecart it starts to rush down the tracks and into a pit of lava.",
                    "Restart",
                    "Restart",
                    "3-5"
                ),
            "2,3" : Prompt(
                "You enter an open area of the cave and going through the middle of it is a underground river. On the other side of the river is a mountain of gems. To cross the river do you swim across it or do you go onto some rocks that go across it?",
                "Swim",
                "The rocks",
                "2-3"
            ),
                "3,6" : Prompt(
                    "As soon as you are in the river you get dragged underwater and you are drowned to death.",
                    "Restart",
                    "Restart",
                    "3-6"
                ),
                "3,7" : Prompt(
                    "While the rocks where a bit unsteady at times you still made it across to the other side of the river and to the mountain of gems that will last you a lifetime.",
                    "Restart",
                    "Restart",
                    "3-7"
                )
    ]
    
    mutating func compareUserChoice(_ key: String, _ choice: String) {
        var newCoordinates : String = ""
        let x : Int? = Int(currentCoordinates.components(separatedBy: ",")[0])
        let y : Int? = Int(currentCoordinates.components(separatedBy: ",")[1])
        var newX : Int
        var newY : Int
        
        if choice == prompts[key]?.option_one {
            newX = x! + 1
            newY = y! * 2
            newCoordinates = String(newX) + "," + String(newY)
        } else {
            newX = x! + 1
            newY = (y! * 2) + 1
            newCoordinates = String(newX) + "," + String(newY)
        }
        
        if newX > MAX_DECISION_TREE_DEPTH {
            currentCoordinates = "0,0"
        } else {
            currentCoordinates = newCoordinates
        }
    }
    
    func getPrompt(_ key: String) -> String? {
        guard let prompt = prompts[key]?.prompt else { return ""}
        return prompt
    }
    
    func getSpecifiedOption(_ key: String, _ option: Int) -> String? {
        guard let retOption = option == 0 ? prompts[key]?.option_one : prompts[key]?.option_two else { return "" }
        return retOption
    }
    
    func getCurrentCoordinates() -> String {
        return currentCoordinates
    }
    
    func getBackgroundImage() -> String {
        guard let retImageName = prompts[currentCoordinates]?.image else { return ""}
        return retImageName
    }
}
