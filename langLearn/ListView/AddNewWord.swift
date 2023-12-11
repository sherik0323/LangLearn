//
//  AddNewWord.swift
//  langLearn
//
//  Created by Sherozbek on 05/12/23.
//

import SwiftUI
import RealmSwift 

struct AddNewWord: View {
    @State var newWord = ""
    @State var wordTranslate = ""
    @State var wordDescription = ""
    @State var showAlert = false
    @ObservedResults(WordItem.self) var wordItems
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("New Word")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    withAnimation {
                        listViewModel.isShowAddView.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                }

            }
            VStack(alignment: .leading){
                Text("TR")
                    .font(.system(size: 12, weight: .black ))
                HStack{
                    TextField("Word", text: $newWord)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color("gray"))
                .cornerRadius(10)
                HStack{
                    TextField("Translate", text: $wordTranslate)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color("gray"))
                .cornerRadius(10)
                
                Text("Description")
                    .font(.system(size: 14, weight: .black))
                    .padding(.top, 23)
                    .padding(.leading, 23)
                HStack{
                    TextEditor(text: $wordDescription)
                        .frame(height: 90)
                        .colorMultiply(Color("gray"))
                        .autocorrectionDisabled()
                    
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color("gray"))
                .cornerRadius(10)
                
                
                
            }
            Spacer()
            Button {
                if newWord.count == 0,
                   wordTranslate.count == 0{
                    showAlert.toggle()
                } else {
                    let word = WordItem()
                    word.mainWord = newWord
                    word.wordTranslate = wordTranslate
                    word.wordDescription = wordDescription
                    
                    $wordItems.append(word)
                    
                    withAnimation {
                        listViewModel.isShowAddView.toggle()
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
    AddNewWord()
}
