//
//  RegisterViewController.swift
//  CocktailMaker
//
//  Created by Pieter Venter on 4/29/18.
//  Copyright © 2018 myric. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        //TODO: Set yourself as the delegate of the text field here:
        emailTextField.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        SVProgressHUD.show()
        
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {
            (user, error) in
            if error != nil {
                
                print(error!)
                
            }
            else{
                
                
                
                let usersDB =  Database.database().reference().child("Users")
                
                let userDictionary = ["userEmail" : Auth.auth().currentUser?.email,"userName" : self.nameTextField.text,"userSurname" : self.surnameTextField.text]
                
                usersDB.childByAutoId().setValue(userDictionary){
                    
                    (error, reference)in
                    
                    if error != nil {
                        print(error)
                        
                    }else {
                        print("User Saved Successfully!")
                        
                    
                        
                        
                    }
                }
                
                
                SVProgressHUD.dismiss()
                //Success
                print("Registration Successful!")
               // self.performSegue(withIdentifier: "goToChat", sender: self)
                
            }
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
