/*
 Homework #2
 Antonio Campbell-Rodriguez
 September 2, 2026
 */

let greetings = [
    "Hello",
    "Hi",
    "Good morning",
    "Good afternoon",
    "Good night"
]

let names = [
    "Anna": 8,
    "Bob": 11,
    "Brian": 19,
    "Jack": 65,
    "Alex": 10
]

for (name, age) in names
{
    let randomNumber = Int.random(in: 0..<greetings.count)
    print("\(greetings[randomNumber]), \(name)! Happy \(age)th birthday!")
    switch age {
    case 0..<18:
        print("You are still a child.")
    case 18...25:
        print("You are a young adult.")
    case 26...65:
        print("You are an adult.")
    default:
        print("You are a senior.")
    }
    print()
}

