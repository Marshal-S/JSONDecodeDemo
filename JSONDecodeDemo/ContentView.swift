//
//  ContentView.swift
//  JSONDecodeDemo
//
//  Created by 李帅 on 2022/2/1.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var simModel = JSONInfoModel(simpleJSON: true)
    @ObservedObject var middleModel = JSONInfoModel(middleJSON: true)
    @ObservedObject var complexModel = JSONInfoModel(complexJSON: true)
    @ObservedObject var complexAutoModel = JSONInfoModel(complexAutoJSON: true)
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
