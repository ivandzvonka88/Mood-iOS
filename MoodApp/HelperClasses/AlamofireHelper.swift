//
//  AlamofireHelper.swift
//  RapidApiTesting
//
//  Created by Waqas on 10/06/2020.
//  Copyright © 2020 Waqas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AlamoHelper {
    
    static func PostRequestForPort(Url:String,Parm:[String:String], Header:[String:String] ,completion: @escaping (JSON) -> ())
    {
        AF.request("http://3.138.48.235:80/api/v2/auth/login", method: .post, parameters: Parm, encoder: JSONParameterEncoder.default, headers: HTTPHeaders(Header)).responseJSON { (json) in
            //print(json)
            switch json.result
            {
            case .success:
                if let Json = json.value
                {
                    // let dic = (JSON as! NSDictionary)
                    let dic = JSON(Json)
                    completion(dic)
                }
                else
                {
                    completion([:])
                }
            case .failure(let error):
                print(error)
                completion([:])
            }
        }
    }
    
    
    static func PostRequest(Url:String,Parm:[String:Any], Header:[String:String] ,completion: @escaping (JSON) -> ())
    {
        let myheaders = Header
        AF.request (Url ,method : .post, parameters: Parm, encoding
                        : URLEncoding.default,headers:  HTTPHeaders(myheaders)).responseJSON { response in
                            
                            switch response.result
                            {
                            case .success:
                                if let Json = response.value
                                {
                                    let dic = JSON(Json)
                                    //print(dic)
                                    completion(dic)
                                }
                                else
                                {
                                    completion([:])
                                }
                            case .failure(let error):
                                print(error)
                                completion([:])
                            }
                        }
    }
    static func PostRequestWithJsonEncoding(Url:String,Parm:[String:Any], Header:[String:String] ,completion: @escaping (JSON) -> ())
    {
        let myheaders = Header
        AF.request (Url ,method : .post, parameters: Parm, encoding
                        :  URLEncoding.default ,headers: HTTPHeaders(myheaders)).responseJSON { response in
                            
                            switch response.result
                            {
                            case .success:
                                if let Json = response.value
                                {
                                    let dic = JSON(Json)
                                    completion(dic)
                                }
                                else
                                {
                                    completion([:])
                                }
                            case .failure(let error):
                                print(error)
                                completion([:])
                            }
                        }
    }
    
    static func GetRequest(Url:String, Header:[String:String],Parm:[String:Any],completion: @escaping (JSON) -> ())
    {
        var G_url = "\(Url)?"
        for (key,value) in Parm {
            G_url = "\(G_url)\(key)=\(value)&"
        }
        ////print(G_url)
        AF.request (G_url ,method : .get, parameters: nil, encoding
                        : URLEncoding.default,headers: HTTPHeaders(Header)).responseJSON { response in
                            switch response.result
                            {
                            case .success:
                                if let Json = response.value
                                {
                                    let dic = JSON(Json)
                                    completion(dic)
                                }
                                else
                                {
                                    completion([:])
                                }
                            case .failure(let error):
                                print(error)
                                completion([:])
                            }
                        }
    }
    
    static func GetRequestWithJSONEncoding(Url:String, Header:HTTPHeaders,Parm:[String:String],completion: @escaping (JSON) -> ())
    {
        //        var G_url = "\(Url)?"
        //        for (key,value) in Parm {
        //            G_url = "\(G_url)\(key)=\(value)&"
        //        }
        AF.request (Url ,method : .get, parameters: nil, encoding
                        : JSONEncoding.default,headers: Header).responseJSON { response in
                            switch response.result
                            {
                            case .success:
                                if let Json = response.value
                                {
                                    let dic = JSON(Json)
                                    completion(dic)
                                }
                                else
                                {
                                    completion([:])
                                }
                            case .failure(let error):
                                print(error)
                                completion([:])
                            }
                        }
    }
    
    static func GetRequestWithJSONEncodingAndParm(Url:String, Header:HTTPHeaders,Parm:[String:String],completion: @escaping (JSON) -> ())
    {
//        var G_url = "\(Url)?"
//        for (key,value) in Parm {
//            G_url = "\(G_url)\(key)=\(value)&"
//        }
        
//        let encoder = JSONEncoder()
//        encoder.dateEncodingStrategy = .iso8601
//        encoder.keyEncodingStrategy = .convertToSnakeCase
//        let parameterEncoder = JSONParameterEncoder(encoder: encoder)
        
        
        AF.request(Url, method: .get, parameters: Parm, encoding: URLEncoding.default, headers: Header).responseJSON { response in
            switch response.result{
            case .success:
                if let Json = response.value
                {
                    let dic = JSON(Json)
                    completion(dic)
                }
                else
                {
                    completion([:])
                }
            case .failure(let error):
                print(error)
                completion([:])
            }
        }
//            .request(Url, method: .get, parameters: Parm, encoder: URLEncoding.default, headers: Header).responseJSON { response in
//            switch response.result{
//            case .success:
//                if let Json = response.value
//                {
//                    let dic = JSON(Json)
//                    completion(dic)
//                }
//                else
//                {
//                    completion([:])
//                }
//            case .failure(let error):
//                print(error)
//                completion([:])
//            }
//        }
        
        
            
//            .request (Url ,method : .get, parameters: nil, encoding
//                                    : JSONEncoding.default,headers: Header).responseJSON { response in
//                                        switch response.result
//                                        {
//                                        case .success:
//                                            if let Json = response.value
//                                            {
//                                                let dic = JSON(Json)
//                                                completion(dic)
//                                            }
//                                            else
//                                            {
//                                                completion([:])
//                                            }
//                                        case .failure(let error):
//                                            print(error)
//                                            completion([:])
//                                        }
//                                    }
        
        
        
//
//            .request(Url, method: .get, parameters: Parm, encoding: parameterEncoder, headers: Header).responseJSON { response in
//                switch response.result{
//                case .success:
//                    if let Json = response.value
//                    {
//                        let dic = JSON(Json)
//                        completion(dic)
//                    }
//                    else
//                    {
//                        completion([:])
//                    }
//                case .failure(let error):
//                    print(error)
//                    completion([:])
//                }
//            }
    }
}
