/*
Assignment 3
Your First and Last Name
September 8, 2026
*/
// MARK: - Celsius to Fahrenheit
let c2f: (Int) -> Float = { (celsius: Int) -> Float in
return Float(celsius) * 9 / 5 + 32
}

// MARK: - Fahrenheit to Celsius
let f2c: (Int) -> Float = { (fahrenheit: Int) -> Float in
return (Float(fahrenheit) - 32) * 5 / 9
}

// MARK: - Celsius to Kelvin
let c2k: (Int) -> Float = { (celsius: Int) -> Float in
return Float(celsius) + 273.15
}

// MARK: - Kelvin to Celsius
let k2c: (Int) -> Float = { (kelvin: Int) -> Float in
return Float(kelvin) - 273.15
}

// MARK: - Fahrenheit to Kelvin
let f2k: (Int) -> Float = { (fahrenheit: Int) -> Float in
return (Float(fahrenheit) - 32) * 5 / 9 + 273.15
}

// MARK: - Kelvin to Fahrenheit
let k2f: (Int) -> Float = { (kelvin: Int) -> Float in
return (Float(kelvin) - 273.15) * 9 / 5 + 32
}

// MARK: - Higher-Order Function
func convertTemperature(_ temperature: Int, using conversion: (Int) -> Float) -> Float {
return conversion(temperature)
}

// MARK: - Testing Celsius and Fahrenheit
let fahrenheit = c2f(25)
print("25°C is (fahrenheit)°F")

let celsius = f2c(77)
print("77°F is (celsius)°C")

let tempInF = convertTemperature(25, using: c2f)
print("25°C = (tempInF)°F")

let tempInC = convertTemperature(77, using: f2c)
print("77°F = (tempInC)°C")

// MARK: - Testing Celsius and Kelvin

let tempInK = convertTemperature(0, using: c2k)
print("0°C = (tempInK) K")

let tempInCelsius = convertTemperature(273, using: k2c)
print("273 K = (tempInCelsius)°C")

// MARK: - Testing Fahrenheit and Kelvin

let tempInKelvin = convertTemperature(32, using: f2k)
print("32°F = (tempInKelvin) K")

let tempInFahrenheit = convertTemperature(300, using: k2f)
print("300 K = (tempInFahrenheit)°F")
