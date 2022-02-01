//
//  ComplexAutoModel.swift
//  JSONDecodeDemo
//
//  Created by 李帅 on 2022/2/1.
//  自动蛇形转驼峰的复杂模型解析(推荐)

import UIKit

//不使用映射时，可以将 JSONDecode 的 keyDecodingStrategy 属性设置为.convertFromSnakeCase
class ComplexAutoModel: Codable {
    var id: Int = 0
    var name: String?
    var age: Int = 0
    
    var state: State = .normal
    
    var fileInfo: FileInfo?
    var currentDepartment: Department?
    var enterpriseInfo: EnterpriseInfo?
    
    enum State: Int, Codable {
        case normal = 0
        case isEnter = 1
        case isLeave = 2
    }
    
    struct FileInfo: Codable {
        var pic: String?
        var thumPic: String?
    }

    struct Department: Codable {
        var id: Int = 0
        var name: String?
        var level: Int = 0
        var count: Int = 0
    }
    
    struct EnterpriseInfo: Codable {
        var id: String?
        var name: String?
        var age: Int = 0
        var departmentId: Int = 0
        var department: [Department]?
    }
}
