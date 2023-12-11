//
//  ListView.swift
//  langLearn
//
//  Created by Sherozbek on 05/12/23.
//

import SwiftUI
import RealmSwift

struct ListView: View {
    @State var searchText = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @ObservedResults(WordItem.self) var wordItems
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 25){
                    //search
                    HStack(spacing: 8){
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15)
                        TextField("Search ", text: $searchText )
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 20)
                    .background(Color("gray")
                    )
                    .cornerRadius(10)
                    
                    
                    
                    //cards
                    VStack(spacing: 25){
                        ForEach(wordItems, id: \.id) { item in
                            CardItem(cardItem:  item) {
                                $wordItems.remove(item)
                            }
                        }
                        
                        
                        
                    }
                    
                }
                .padding(.horizontal, 15)
                
            }
            Button {
                withAnimation {
                    listViewModel.isShowAddView.toggle()
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
    }
    
}


struct CardItem: View {
    @State var offsetX: CGFloat = 0
    var cardItem: WordItem
    var onDelete: ()->()
    var body: some View {
        ZStack(alignment: .trailing){
            removeImage()
            
            VStack(alignment: .leading, spacing: 10){
                VStack(alignment: .leading, spacing: 0){
                    Text("TR")
                        .font(.system(size: 12, weight: .black))
                        .padding(.bottom, 5)
                    Text(cardItem.mainWord)
                        .font(.system(size: 18, weight: .black))
                        .padding(.bottom, 2)
                    Text(cardItem.wordTranslate)
                        .font(.system(size: 18, weight: .light))
                }
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Примечание")
                        .font(.system(size: 12, weight: .light))
                        .padding(.bottom, 2)
                    Text(cardItem.wordDescription)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(Color("gray"))
            .cornerRadius(10)
            .offset(x: offsetX)
            .gesture(DragGesture()
                .onChanged{ value in
                    if value.translation.width < 0{
                        offsetX = value.translation.width
                    }
                    
                }
                .onEnded{ value in
                    withAnimation {
                        if screenSize().width * 0.7  < -value.translation.width{
                            
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            
                            withAnimation {
                                offsetX = -screenSize().width
                                onDelete()
                            }
                           
                        } else {
                            offsetX = .zero
                        }
                        
                    }
                })
        }
        
        
    }
    
    @ViewBuilder
    func removeImage() -> some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 10, height: 10)
            .offset(x: 30)
            .offset(x: offsetX*0.7)
            .scaleEffect(CGSize(width: 0.1 * -offsetX * 0.08, height: 0.1 * -offsetX * 0.08))
    }
}

#Preview {
    ContentView()
}

extension View{
    func screenSize() -> CGSize{
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return.zero
        }
        
        return window.screen.bounds.size
    }
}
