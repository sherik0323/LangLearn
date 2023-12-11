//
//  AddNewLink.swift
//  langLearn
//
//  Created by Sherozbek on 05/12/23.
//

import SwiftUI
import RealmSwift

struct AddNewLink: View {
    @State var newTitle = ""
    @State var newLink = ""
    @EnvironmentObject var linkViewModel: LinkViewModel
    @ObservedResults(LinkModel.self) var links
    @State var showAlert = false
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("New Link")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    withAnimation {
                        linkViewModel.isShowLinkView.toggle()
                    }
                }label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                }
                
            }
            VStack{
                HStack{
                    TextField("Title", text: $newTitle)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color("gray"))
                .cornerRadius(10)
                HStack{
                    TextField("Link", text: $newLink)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color("gray"))
                .cornerRadius(10)
            }
            Spacer()
            Button {
                if newTitle.count < 0,
                   newLink.count  < 0{
                    showAlert.toggle()
                }else {
                    let link = LinkModel()
                    link.link = newLink
                    link.linkname = newTitle
                    
                    $links.append(link)
                    
                    withAnimation {
                        linkViewModel.isShowLinkView.toggle()
                    }
                }
            } label: {
                Text("Save")
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(Color("green"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .alert(Text("Empty Fields"), isPresented: $showAlert, actions: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(15)
        .background(.white)
    }
}

#Preview {
    AddNewLink()
}
