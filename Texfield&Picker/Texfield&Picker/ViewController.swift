//
//  ViewController.swift
//  Texfield&Picker
//
//  Created by Jacob on 6.07.2023.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var textFieldCountry:UITextField!
    
    var pickerView : UIPickerView?
    var countries : [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        countries = ["Turkey", "Germany", "France", "United Kingdom", "Italy", "Spain", "Russia", "Canada", "United States", "China", "Japan", "South Korea", "India", "Australia", "Brazil", "Mexico", "Argentina", "South Africa", "Nigeria", "Egypt"]

                     pickerView = UIPickerView()
        pickerView?.delegate = self
        pickerView?.dataSource = self
        textFieldCountry.inputView = pickerView //Aktif bir şekilde görünmesini sağlıyor
        
        let toolbar = UIToolbar().self
        toolbar.tintColor = UIColor.red
        toolbar.sizeToFit()
        
        let ok = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(self.okButton))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelButton))
        
        toolbar.setItems([cancel,space,ok], animated: true)
        textFieldCountry.inputAccessoryView = toolbar
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldCountry.text = countries[row]
    }
    @objc func okButton(){
        textFieldCountry.text = ""
        textFieldCountry.placeholder = "Choose Country"
        view.endEditing(true)
        
    }
    @objc func cancelButton(){
        view.endEditing(true) // bu kodla birlikte picker bölümü kapanır
        
    }
}

