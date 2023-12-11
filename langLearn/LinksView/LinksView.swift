//
//  LinksView.swift
//  langLearn
//
//  Created by Sherozbek on 05/12/23.
//

import SwiftUI
import RealmSwift

struct LinksView: View {
    @EnvironmentObject var linkViewModel: LinkViewModel
    @ObservedResults(LinkModel.self) var links
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
            ScrollView() {
                VStack(spacing: 10){
                    
                    ForEach(links, id: \.id) { link in
                        LinkItem(link: link) { _ in
                            $links.remove(link)
                        }
                    }
                    
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Button {
                withAnimation {
                    linkViewModel.isShowLinkView.toggle()
                }
            }label: {
                ZStack{
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color("green"))
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
            }
            .offset(x: -20, y: -30)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct LinkItem: View {
    
    var link: LinkModel
    var onDelete: (Bool)->()
    @EnvironmentObject var linkViewModel: LinkViewModel
    var body: some View {
        HStack{
            HStack(spacing: 15){
                Image(systemName: "link")
                Text(link.linkname)
                    .font(.system(size: 15))
            }
            Spacer()
            Button{
                onDelete(true)
            }label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(Color("gray"))
        .cornerRadius(10)
        .onTapGesture {
            linkViewModel.isShowLinkContent.toggle()
            linkViewModel.openUrl = link.link
        }
    }
}

#Preview {
    ContentView()
}
