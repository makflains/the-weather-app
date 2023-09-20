    //
    //  OfferModel.swift
    //  the weather app
    //
    //  Created by сииас on 19/09/2023.
    //

    import Foundation

    class OfferModel:Codable {
        var cod:String?
        var message:Float?
        var cnt:Float?
        var list:[ListOfferModel]?
        var city:CityModel?
    }
