//
//  APIs.swift
//  CinemaSalon
//
//  Created by elesahich on 2020/06/07.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

struct BaseAPIs {
    static let baseURL = "http://13.209.128.238:3000"
    
    static let bannerURL = baseURL + "/banner"
    static let classRecommedURL = baseURL + "/class/recommend"
    static let progressURL = baseURL + "/class/progress/popular"
    static let productRecommedURL = baseURL+"/product/recommend"
    static let justPurchasedURL = baseURL + "/product/live"
    static let popularwriterURL = baseURL + "/popular/writer"
}
