//
//  main.swift
//  hangman_project
//
//  Created by Phillip Bryan on 7/12/19.
//  Copyright © 2019 Phillip Bryan. All rights reserved.
//

import Foundation

// MARK: Word List
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

let congratulatoryText = ["Good Job", "Nice Work", "Congratulations", "Bravo", "Way To Go", "You Rock", "Well Done", "Atta Boy", "Nice Going", "Admirable", "Magnificent", "Nice One", "Excellent Job", "Splendid", "Superior", "Smashing", "Spectacular", "Congrats", "Thumbs Up", "You're Fantastic", ]

let encouragementText = ["Try Again", "Give It Another Try", "Give It Another Shot", "Redo", "Retry", "Give It Another Attempt", "Keep Trying", "Do It Again", "Give It Another Go", "Take Another Run At It", "Here Is A Fresh Attempt", "Here Go Yet Another Attempt", "Try Once More", "We Are Going To Do This Again", "You Can Do This"]

let lettersThatCanBeUsed = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

// MARK: Game Properties
let maxNumberOfGuesses = 6
var guessesUsed = 0
var guessesRemaining = Int()
var playAgain = Character("N")
var playAgainCounter = Int()
var gameWord = String()
var letterFreqency = [String : [Int]]()
var lettersUsed = [Character]()
var wordDisplay = [String]()
var wordsUsed = [String]()

// MARK: Functions
func getRandomWord() -> String {
    if let randomWord = allTheWords.randomElement(), !wordsUsed.contains(randomWord){
        wordsUsed.append(randomWord)
        return randomWord
    } else { return "Error: Please Try Again."}
}

func gatherWordInfoAndSetup() {
    gameWord = getRandomWord()
    letterFreqency = [String : [Int]]()
    lettersUsed = [Character]()
    wordDisplay = [String]()
    guessesUsed = 0
    guessesRemaining = maxNumberOfGuesses
    
    for (index,letter) in gameWord.enumerated() {
        wordDisplay.append("__") // make empty spaces add to display array
        // populate letterFrequency
        if var letterIndexArray = letterFreqency[String(letter)] {
            letterIndexArray.append(index)
            letterFreqency[String(letter)] = letterIndexArray
        } else { letterFreqency[String(letter)] = [index] }
    }
}
func updateWordDisplay(arr: [Int], guess: String) {
    for index in arr { wordDisplay[index] = guess }
}
func displayWord() {
    print("-----------------------------------------------------")
    print("\nWhat's this word: ", terminator: "")
    for str in wordDisplay { print(str, terminator: " ") }
    print("\n")
    print("Letters Used: ", terminator: "")
    for letter in lettersUsed.sorted() { print(letter, terminator: " ") }
    print()
}
func handleGuess() {
    print("Guess a letter: ", terminator: "")
    guard let userGuess = readLine() else { return }
    if userGuess.count > 1 || userGuess == "" || !lettersThatCanBeUsed.contains(userGuess){
        print("\nInput is invalid.\n")
        return
    } else {
        if lettersUsed.contains(Character(userGuess)) {
            print("\nThat was already used.\n")
            return
        }
        lettersUsed.append(Character(userGuess))
        // Correct Guess
        if let indexArray = letterFreqency[userGuess] {
            guessesUsed += 1
            if guessesUsed == letterFreqency.keys.count {
                print("\nYou Win!!!!!")
                print("The word was: \(gameWord)\n")
                print("Correct Guesses: \(guessesUsed) Incorrect Guesses: \(maxNumberOfGuesses - guessesRemaining)")
                print("-----------------------------------------------------")
                guessesRemaining = 0
                return
            }
            print("\n\(congratulatoryText.randomElement() ?? "Good Job")!" , "Number of correct letters picked: \(guessesUsed) out of \(letterFreqency.keys.count)") // Correct Guess function
            updateWordDisplay(arr: indexArray, guess: userGuess)
            displayWord()
        } else { // Incorrect Guess
            guessesRemaining -= 1
            if guessesRemaining == 0 {
                print("\nYou Lose!!!!!")
                print("The word was: \(gameWord)")
                print("-----------------------------------------------------")
                return
            }
            print("\n\(encouragementText.randomElement() ?? "Try Again").") // incorrect guess function goes here
            print("Number of wrong guesses remaining: \(guessesRemaining)\n", separator: "\n")
            displayWord()
        }
    }
}

func restartGameCheck() {
    playAgainCounter = 0
    print("Do you want to play again? (y/n)", terminator: " ")
    if let checkPlayAgain = readLine() {
        switch checkPlayAgain.lowercased() {
        case "yes", "yea", "y", "sure":
            playAgain = "y"
        default:
            playAgain = "n"
        }
    }
}
// MARK: Game Loop
repeat {
    gatherWordInfoAndSetup()
    displayWord()
    while guessesRemaining > 0 {
        handleGuess()
    }
    restartGameCheck()
} while playAgain == "y"

print("\nThank you for playing!\n")
