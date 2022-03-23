//
//  ContentView.swift
//  AnimalFacts
//
//  Created by Sree Sai Raghava Dandu on 23/03/22.
//

import SwiftUI

struct ContentView: View {
    @State var facts = [Fact]()
    var body: some View {
        VStack{
            Text("CatFacts")
                .font(.largeTitle)
            Image("cat")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 10)
            if(facts.isEmpty){
                ProgressView()
                    .progressViewStyle(.automatic)
            }
            else{
                List(facts){ fact in
                    Text("\(fact.text)")
                }
                .listStyle(.insetGrouped)
            }
        }
            .onAppear(){
                Api().loadData { facts in
                    self.facts = facts
                }
            }
            .navigationTitle("CatFacts")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
