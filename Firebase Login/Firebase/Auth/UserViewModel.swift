//
//  UserViewModel.swift
//  Firebase Login
//
//  Created by Adrian De León on 18/10/22.
//

import Foundation

struct UserViewModel {
    var email: String = ""
    var password: String = ""
    var fullName: String = ""
    var confirmPassword: String = ""
    
    // MARK: Validation Checks
    
    func passwordsMatch(_confirmPassword: String) -> Bool {
        return _confirmPassword == password
    }
    
    func isEmpty(_field: String) -> Bool {
        return _field.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func isEmailValid(_email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: _email)
    }
    
    func isPasswordValid(_password: String) -> Bool {
        // Password must be 8 chars, contain a capital letter and a number
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        return passwordTest.evaluate(with: _password)
    }
    
    var isSignInComplete: Bool {
        if !isEmailValid(_email: email) ||
            isEmpty(_field: fullName) ||
            !isPasswordValid(_password: password) ||
            !passwordsMatch(_confirmPassword: confirmPassword) {
            return false
        }
        return true
    }
    
    var isLoginComplete: Bool {
        if isEmpty(_field: email) ||
            isEmpty(_field: password) {
            return false
        }
        return true
    }
    
    // MARK: Validation Error Strings
    var validNameText: String {
        if !isEmpty(_field: fullName) {
            return ""
        } else {
            return "Enter your full name"
        }
    }
    
    var validEmailAddressText: String {
        if isEmailValid(_email: email) {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    var validPasswordText: String {
        if isPasswordValid(_password: password) {
            return ""
        } else {
            return "Must be 8 characters containing at least one number and one capital letter"
        }
    }
    
    var validConfirmPasswordText: String {
        if passwordsMatch(_confirmPassword: confirmPassword) {
            return ""
        } else {
            return "Password fields do not match"
        }
    }
}
