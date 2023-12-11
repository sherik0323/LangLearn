//
//  WordsView.swift
//  langLearn
//
//  Created by Sherozbek on 05/12/23.
//

import SwiftUI

struct WordsView: View {
    @State var isShowTranslate = false
    var body: some View {
        ZStack{
            
            VStack{
                Spacer()
                VStack( spacing: 23 ){
                    VStack(alignment: .leading){
                        Text("TR")
                            .font(.system(size: 12, weight: .black))
                            .padding(.bottom, 0)
                        Text("Araba")
                            .font(.system(size: 36, weight: .black))
                            .padding(.bottom, 2)
                    }
                    
                    ZStack{
                        Text("Машина")
                            .font(.system(size: 26, weight: .thin))
                            .opacity(isShowTranslate ? 1 : 0)

                        Button{
                            withAnimation {
                                isShowTranslate.toggle()
                            }
                        } label: {
                            Text("Show Translate")
                                .padding(.vertical, 13)
                                .padding(.horizontal, 60)
                                .foregroundColor(.white)
                                .background(Color("green"))
                                .clipShape(Capsule())

                            
                        }
                        .opacity(isShowTranslate ? 0 : 1)

                    }
                }
                
                Spacer()
                
                Button{
                    
                }label: {
                    HStack{
                        Text("Next")
                        Image(systemName: "chevron.right")
                            
                    }
                    .foregroundColor(Color("green"))
                }
            }
            .frame(maxWidth: .infinity)
        }
        
    }
}

#Preview {
    ContentView()
}
