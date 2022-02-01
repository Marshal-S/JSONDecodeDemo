//
//  ComplexModel.swift
//  JSONDecodeDemo
//
//  Created by 李帅 on 2022/2/1.
//  带映射的复杂解析模型定义

import UIKit

//一旦设置了映射，则无法使用 JSONDecode的蛇形转驼峰
//子对象碰到蛇形转模型时，也需要给出映射
struct ComplexModel: Codable {
    var ID: Int = 0 //实际可以用id，这里只是案例
    var name: String?
    var age: Int = 0
    
    var state: State = .normal
    
    var fileInfo: FileInfo?
    var currentDepartment: Department?
    var enterpriseInfo: EnterpriseInfo?
    
    //通过对键值设置映射值，一旦设置就要全部设置，否则不解析
    enum CodingKeys: String, CodingKey {
        case ID = "id"
        case name   //名字一样可以省略后面
        case age
        case state
        case fileInfo = "file_info"
        case currentDepartment = "current_department"
        case enterpriseInfo = "enterprise_info"
    }
    
    enum State: Int, Codable {
        case normal = 0
        case isEnter = 1
        case isLeave = 2
    }
    
    struct FileInfo: Codable {
        var pic: String?
        var thumPic: String?
        enum CodingKeys: String, CodingKey {
            case pic
            case thumPic = "thum_pic"
        }
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
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case age
            case departmentId = "department_id"
            case department
        }
    }
}
