//
//  PlateValidation.swift
//  Bulur
//
//  Created by Cemal BAYRI on 27.06.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import Foundation

class PlateValidation {
    
    static let shared = PlateValidation()
    var validPlate: String  = ""
    
    func validate(_ input: String) -> Bool {
        //let ex = "34abc1234"
        let input = input.replacingOccurrences(of: " ", with: "")
        let arr = Array(input)
        
        var cityCodeSection : [String] = []
        var letterSection: [String] = []
        var numberSection: [String] = []
        
        for i in 0..<arr.count {
            print(i)
            if i < 2 {
                cityCodeSection.append(String(describing: arr[i]))
            } else if i > 1 && i < 5{
                if Int(String(describing: arr[i])) == nil {
                    letterSection.append(String(describing: arr[i]))
                }
                else {
                    numberSection.append(String(describing: arr[i]))
                }
                
            } else {
                numberSection.append(String(describing: arr[i]))
            }
        }
        
        //CITY CODE
        if cityCodeSection.count < 2 {
            return false
        }
        
        var cityCode = ""
        cityCodeSection.forEach { (item) in
            cityCode.append(item)
        }
        
        //LETTERS CODE
        var letters = ""
        letterSection.forEach { (item) in
            letters.append(item)
        }
        
        //NUMBERS CODE
        var numbers = ""
        numberSection.forEach { (item) in
            numbers.append(item)
        }
        
        
        if cityCode != "" && containsLetterChar(cityCode) == false {
            if cityCode.toInt() < 82 && cityCode != "00" {
                if letterSection.count > 0 && letterSection.count < 4 {
                    if letterSection.contains("Q") == false && letterSection.contains("W") == false  &&  letterSection.contains("X") == false &&  letterSection.contains("q") == false && letterSection.contains("w") == false  &&  letterSection.contains("x") == false  {
                        letters = letters.uppercased()
                        if numberSection.count > 1 && numberSection.count < 5 {
                            if letterSection.count == 1 {
                                if numberSection.count == 4 {
                                    validPlate = cityCode + " " + letters + " " + numbers
                                    return true
                                } else {
                                    return false
                                }
                            } else if letterSection.count == 2 {
                                if numberSection.count > 2 && numberSection.count < 5 {
                                    validPlate = cityCode + " " + letters + " " + numbers
                                    return true
                                } else {
                                    return false
                                }
                            } else {
                                validPlate = cityCode + " " + letters + " " + numbers
                                return true
                            }
                        } else {
                            return false
                        }
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            } else {
                return false
            }
        } else {
            return false
        }
        
    }
}


