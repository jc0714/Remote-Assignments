//
//  ViewController.swift
//  loginApp
//
//  Created by J oyce on 2024/7/1.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var checkText: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.backgroundColor = UIColor.systemGray
        checkTextField.isEnabled = false
        checkText.textColor = UIColor.lightGray
        checkTextField.backgroundColor = UIColor.black
    }
    
    // 用 UISegmentedControl 選擇不同分頁
    @IBAction func changePage(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            // Log in page
            checkTextField.isEnabled = false
            checkText.textColor = UIColor.lightGray
            checkTextField.backgroundColor = UIColor.black
            accountTextField.text = ""
            passwordTextField.text = ""
        case 1:
                // sign up page
                checkTextField.isEnabled = true
                checkText.textColor = UIColor.black
                checkTextField.backgroundColor = UIColor.white
                accountTextField.text = ""
                passwordTextField.text = ""
                checkTextField.text = ""
        default:
            return
        }
    }
    @IBAction func checkLogIn(_ sender: UIButton) {
         func showAlert(title: String, message: String) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let action = UIAlertAction(title: "OK", style: .default)
         alert.addAction(action)
         present(alert, animated: true, completion: nil)
         }
         
         guard let account = accountTextField.text, let password = passwordTextField.text else {
         return
         }
         
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                // Log in page
                if account.isEmpty {
                    showAlert(title: "Attention!", message: "Account can't be empty!")
                }else if password.isEmpty {
                    showAlert(title: "Attention!", message: "Password can't be empty!")
                }else if account == "appworks_school" && password == "1234" {
                    showAlert(title: "Good", message: "Log in successful!")
                }else {
                    showAlert(title: "So sad", message: "Log in failed!")
                }
            case 1:
                // Sign up page
                if account.isEmpty {
                    showAlert(title: "Attention!", message: "Account can't be empty!")
                } else if password.isEmpty {
                    showAlert(title: "Attention!", message: "Password can't be empty!")
                } else if passwordTextField.text == checkTextField.text{
                    showAlert(title: "Good", message: "Sign up successful!")
                    accountTextField.text = ""
                    passwordTextField.text = ""
                    checkTextField.text = ""
                } else {
                    showAlert(title: "Attention!", message: "Check your password!")
                }
            default:
                break
            }
        }
        
        /*
         @IBAction func checkLogIn(_ sender: UIButton) {
         if accountTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false{
         let title : String = "So sad"
         let message : String = "Log in fail!"
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let action = UIAlertAction(title: "OK", style: .default)
         alert.addAction(action)
         present(alert, animated: true, completion: nil)}
         
         else if accountTextField.text == "appworks_school" && passwordTextField.text == "1234"{
         let title : String = "Good"
         let message : String = "Log in successful!"
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let action = UIAlertAction(title: "OK", style: .default)
         alert.addAction(action)
         present(alert, animated: true, completion: nil)}
         
         else if accountTextField.text == ""{
         let title : String = "Attention!"
         let message : String = "Account can't be empty!"
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let action = UIAlertAction(title: "OK", style: .default)
         alert.addAction(action)
         present(alert, animated: true, completion: nil)}
         
         else if passwordTextField.text == ""{
         let title : String = "Attention!"
         let message : String = "Password can't be empty!"
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let action = UIAlertAction(title: "OK", style: .default)
         alert.addAction(action)
         present(alert, animated: true, completion: nil)}
         }
         }
         
         */
    }

