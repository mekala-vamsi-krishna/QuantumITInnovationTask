//
//  LoginViewController.swift
//  Quantum IT
//
//  Created by Mekala Vamsi Krishna on 22/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInApple: UIButton!
    @IBOutlet weak var signInGoogle: UIButton!
    @IBOutlet weak var signInFB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createAccountBtn.layer.borderColor = UIColor.systemBlue.cgColor
        createAccountBtn.layer.borderWidth = 1
        createAccountBtn.layer.masksToBounds = false
        
        signInApple.layer.borderColor = UIColor.black.cgColor
        signInApple.layer.borderWidth = 1
        signInApple.layer.masksToBounds = false
        
        signInGoogle.layer.borderColor = UIColor.black.cgColor
        signInGoogle.layer.borderWidth = 1
        signInGoogle.layer.masksToBounds = false
        
        signInFB.layer.borderColor = UIColor.black.cgColor
        signInFB.layer.borderWidth = 1
        signInFB.layer.masksToBounds = false
    
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let email = emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let email, !email.isEmpty else {
            showAlert(title: "Error", message: "Email Id required")
            return
        }
        guard email.isAnEmail() else{
            showAlert(title: "Error", message: "Invalid Email address!!")
            return
        }
        guard let password,
              !password.isEmpty else {
            showAlert(title: "Error", message: "Please enter your password")
            return
        }
        self.performSegue(withIdentifier: "loginToTabBar", sender: self)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String = "OK"){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: buttonTitle,
            style: .default
        ))
        present(alert, animated: true)
    }
    
    @IBAction func signinWithAppleTapped(_ sender: Any) {
    }
    

}

extension String{
    
    //validate Email Id
    func isAnEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    //To check text field or String is blank or not
    func isBlank() -> Bool {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
}
