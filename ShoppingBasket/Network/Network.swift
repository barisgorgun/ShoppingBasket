//
//  Network.swift
//  ShoppingBasket
//
//  Created by MacBook on 19.12.2020.
//

import Foundation

class Network {
  static  func getHomePageData(successHandler: @escaping([Brand])->()){
    var brandList:[Brand] = [Brand]()
    
    brandList.append(Brand.init(id: 1, brandName: "Pierre Cardin", imageName: "pierrecardin"))
    brandList.append(Brand.init(id: 2, brandName: "Trendyol Milla", imageName: "trendyolmilla"))
    brandList.append(Brand.init(id: 3, brandName: "Avva", imageName: "avva"))
    brandList.append(Brand.init(id: 4, brandName: "Derimod", imageName: "derimod"))
    brandList.append(Brand.init(id: 5, brandName: "Mavi", imageName: "mavi"))
    brandList.append(Brand.init(id: 6, brandName: "LTB", imageName: "ltb"))
    brandList.append(Brand.init(id: 7, brandName: "Bambi", imageName: "bambi"))
    brandList.append(Brand.init(id: 8, brandName: "Hatemoglu", imageName: "hatemoglu"))
    brandList.append(Brand.init(id: 9, brandName: "Hummel", imageName: "hummel"))
    brandList.append(Brand.init(id: 10, brandName: "Jack&Jones", imageName: "jack&jones"))
    brandList.append(Brand.init(id: 11, brandName: "LCWaikiki", imageName: "lcwaikiki"))
    brandList.append(Brand.init(id: 12, brandName: "Sateen", imageName: "sateen"))
    brandList.append(Brand.init(id: 13, brandName: "Lufian", imageName: "lufian"))
    
    
    successHandler(brandList)
            
        }
    
    static func getCategoryList (successHandler: @escaping([SubCategory])->()) {
        var subCategoryList : [SubCategory] = [SubCategory]()
        subCategoryList.append(SubCategory.init(id: 0, categoryName: "All"))
        subCategoryList.append(SubCategory.init(id: 1, categoryName: "T-Shirt"))
        subCategoryList.append(SubCategory.init(id: 2, categoryName: "Kazak"))
        subCategoryList.append(SubCategory.init(id: 3, categoryName: "Pantolon"))
        subCategoryList.append(SubCategory.init(id: 4, categoryName: "SweatShirt"))
        subCategoryList.append(SubCategory.init(id: 5, categoryName: "Gömlek"))
        subCategoryList.append(SubCategory.init(id: 6, categoryName: "Ceket"))
        subCategoryList.append(SubCategory.init(id: 7, categoryName: "Mont"))
        
   
        successHandler(subCategoryList)
    }
    
    
    static func getProductList (brandId: Int,successHandler: @escaping([Product])->()) {
        var productList : [Product] = [Product]()
        
      
        productList.append(Product.init(id: 1, brandId: 1,brandName:"Pierre Cardin", subCategoryId: 6, productName: "Pierre Cardin Ceket", imageName: "ceket1",price: 48.00))
        productList.append(Product.init(id: 2, brandId: 1, brandName: "Pierre Cardin", subCategoryId: 1, productName: "Pierre Cardin Polo T-Shirt", imageName: "t-shirt4", price: 19.00))
        productList.append(Product.init(id: 3, brandId: 1, brandName: "Pierre Cardin", subCategoryId: 2, productName: "Pierre Cardin Uzun Kol Kazak", imageName: "kazak1", price: 39.00))
        productList.append(Product.init(id: 4, brandId: 1, brandName: "Pierre Cardin", subCategoryId: 3, productName: "Pierre Cardin Pantolon", imageName: "pantolon1", price: 79.00))
        productList.append(Product.init(id: 5, brandId: 2,brandName:"Trendyol Milla", subCategoryId: 7, productName: "Trendyol Milla Mont", imageName: "mont2",price: 119.00))
        productList.append(Product.init(id: 6, brandId: 2,brandName:"Trendyol Milla", subCategoryId: 1, productName: "Polo T-Shirt", imageName: "t-shirt2",price: 39.00))
        productList.append(Product.init(id: 7, brandId: 2,brandName:"Trendyol Milla", subCategoryId: 6, productName: "Kadın Ceket", imageName: "ceket2",price: 79.00))
        productList.append(Product.init(id: 8, brandId: 2,brandName:"Trendyol Milla", subCategoryId: 4, productName: "Erkek SweatShirt", imageName: "sweatshirt3",price: 59.00))
        productList.append(Product.init(id: 9, brandId: 3,brandName:"Avva",subCategoryId: 3, productName: "Avva Erkek Kot", imageName: "pantolon1",price: 129.00))
        productList.append(Product.init(id: 10, brandId: 3,brandName:"Avva",subCategoryId: 5, productName: "Avva Erkek Gömlek", imageName: "gömlek3",price: 99.00))
        productList.append(Product.init(id: 11, brandId: 3,brandName:"Avva", subCategoryId: 6, productName: "Kadın Ceket", imageName: "ceket4",price: 232.00))
        productList.append(Product.init(id: 12, brandId: 5,brandName:"Mavi", subCategoryId: 3, productName: "Mavi Kot", imageName: "pantolon3",price: 79.00))
        productList.append(Product.init(id: 13, brandId: 5,brandName:"Avva",subCategoryId: 5, productName: "Mavi Kadın Gömlek", imageName: "gömlek1",price: 100.00))
        productList.append(Product.init(id: 14, brandId: 6,brandName:"LTB", subCategoryId: 3, productName: "LTB Kot", imageName: "pantolon2",price: 49.00))
        productList.append(Product.init(id: 15, brandId: 8,brandName:"Hatemoğlu", subCategoryId: 6, productName: "Hatemoğlu Kadın  Mont", imageName: "mont4",price: 119.00))
        productList.append(Product.init(id: 16, brandId: 12,brandName:"Sateen",subCategoryId: 3, productName: "Sateen Kot", imageName: "pantolon3",price: 45.00))
       
        
        
    
        
        
        /*
    
         id: 4, brandName: "Derimod", imageName: "derimod"))
         id: 5, brandName: "Mavi", imageName: "mavi"))
         id: 6, brandName: "LTB", imageName: "ltb"))
         id: 7, brandName: "Bambi", imageName: "bambi"))
         id: 8, brandName: "Hatemoglu", imageName: "hatemoglu"))
         id: 9, brandName: "Hummel", imageName: "hummel"))
         id: 10, brandName: "Jack&Jones", imageName: "jack&jones"))
         id: 11, brandName: "LCWaikiki", imageName: "lcwaikiki"))
         id: 12, brandName: "Sateen", imageName: "sateen"))
         id: 13, brandName: "Lufian", imageName: "lufian"))
         
         
         id: 1, categoryName: ""T-Shirt""))1
         id: 2, categoryName: "Kazak"))1
         id: 3, categoryName: "Pantolon"))1
         id: 4, categoryName: "SweatShirt"))1
         id: 5, categoryName: "Gömlek"))1
         id: 6, categoryName: "Ceket"))1
         id: 7, categoryName: "Mont"))1
         */
        
        productList = productList.filter {
            $0.brandId == brandId
        }
        
        
        successHandler(productList)
    }
    
    
}
