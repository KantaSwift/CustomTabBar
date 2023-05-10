// 
//  BulgeTabBar.swift
//  
//
//  Created by 上條栞汰 on 2023/05/10.
//

import SwiftUI

struct BulgeTabBar: View {
    
    @State private var tabPoints = [CGFloat]()
    @StateObject var viewModel: TabViewModel
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
        .background {
            Color.black
                .clipShape(TabCurve(tabPoint: getPoint() - 10))
                
        }
        .modifier(TabBarModifier(viewModel: viewModel))
    }
    
    private func tabBarImage(_ tab: TabItem) -> some View {
        GeometryReader { geometry in
            HStack {
                let isSelected = tab.id == selectedIndex
                (isSelected ? tab.fillImage : tab.image)
                    .renderingMode(.template)
                    .scaleEffect(isSelected ? 1.25 : 1.0)
                    .foregroundColor(isSelected ? Color(uiColor: tab.imageColor) : .gray)
                    .offset(y: isSelected ? -10 : 0)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.6)) {
                            selectedIndex = tab.id
                        }
                    }
                    .onAppear {
                        withAnimation {
                            tabPoints.insert(geometry.frame(in: .global).midX, at: 0)
                        }
                    }
                    .overlay(alignment: .bottom) {
                        if isSelected {
                            Circle()
                                .foregroundColor(.orange)
                                .frame(width: 10, height: 10)
                                .offset(y: 22)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }

    private func getPoint() -> CGFloat {
        guard !tabPoints.isEmpty else {
            return 10
        }
        return tabPoints[selectedIndex]
    }
}
