//
//  BillListTableViewController.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/12/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class BillListTableViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet weak var lbl_customerID: UILabel!
    
    @IBOutlet weak var lbl_customerName: UILabel!
    
    @IBOutlet weak var lbl_customerEmail: UILabel!
    
    @IBOutlet weak var lbl_totalBill: UILabel!
    
    
    @IBOutlet weak var tbl_billdetails: UITableView!
    
    
    override func viewDidLoad()
    {
        self.tbl_billdetails.delegate = self
        self.tbl_billdetails.dataSource = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.lbl_customerID.text = Customer.activeCustomer.customerId
        self.lbl_customerEmail.text = Customer.activeCustomer.email
        self.lbl_customerName.text = Customer.activeCustomer.fullName
        self.lbl_totalBill.text = Customer.activeCustomer.TotalAmountToPay.currency()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Customer.activeCustomer.billDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idBill")  as! UITableViewCell
        
        let currentbill = Customer.activeCustomer.billDictionary[indexPath.row + 1]
        var furtherDetails = ""
        if currentbill?.billType == billTypes.Mobile{
            cell.textLabel?.numberOfLines = 12
            let mobileBill = currentbill as! Mobile
            furtherDetails = "\nManufacturer Name : \(mobileBill.mobileManufacturer) \nPlan Name : \(mobileBill.planName) \nMobile Number : \(mobileBill.mobileNumber) \nInternet used : \(mobileBill.internetUsed.data()) \nMinutes Used : \(mobileBill.minuteUsed.minutes()) "
        } else {
            if currentbill?.billType == billTypes.Hydro{
                cell.textLabel?.numberOfLines = 12
                let hydroBill = currentbill as! Hydro
                furtherDetails = "Agency Name : \(hydroBill.agencyName) \nUnit Consumed : \(hydroBill.unitconsumed.unit())"
            } else {
                if currentbill?.billType == billTypes.Internet{
                    cell.textLabel?.numberOfLines = 12
                    let internetBill = currentbill as! Internet
                    furtherDetails = "Provider Name : \(internetBill.providerName) \nInternet Used : \(internetBill.internetUsed.data())"
                }
            }
        }
        cell.textLabel?.text = "Bill ID : \(String(describing: currentbill!.Id)) \nBill Date : \(String(describing: currentbill!.billDate.getForamttedDate())) \nBill Type : \(String(describing: currentbill!.billType)) \nBill Total : \(String(describing: currentbill!.totalBillAmount.currency())) \(furtherDetails)"
        return cell
    }

}
