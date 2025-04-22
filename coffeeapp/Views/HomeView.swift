//
//  HomeView.swift
//  coffeeapp
//
//  Created by Rajayogan on 22/04/25.
//

import SwiftUI

struct HomeView: View {
    //Give hero effect
    @Namespace var coffeeanimation
    //ui helpers
    @State var isMain: Bool = true
    @State private var searchString: String = ""
    @State private var sizeSelection: String = "S"
    @State var activeTab: coffeeOptions.Tab = .cappuccino
    
    @State private var coffees: [coffeeOptions] = [
        .init(id: coffeeOptions.Tab.cappuccino),
        .init(id: coffeeOptions.Tab.espresso),
        .init(id: coffeeOptions.Tab.latte),
        .init(id: coffeeOptions.Tab.flatwhite)
    ]
    
    var coffeeList: [coffeeDetails] = [
        coffeeDetails(imageURL: "main", coffeeName: "Cappuccino", coffeeContent: "With OatMilk", coffeeRating: 4.2, coffeePrice: 4.20),
        coffeeDetails(imageURL: "secondary", coffeeName: "Cappuccino", coffeeContent: "With Chocolate", coffeeRating: 4.5, coffeePrice: 3.14)
    ]
    //initiall a dummy, then will hold the selected choice
    @State var userCoffee: coffeeDetails = coffeeDetails(imageURL: "main", coffeeName: "some", coffeeContent: "some", coffeeRating: 4.2, coffeePrice: 5.4)
    
    var body: some View {
        if isMain {
            mainView
        }
        else {
            coffeedetailspage
        }
    }
    
    var mainView: some View {
        //Main Page
        ZStack {
            Color(.bgcolor).ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        
                    } label:  {
                        Image(systemName: "circle.grid.2x2.fill")
                            .foregroundStyle(.gray)
                            .frame(width: 25, height: 30)
                    }
                    .buttonBorderShape(.roundedRectangle(radius: 15))
                    .buttonStyle(.borderedProminent)
                    .tint(.gradientTopLeft)
                    Spacer()
                    Image("profpic")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(.rect(cornerRadius: 15))
                        .shadow(color: .gray, radius: 3)
                }
                Spacer()
                    .frame(height: 40)
                Text("Find the best")
                    .font(.sourcesans(fontStyle: .largeTitle, fontWeight: .bold))
                    .foregroundStyle(.white)
                Text("coffee for you")
                    .font(.sourcesans(fontStyle: .largeTitle, fontWeight: .bold))
                    .foregroundStyle(.white)
                
                TextField("", text: $searchString, prompt: Text("Find your coffee")
                    .font(.sourcesans(fontStyle: .headline))
                    .foregroundStyle(.gray.opacity(0.5))
                ).safeAreaInset(edge: .leading) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                }
                .padding(.all)
                .background(.searchBarFill, in: .rect(cornerRadius: 10))
                Spacer()
                    .frame(height: 20)
                
                //Let's create the tabs separately
                ScrollView(.horizontal) {
                    HStack(spacing: 30) {
                        ForEach(coffees) { coffee in
                            Button(action: {
                                withAnimation(.bouncy) {
                                    activeTab = coffee.id
                                }
                            }) {
                                VStack(spacing: 3) {
                                    Text(coffee.id.rawValue)
                                        .font(.sourcesans(fontStyle: .title3, fontWeight: .bold))
                                        .foregroundStyle(activeTab == coffee.id ? .coffeeSelected : .coffeeUnselected)
                                    
                                    Circle()
                                        .frame(width: 7, height: 7)
                                        .foregroundStyle(activeTab == coffee.id ? .coffeeSelected : .bgcolor)
                                }
                            }
                        }
                    }
                }.scrollIndicators(.hidden)
                Spacer()
                    .frame(height: 25)
                ScrollView(.vertical) {
                    HStack(spacing: 20) {
                        coffeeChoices(selectedCoffee: coffeeList[0])
                        coffeeChoices(selectedCoffee: coffeeList[1])
                    }
                    
                    HStack {
                        Text("Special for you")
                            .font(.sourcesans(fontStyle: .title3, fontWeight: .semibold))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 5)
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 125)
                            .foregroundStyle(LinearGradient(colors: [.gradientTopLeft, .black],
                                                            startPoint: .topLeading, endPoint: .bottomTrailing
                                                           ))
                        HStack(alignment: .top) {
                            Image("beansbottom")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 125, height: 110)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .clipped()
                                .padding()
                            Text("5 Coffee Beans You Must Try !")
                                .font(.sourcesans(fontStyle: .title3, fontWeight: .semibold))
                                .foregroundStyle(.white)
                                .padding()
                            Spacer()
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    var coffeedetailspage: some View {
        ZStack {
            Color(.bgcolor).ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Image(userCoffee.imageURL)
                    .resizable()
                    .matchedGeometryEffect(id: userCoffee.imageURL, in: coffeeanimation)
                    .frame(height: 600)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .clipped()
                    .offset(y: -105)
                Spacer()
            }.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        withAnimation(.bouncy) {
                            isMain = true
                        }
                    } label : {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.gray)
                            .frame(width: 25, height: 30)
                    }.buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .tint(.gradientTopLeft)
                        .shadow(color: .black, radius: 3)
                    Spacer()
                    Button {
                        
                    } label : {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.gray)
                            .frame(width: 25, height: 30)
                    }.buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .tint(.gradientTopLeft)
                        .shadow(color: .black, radius: 3)
                }.padding(.horizontal)
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .frame(height: 150)
                    .foregroundStyle(.black.opacity(0.7))
                HStack {
                    VStack(alignment: .leading) {
                        Text(userCoffee.coffeeName)
                            .font(.sourcesans(fontStyle: .title, fontWeight: .semibold))
                            .foregroundStyle(.white)
                        Text(userCoffee.coffeeContent)
                            .font(.sourcesans(fontStyle: .title3, fontWeight: .light))
                            .foregroundStyle(.white)
                        Spacer()
                            .frame(height: 15)
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.coffeeSelected)
                            Text("\(userCoffee.coffeeRating, specifier: "%.2f")")
                                .font(.sourcesans(fontStyle: .title3, fontWeight: .semibold))
                                .foregroundStyle(.white)
                            Text("(6,986)")
                                .font(.sourcesans(fontStyle: .footnote, fontWeight: .light))
                                .foregroundStyle(.white)
                        }
                        
                    }
                    Spacer()
                    VStack {
                        HStack {
                            VStack(spacing: 0.2) {
                                Image(systemName: "cup.and.saucer.fill")
                                    .foregroundStyle(.coffeeSelected)
                                    .frame(width: 30, height: 20)
                                Text("Coffee")
                                    .font(.sourcesans(fontStyle: .footnote, fontWeight: .medium))
                                    .foregroundStyle(.white)
                            }
                            .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                            .background(RoundedRectangle(cornerRadius: 10)
                                .shadow(color: .gray,radius: 3)
                            )
                            Spacer()
                                .frame(width: 15)
                            VStack(spacing: 0.2) {
                                Image(systemName: "drop.fill")
                                    .foregroundStyle(.coffeeSelected)
                                    .frame(width: 30, height: 20)
                                Text("Milk")
                                    .font(.sourcesans(fontStyle: .footnote, fontWeight: .medium))
                                    .foregroundStyle(.white)
                            }
                            .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                            .background(RoundedRectangle(cornerRadius: 10)
                                .shadow(color: .gray, radius: 3)
                            )
                        }
                        Spacer()
                            .frame(height: 15)
                        Text("Medium Roasted")
                            .font(.sourcesans(fontStyle: .footnote, fontWeight: .medium))
                            .foregroundStyle(.white)
                        
                            .padding(EdgeInsets(top: 7, leading: 9, bottom: 7, trailing: 9))
                            .background(RoundedRectangle(cornerRadius: 10)
                                .shadow(color: .gray, radius: 3)
                            )
                    }
                }.padding(EdgeInsets(top: 2, leading: 30, bottom: 2, trailing: 30))
            }
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text("Description")
                    .font(.sourcesans(fontStyle: .title3, fontWeight: .semibold))
                    .foregroundStyle(.headinggray)
                VStack(alignment: .leading) {
                    Text("A cappuccino is a coffee-based drink made")
                        .font(.sourcesans(fontStyle: .body, fontWeight: .medium))
                        .foregroundStyle(.white)
                    HStack {
                        Text("primarily from espresso and milk...")
                            .font(.sourcesans(fontStyle: .body, fontWeight: .medium))
                            .foregroundStyle(.white)
                        Text("Read More")
                            .font(.sourcesans(fontStyle: .body, fontWeight: .medium))
                            .foregroundStyle(.coffeeSelected)
                    }
                }
                Text("Size")
                    .font(.sourcesans(fontStyle: .title3, fontWeight: .semibold))
                    .foregroundStyle(.headinggray)
                
                HStack {
                    Spacer()
                    sizeButtons(sizeInput: "S")
                    Spacer()
                        .frame(width: 120)
                    sizeButtons(sizeInput: "M")
                    Spacer()
                        .frame(width: 120)
                    sizeButtons(sizeInput: "L")
                    Spacer()
                }
                .padding()
                HStack {
                    VStack {
                        Text("Price")
                            .font(.sourcesans(fontStyle: .body, fontWeight: .light))
                            .foregroundStyle(.white)
                        HStack(spacing: 3) {
                            Text("$")
                                .font(.sourcesans(fontStyle: .title2, fontWeight: .bold))
                                .foregroundStyle(.coffeeSelected)
                            Text("\(userCoffee.coffeePrice, specifier: "%.2f")")
                                .font(.sourcesans(fontStyle: .title2, fontWeight: .bold))
                                .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                        .frame(width: 135)
                    Button {
                        
                    } label : {
                        Text("Buy Now")
                            .font(.sourcesans(fontStyle: .title3, fontWeight: .semibold))
                            .foregroundStyle(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 250, height: 50)
                                    .foregroundStyle(.coffeeSelected)
                            }
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }.padding()
        }
    }
    
    //Size Buttons
    @ViewBuilder
    func sizeButtons(sizeInput: String) -> some View {
        Button {
            withAnimation(.smooth) {
                sizeSelection = sizeInput
            }
        } label: {
            Text(sizeInput)
                .font(.sourcesans(fontStyle: .title3, fontWeight: .semibold))
                .foregroundStyle(sizeSelection == sizeInput ? .coffeeSelected : .headinggray)
                .overlay (
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(sizeSelection == sizeInput ? .coffeeSelected : .bgcolor, lineWidth: sizeSelection == sizeInput ? 2: 1)
                        .frame(width: 100, height: 40)
                        .foregroundStyle(.bgcolor)
                        .shadow(color: sizeSelection == sizeInput ? .clear: .gray, radius: 0.75)
                )
        }
    }
    
    //Coffee list
    @ViewBuilder
    func coffeeChoices(selectedCoffee: coffeeDetails) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 160, height: 250)
                .foregroundStyle(LinearGradient(colors: [.gradientTopLeft, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack(alignment: .leading) {
                ZStack(alignment: .top) {
                    Image(selectedCoffee.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: selectedCoffee.imageURL, in: coffeeanimation)
                        .frame(width: 140, height: 135)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipped()
                    HStack() {
                        Spacer()
                        ZStack {
                            UnevenRoundedRectangle(
                                bottomLeadingRadius: 15,
                                topTrailingRadius: 10
                            )
                            .frame(width: 50, height: 20)
                            .foregroundStyle(.black.opacity(0.6))
                            HStack(alignment: .center, spacing: 3) {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 11, height: 11)
                                    .foregroundStyle(.coffeeSelected)
                                Text("\(selectedCoffee.coffeeRating, specifier: "%.2f")")
                                    .font(.sourcesans(fontStyle: .caption, fontWeight: .semibold))
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                
                Text("Cappuccino")
                    .font(.sourcesans(fontStyle: .body))
                    .foregroundStyle(.white)
                Text(selectedCoffee.coffeeContent)
                    .font(.sourcesans(fontStyle: .caption))
                    .foregroundStyle(.white)
                HStack {
                    Text("$")
                        .font(.sourcesans(fontStyle: .title2))
                        .foregroundStyle(.coffeeSelected)
                    Text("\(selectedCoffee.coffeePrice, specifier: "%.2f")")
                        .font(.sourcesans(fontStyle: .body, fontWeight: .semibold))
                        .foregroundStyle(.white)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 10, height: 18)
                    }
                    .buttonBorderShape(.roundedRectangle(radius: 15))
                    .buttonStyle(.borderedProminent)
                    .tint(.coffeeSelected)
                }
                
            }
            .padding()
        }.onTapGesture {
            withAnimation(.smooth) {
                isMain = false
                userCoffee = selectedCoffee
            }
        }
    }
}

#Preview {
    HomeView()
}

struct coffeeDetails: Codable {
    var imageURL: String
    var coffeeName: String
    var coffeeContent: String
    var coffeeRating: CGFloat
    var coffeePrice: CGFloat
}
