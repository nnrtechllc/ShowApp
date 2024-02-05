//
//  HomeView1.swift
//  ShowApp
//
//  Created by Nikhil Vaddey on 1/19/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        // MARK: TabView With Recent Posts And Profile Tabs
        TabView{
            PostView()
                .tabItem {
                    Image(systemName: "note")
                    Text("Post's")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            ContentView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Attendence")
                }
          //  FundraiserView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Fundraiser")
                }
       //     SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        //    CalendarView()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
      //      SmartLunchView1()
                .tabItem{
                    Image(systemName: "circle.fill")
                    Text("Smart Lunch")
                }
       //     Newspage()
                .tabItem{
                    Image(systemName: "book.fill")
                    Text("News")
                }
      //      Home8()
                .tabItem{
                    Image(systemName: "sportscourt")
                    Text("Sports")
                }
     //       HomeJob()
                .tabItem{
                    Image(systemName: "case.fill")
                    Text("Jobs")
                }
           
            
           
            
        
            
        }
        // Changing Tab Lable Tint to Black
        .tint(.black)
    }
}
