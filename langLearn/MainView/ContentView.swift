//
//  ContentView.swift
//  langLearn
//
//  Created by Sherozbek on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var listViewModel = ListViewModel()
    @ObservedObject var linkViewModel = LinkViewModel()
    var body: some View {
        ZStack{
            TabView {
                ListView()
                    .environmentObject(listViewModel)
                    .tag("1")
                    .tabItem {
                        VStack{
                            Image(systemName: "list.dash")
                            Text("List")
                        }
                    }
                WordsView()
                    .padding(.horizontal, 15)
                    .tag("2")
                    .tabItem {
                        VStack{
                            Image(systemName: "textformat.abc")
                            Text("Words")
                        }
                    }
                LinksView()
                    .environmentObject(linkViewModel)
                    .padding(.horizontal, 15)
                    .tag("3")
                    .tabItem {
                        VStack{
                            Image(systemName: "link")
                            Text("Links")
                        }
                    }
            }
            if listViewModel.isShowAddView{
                    AddNewWord()
                        .environmentObject(listViewModel)
                
                
            }
            if linkViewModel.isShowLinkView{
                AddNewLink()
                    .environmentObject(linkViewModel)
            }
            if linkViewModel.isShowLinkContent{
                LinkShowView(url: $linkViewModel.openUrl)
                    .environmentObject(linkViewModel)
            }
//            VStack{
//                
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.black )

        }
    }
}

#Preview {
    ContentView()
}
