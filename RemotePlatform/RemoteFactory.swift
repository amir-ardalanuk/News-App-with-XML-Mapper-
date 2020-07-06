//
//  RemoteFactory.swift
//  RemotePlatform
//
//  Created by Amir Ardalan on 6/27/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import NetworkPlatform
import Swinject

public class RemoteFactory {
    
    let network: NetworkRequest
    public init(network: NetworkRequest) {
        self.network = network
    }
    
    public func deliveryUsecase() -> DeliveryUsecaseImpl {
        return DeliveryUsecaseImpl(network: self.network)
    }

}

public class RemoteFactoryAssembly: Assembly {
    public init() {
        
    }
    public func assemble(container: Container) {
        container.register(RemoteFactory.self) { (resolver) in
            let networkRequest = resolver.resolve(Requester.self)!
            return RemoteFactory(network: networkRequest)
        }.inObjectScope(.weak)
    }
}
