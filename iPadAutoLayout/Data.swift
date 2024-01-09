//
//  Data.swift
//  iPadAutoLayout
//
//  Created by Martinez on 2024/01/09.
//

import UIKit

class Data: NSObject {

    var savedName : String?
    var savedEmail : String?
    
    override init(){
        savedName = "Martinez"
        savedEmail = "martinez@gmail.com"
    }

    func initWithStuff(theName : String, theEmail : String){
        savedName = theName
        savedEmail = theEmail
    }
}
