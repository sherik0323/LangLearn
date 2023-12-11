//
//  LinkShowView.swift
//  langLearn
//
//  Created by Sherozbek on 06/12/23.
//

import SwiftUI

struct LinkShowView: View {
    @EnvironmentObject var linkViewModel: LinkViewModel
    @Binding  var  url: String
    @State var title = ""
    var body: some View {
        ZStack{
            VStack(spacing: 0 ){
                HStack{
                    Circle()
                        .frame(width: 30)
                    Spacer()
                    
                    
                    Text(title)
                        .padding(.trailing, 30)
                        .fontWeight(.bold)
                    
                    Spacer()
                    Button {
                        linkViewModel.isShowLinkContent.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }

                }
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
                .background(Color("gray"))
                WebView(url: $url) { isLoad in
                    //
                }
            }
        }
        .onAppear{
            if let url = URL(string: url){
                self.title = url.host ?? ""
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//#Preview {
//    LinkShowView()
//}
