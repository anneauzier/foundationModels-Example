import Foundation
import FoundationModels
import Playgrounds

#Playground {
    let model = SystemLanguageModel.default
    
    switch model.availability {
    case .available:
        print("Foundation Models is available and ready to go!")
    case .unavailable(.deviceNotEligible):
        print("The model is not available on this device.")
        
    case .unavailable(.appleIntelligenceNotEnabled):
        print("Apple Intelligence is not enabled in Settings.")
        
    case .unavailable(.modelNotReady):
        print("The model is not ready yet. Please try again later.")
        
    case .unavailable(let other):
        print("The model is unavailable for an unknown reason.")
    }
}

