//
//  ContentView.swift
//  PotterTrivia
//
//  Created by Andersson on 3/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geometry.size.width * 3, height: geometry.size.height)
                    .padding(.top, 3)
                VStack {
                    VStack {
                        Image(systemName: "bolt.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                        Text("Potter")
                            .font(.custom(Constants.potterFont, size: 70))
                            .padding(.bottom, -50)
                        Text("Trivia")
                            .font(.custom(Constants.potterFont, size: 50))
                    }
                    .padding(.top, 70)
                    Spacer()
                    VStack {
                        Text("Recent scores")
                            .font(.title2)
                        Text("37")
                        Text("29")
                        Text("17")
                    }
                    .font(.title3)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.6))
                    .cornerRadius(5)
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Play")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 50)
                                .background(.brown)
                                .cornerRadius(5)
                                .shadow(radius: 5)
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                        Spacer()
                    }
                    .frame(width: geometry.size.width)
                    Spacer()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
