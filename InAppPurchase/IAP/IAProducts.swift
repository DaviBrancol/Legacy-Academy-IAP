import Foundation

public struct IAProducts {
    
    public static let primeiraIAP: ProductIdentifier = "br.Tutorial.IAPTutorial2018.PrimeiraIAP"
    
    fileprivate static let productIdentifiers: Set<ProductIdentifier> = [IAProducts.primeiraIAP]
    
    public static let store = IAPHelper(productIds: IAProducts.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}

