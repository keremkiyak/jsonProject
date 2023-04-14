//
//  Cars.swift
//  jsonOdev
//
//  Created by kerem on 14.04.2023.
//

import Foundation


//burda decoding işlemi için gerekli olan Codable protokolü den kalıtım alarak json daki değişkenleri kodumuzda oluşturuyoruz.
struct Cars: Codable{

    let title: String
    let description: String
    let image_url: String
    
}
