//
//  JSONInfoModel.swift
//  JSONDecodeDemo
//
//  Created by 李帅 on 2022/2/1.
//

import UIKit
import SwiftUI

let baseJSON = """
{
    "id": 123123123,
    "name": "剪刀石头布",
    "age": 29,
    "state": 1,
    "file_info": {
        "pic": "http://123.png",
        "thum_pic": "http://123_thum.png",
    },
    "current_department": {
        "id": 1,
        "name": "数字孪生开发部门",
        "level": 100,
        "count": 20
    },
    "enterprise_info": {
        "id": "saiirower231oi23104004",
        "name": "詹小帅",
        "age": 30,
        "department_id": 1,
        "department": [{
            "id": 1,
            "name": "数字孪生开发部门",
            "level": 100,
            "count": 20
        },{
            "id": 1,
            "name": "小程序开发部门",
            "level": 100,
            "count": 20
        },{
            "id": 1,
            "name": "APP基础开发部门",
            "level": 100,
            "count": 20
        }]
    }
}
"""

//注意提取对象的时候，只能按照原结构进行提取，不能将某一个对象按照设定提取到外层
class JSONInfoModel: ObservableObject {
    @Published var simpleJSON: SimpleModel?
    @Published var middleJSON: MiddleModel?
    @Published var complexJSON: ComplexModel?
    @Published var complexAutoJSON: ComplexAutoModel?
    
    init(simpleJSON: Bool = false) {
        guard simpleJSON else {
            return
        }
        
        let decode = JSONDecoder()
        if let data = baseJSON.data(using: .utf8) {
            do {
                let simModel = try decode.decode(SimpleModel.self, from: data)
                self.simpleJSON = simModel
                print("simModel", simModel)
                
                //模型 转 jsonData
                let jsonData = try JSONEncoder().encode(simModel)
                //jsonData 转 字典
                let jsonDic = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                //jsonData 转 jsonString
                let jsonString = String(data: jsonData, encoding: .utf8)
                print("jsonDic", jsonDic)
                if let json = jsonString {
                    print("jsonString", json)
                }
            } catch {
                print("出错了1")
            }
        }
    }
    
    init(middleJSON: Bool = false) {
        guard middleJSON else {
            return
        }
        
        let decode = JSONDecoder()
        if let data = baseJSON.data(using: .utf8) {
            do {
                let midModel = try decode.decode(MiddleModel.self, from: data)
                self.middleJSON = midModel
                print("middleModel", midModel)
            } catch {
                print("出错了2")
            }
        }
    }
    
    init(complexJSON: Bool = false) {
        guard complexJSON else {
            return
        }
        
        let decode = JSONDecoder()
        
        if let data = baseJSON.data(using: .utf8) {
            do {
                let comModel = try decode.decode(ComplexModel.self, from: data)
                self.complexJSON = comModel
                print("complexModel", comModel)
            } catch {
                print("出错了3")
            }
        }
    }
    
    init(complexAutoJSON: Bool = false) {
        guard complexAutoJSON else {
            return
        }
        
        let decode = JSONDecoder()
        //蛇形转驼峰,模型定义不能使用映射，不然会解析失败
        decode.keyDecodingStrategy = .convertFromSnakeCase
        
        if let data = baseJSON.data(using: .utf8) {
            do {
                let comAutoModel = try decode.decode(ComplexAutoModel.self, from: data)
                self.complexAutoJSON = comAutoModel
                print("complexModel", comAutoModel)
            } catch {
                print("出错了3")
            }
        }
    }
    
}
