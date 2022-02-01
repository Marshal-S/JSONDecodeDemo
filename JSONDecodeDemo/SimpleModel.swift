//
//  SimpleModel.swift
//  JSONDecodeDemo
//
//  Created by 李帅 on 2022/2/1.
//  简单的解析模型定义

import UIKit

struct SimpleModel: Codable {
    var name: String?
    var age: Int = 0
}
