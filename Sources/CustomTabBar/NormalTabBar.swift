// 
//  NormalTabBar.swift
//  
//
//  Created by 上條栞汰 on 2023/05/10.
//

import SwiftUI

struct NormalTabBar: View {
    @ObservedObject var viewModel: TabViewModel
    @Binding var selectedIndex: Int
    let tabs: [TabItem]
    
    var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom) {
                tabBar
            }
    }
    
    private var content: some View {
        tabs[selectedIndex].view
    }
    
    private var tabBar: some View {
        HStack {
            ForEach(tabs) { tab in
                tabBarImage(tab)
            }
        }
        .background(.black)
        .modifier(TabBarModifier(viewModel: viewModel))
    }
    
    private func tabBarImage(_ tab: TabItem) -> some View {
        GeometryReader { geometry in
            let isSelected = tab.id == selectedIndex
            HStack {
                (isSelected ? tab.fillImage : tab.image)
                    .renderingMode(.template)
                    .scaleEffect(isSelected ? 1.25 : 1.0)
                    .foregroundColor(isSelected ? Color(uiColor: tab.imageColor) : .gray)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.6)) {
                            selectedIndex = tab.id
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .overlay(alignment: .bottom) {
                if let title = tab.title {
                    Text("\(title)")
                        .foregroundColor(.white)
                        .font(.system(size: 14).weight(.regular))
                        .frame(alignment: .center)
                }
            }
        }
    }
}
