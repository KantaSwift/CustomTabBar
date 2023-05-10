// 
//  TabBarModifier.swift
//  
//
//  Created by 上條栞汰 on 2023/05/10.
//

import SwiftUI

struct TabBarModifier: ViewModifier {
    @StateObject var viewModel: TabViewModel
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
            .frame(height: 70)
            .offset(y: viewModel.isHidden ? 150 : 0)
            .padding([.leading, .trailing], 10)
    }
}
