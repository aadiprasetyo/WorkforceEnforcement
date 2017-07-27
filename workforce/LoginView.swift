//
//  LoginView.swift
//  workforce
//
//  Created by admin on 7/20/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

extension LoginViewController{
    func setupInputsContainerView(){
        background.translatesAutoresizingMaskIntoConstraints = false
        background.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        background.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        background.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        inputsContainerView.backgroundColor = UIColor.white
        inputsContainerView.layer.borderWidth = 1
        inputsContainerView.layer.borderColor = UIColor.lightGray.cgColor
        inputsContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -44).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        inputsContainerView.layer.cornerRadius = 10
        
        headerContainer.translatesAutoresizingMaskIntoConstraints = false
        headerContainer.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        headerContainer.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        headerContainer.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        headerContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        headerContainer.layer.masksToBounds = true
        
        headerContainer.layer.cornerRadius = 10
        headerContainer.addSubview(logoWE)
        
        logoWE.translatesAutoresizingMaskIntoConstraints = false
        logoWE.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor).isActive = true
        logoWE.rightAnchor.constraint(equalTo: headerContainer.rightAnchor).isActive = true
        logoWE.heightAnchor.constraint(equalToConstant: 46).isActive = true
        logoWE.widthAnchor.constraint(equalToConstant: 77).isActive = true
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.leftAnchor.constraint(equalTo: headerContainer.leftAnchor, constant: 16).isActive = true
        labelTitle.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor).isActive = true
        labelTitle.font = UIFont.boldSystemFont(ofSize: 24)
        labelTitle.heightAnchor.constraint(equalTo: headerContainer.heightAnchor).isActive = true
        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1/1.23).isActive = true
        emailTextField.topAnchor.constraint(equalTo: headerContainer.bottomAnchor, constant: 28).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        emailSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        emailSeparator.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        emailSeparator.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        emailSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        emailSeparator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1/1.23).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 24).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 26).isActive = true
        passwordTextField.isSecureTextEntry = true
        
        
        passwordSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        passwordSeparator.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        passwordSeparator.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        passwordSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        passwordSeparator.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1/5).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive = true
        loginButton.layer.cornerRadius = 4
        loginButton.layer.shadowColor = UIColor(red: 42/255, green: 147/255, blue: 137/255, alpha: 1).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        loginButton.layer.shadowRadius = 5
        
        
        loginButton.setTitle("Sign In", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        forgotPassword.translatesAutoresizingMaskIntoConstraints = false
        forgotPassword.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor).isActive = true
        forgotPassword.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1/3.5).isActive = true
        forgotPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive = true
        forgotPassword.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/20)
        forgotPassword.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor).isActive = true
        forgotPassword.setTitle("Forgot Password?", for: .normal)
        forgotPassword.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        
    }
}
