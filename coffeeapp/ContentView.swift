//
//  ContentView.swift
//  coffeeapp
//
//  Created by Rajayogan on 22/04/25.
//

import SwiftUI

struct ContentView: View {

    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    //Please note that matched geometry effect won't work in tabview
    
    var body: some View {
        //Tabs at the bottom
        
        TabView {
            HomeView().tabItem {
                Image(systemName: "house.fill")
            }
            ShopView().tabItem {
                Image(systemName: "handbag.fill")
            }
            FavoritesView().tabItem {
                Image(systemName: "heart.fill")
            }
            NotificationsView().tabItem {
                Image(systemName: "bell.fill")
            }
        }
        .tint(.coffeeSelected)
    }
}

#Preview {
    ContentView()
}
