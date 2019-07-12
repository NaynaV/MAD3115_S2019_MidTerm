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
    
    
    var datePicker = UIDatePicker()
    var rdate  = NSDate()
    var rtime = NSTimeZone()
    var Response2: AnyObject!
    
    var Response1: AnyObject!
    override func viewDidLoad()
    {
        
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
            self.date_picker()
            return true
        }
        
        return false
    }
    
    func date_picker()
    {
        let toolbar1:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 88))
        let done:UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target:self, action: Selector(("doneBtnClicked:")))
        done.tag  = 201
        let cancel:UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: Selector(("cancelBtnClicked:")))
        cancel.tag = 202
        let space:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar1.items = [cancel,space,done]
        toolbar1.barTintColor = UIColor(red: 174/255.0, green: 134/255.0, blue: 9/255.0, alpha: 1)
        toolbar1.tintColor = UIColor.black
        txt_billDatePicker.inputAccessoryView = toolbar1
        
        cancel.tintColor = UIColor.black
        done.tintColor = UIColor.black
        //        txtCaseassignstarttime.inputAccessoryView = toolbar1
        //        txtCasereachabletime.inputAccessoryView = toolbar1
        
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
        datePicker.date = NSDate() as Date
        datePicker.maximumDate = NSDate() as Date
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = NSLocale.current
        datePicker.calendar = NSCalendar.current
        datePicker.backgroundColor = UIColor(red: 255/255.0, green: 193/255.0, blue: 37/255.0, alpha: 1)
        txt_billDatePicker.inputView = datePicker
        //        txtCaseassignstarttime.inputView = datePicker
        //        txtCasereachabletime.inputView = datePicker
    }
    func donedatePicker(){
        //For date formate
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txt_billDatePicker.text = formatter.string(from: datePicker.date)
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    /*
    func cancelDatePicker(){
        //cancel button dismiss datepicker dialog
        self.view.endEditing(true)
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    @IBAction func txt_BillDateClick(_ sender: Any)
    {
    self.date_picker()
    }
    
    
}

