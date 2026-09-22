// Assignment #4
// Full Name: Antonio Campbell-Rodriguez
// Date: September 15, 2026

@propertyWrapper
struct NonEmpty {
    private var value: String
    var wrappedValue: String {
        get {
            value
        }
        set {
            if newValue.isEmpty {
            } else {
                value = newValue
            }
        }
    }
    init(wrappedValue: String) {
        self.value = wrappedValue
    }
}
struct Student {
    @NonEmpty var firstName: String
    @NonEmpty var lastName: String
}
var student = Student(firstName: "John", lastName: "Smith")
print(student.firstName)
print(student.lastName)
student.firstName = ""
print(student.firstName)
student.lastName = ""
print(student.lastName) // Smith

/*
 Explanation:
 The NonEmpty property wrapper prevents a String property from becoming an empty string. When an empty string is assigned, the setter does nothing, so the previous non-empty value remains unchanged.
In this test, firstName was originally "John". When I attempted to assign an empty string, firstName remained "John". Similarly, lastName remained
 "Smith" after attempting to assign an empty string.
Therefore, the behavior I defined is to ignore empty-string assignments and preserve the existing value.
*/

