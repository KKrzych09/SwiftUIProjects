//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Kamil Krzych on 21/09/2022.
//

import SwiftUI

enum FilterType {
    case none, contacted, uncontacted
}

struct ProspectsView: View {
    
    @EnvironmentObject var prospects: Prospects
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        // when filter() runs, it passes every element in the people array through this switch.
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted } // does the current element have its isContacted property
            //set to true? All items in array that pass that test (have isContacted set to true) will be added to a new
            //array and sent back to filteredResults.
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted } // here I get the opposite: only prospects that haven't
            //been contacted get included.
        }
    }
    
    var body: some View {
        // I'm creating a list to loop over filteredProspects array. This will show both title and email for each prospect
        //using VStack, and I'm also using ForEach so I can add deleting later on.
        List {
            ForEach(filteredProspects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
