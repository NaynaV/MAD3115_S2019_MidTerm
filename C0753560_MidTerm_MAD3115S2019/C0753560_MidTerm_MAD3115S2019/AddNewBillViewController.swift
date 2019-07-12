//
//  AddNewBillViewController.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/12/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class AddNewBillViewController: UIViewController,UINavigationBarDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var txt_billType: UITextField!
    @IBOutlet weak var txt_billDatePicker: UITextField!
    
    @IBOutlet weak var picker_billType: UIPickerView!
    
    @IBOutlet weak var txt_mobileNo: UITextField!
    @IBOutlet weak var txt_companyName: UITextField!
    
    @IBOutlet weak var txt_billAmount: UITextField!
    var pickerData: [String] = [String]()
    
     let datePicker = UIDatePicker()
   // var datePicker = UIDatePicker()
    var rdate  = NSDate()
    var rtime = NSTimeZone()
    var Response2: AnyObject!
    
    var Response1: AnyObject!
    override func viewDidLoad()
    {
        showDatePicker()
        self.picker_billType.delegate = self
        self.picker_billType.dataSource = self
        
        
        
        
     
    pickerData = ["Elecricity", "Hydro", "Mobile"]
        super.viewDidLoad()
//showDatePicker()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_back(_ sender: Any)
    {
       self.performSegue(withIdentifier: "goBackBillDetail", sender: nil)
    }
    
    @IBAction func btn_save(_ sender: Any)
    {
       
    }
  
 
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField == txt_billDatePicker)
        {
          //  self.date_picker()
            return true
        }
        
        return false
    }
   
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txt_billDatePicker.inputAccessoryView = toolbar
        txt_billDatePicker.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txt_billDatePicker.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView( pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txt_billType.text = pickerData[row]
    }
    @IBAction func txt_BillDateClick(_ sender: Any)
    {
  //  self.date_picker()
    }
    
    
}

