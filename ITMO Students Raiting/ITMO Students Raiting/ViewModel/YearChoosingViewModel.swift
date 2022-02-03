//
//  YearChoosingViewModel.swift
//  ITMO Students Raiting
//
//  Created by Илья Чуб on 03.02.2022.
//

import Foundation
import SwiftSoup


final class YearChoosingViewModel: ObservableObject {
    @Published var model = YearChoosingModel()
    @Published var errorValue: String? = nil
    
    
    init(){
        do {
            try fetchData()
        } catch Errors.InternalError {
            errorValue = Errors.InternalError.textValue
        } catch Errors.WebSiteError {
            errorValue = Errors.WebSiteError.textValue
        } catch {
            errorValue = Errors.StrangeError.textValue
        }
    }
    
    func fetchData() throws {
        guard let url = URL(string: Constants.baseURL) else {
            throw Errors.InternalError
        }
        
        let html: String = try String(contentsOf: url)
        print(html)

    }
    
    enum Errors: Error {
        case InternalError
        case WebSiteError
        case StrangeError
        
        var textValue: String {
            switch self {
            case .WebSiteError:
                return "Хехе ... с с сайтом, с которого берется информация что-то не так"
            case .InternalError:
                return "Упс, у приложения беда с головой"
            case .StrangeError:
                return "Ого. Такой ошибки мы еще не видели"
            }
        }
    }
}
