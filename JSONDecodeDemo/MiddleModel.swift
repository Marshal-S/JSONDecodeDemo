//
//  MiddleModel.swift
//  JSONDecodeDemo
//
//  Created by 李帅 on 2022/2/1.
//  带映射的一般解析模型定义

import UIKit

struct MiddleModel: Codable {
    var ID: Int = 0
    var name: String?
    var age: Int = 0
    
    //var pic: String? = nil
    //var thumPic: String? = nil
    
    //通过对键值设置映射值，一旦设置就要全部设置，否则不解析
    //注意：如上所示，无法将对象内的数据解析映射到对象外面
    //只能按照正常结构解析，可以选择不解析，解析见后面的complex
    enum CodingKeys: String, CodingKey {
        case ID = "id" //设置了之后，json中的 id 映射到当前对象的ID属性
        case name = "name"
        case age = "age"
        //case pic = "file_info.pic"
        //case thumPic = "file_info.thum_pic"
    }
    
}
