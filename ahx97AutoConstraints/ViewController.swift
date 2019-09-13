//
//  ViewController.swift
//  ahx97AutoConstraints
//
//  Created by Aaron Henry on 9/13/19.
//  Copyright © 2019 Aaron Henry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImageView = UIImageView()
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var buttonTopConstraint: NSLayoutConstraint?
    var buttonLeadingConstraint: NSLayoutConstraint?
    var buttonTrailingConstraint: NSLayoutConstraint?
    
    var labelTopConstraint: NSLayoutConstraint?
    var labelLeadingConstraint: NSLayoutConstraint?
    var labelTrailingConstraint: NSLayoutConstraint?
    
    let calculateButton = UIButton.init(type: .roundedRect)
    var compundIntrestLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setUI()
        
    }
    
    
    
    func setUI(){
        amountTextField.placeholder = "Enter Investment Amount"
        leadingConstraint.constant = 85
        trailingConstraint.constant = 85
        topConstraint.constant = 100
        
        calculateButton.setTitle("calculate", for: .normal)
        calculateButton.frame = CGRect(x:50, y:150, width: 150, height: 25)
        calculateButton.layer.borderWidth = 2.0
        calculateButton.backgroundColor = UIColor.gray
        calculateButton.layer.borderColor = UIColor.gray.cgColor
        calculateButton.layer.cornerRadius = 12
        calculateButton.tintColor = UIColor.black
        calculateButton.addTarget(self, action: #selector(calculateCompundIntrest(_ :)), for: .touchUpInside)
        
        compundIntrestLabel.textColor = UIColor.white
        compundIntrestLabel.textAlignment = .center
        compundIntrestLabel.backgroundColor = UIColor.black
        compundIntrestLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        
        
        view.addSubview(calculateButton)
        view.addSubview(compundIntrestLabel)
        
        compundIntrestLabel.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonTopConstraint = NSLayoutConstraint(item: calculateButton, attribute: .top, relatedBy: .equal, toItem: amountTextField, attribute: .bottom, multiplier: 1.0, constant: 25)
        buttonLeadingConstraint = NSLayoutConstraint(item: calculateButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 100)
        buttonTrailingConstraint = NSLayoutConstraint(item: calculateButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -100)
        
        labelTopConstraint = NSLayoutConstraint(item: compundIntrestLabel, attribute: .top, relatedBy: .equal, toItem: calculateButton, attribute: .bottom, multiplier: 1.0, constant: 25)
        labelLeadingConstraint = NSLayoutConstraint(item: compundIntrestLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 100)
        labelTrailingConstraint = NSLayoutConstraint(item: compundIntrestLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -100)
        
        
        
        buttonTopConstraint?.isActive = true
        buttonTrailingConstraint?.isActive = true
        buttonLeadingConstraint?.isActive = true
        
        labelTopConstraint?.isActive = true
        labelLeadingConstraint?.isActive = true
        labelTrailingConstraint?.isActive = true
        
        
    }
    
    @objc func calculateCompundIntrest(_: UIButton){
        if(amountTextField.hasText){
            let rate = 0.06
            let years = 30.0
            let compound = 12.0
            let initialAmount = Double(amountTextField.text!)
            
            let firstNum = 1.0 + (rate / compound)
            let secoundNum = compound * years
            let i = pow(firstNum, secoundNum)
            
            let unformatedFinalValue = round(100 * (i * initialAmount!)) / 100
            let numberFormater = NumberFormatter()
            numberFormater.numberStyle = NumberFormatter.Style.currency
            let finalValue = numberFormater.string(from: NSNumber(value: unformatedFinalValue))
            
            compundIntrestLabel.text = " \(finalValue!)"
            print("After \(years) years compounded \(compound) times a year for \(years) you will have a total of \(finalValue!)")
            
            
            
        }
        else{
            compundIntrestLabel.text = ("Enter a number")
        }
    }
    

    
    func setBackground(){
        backgroundImageView.image = UIImage(named: "money.jpg")
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        view.sendSubviewToBack(backgroundImageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

