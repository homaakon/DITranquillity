//
//  DIStoryboardResolver.swift
//  DITranquillity
//
//  Created by Alexander Ivlev on 05/01/17.
//  Copyright © 2016 Alexander Ivlev. All rights reserved.
//

import UIKit

final class DIStoryboardResolver: NSObject, _DIStoryboardBaseResolver {
  init(container: DIContainer) {
    self.container = container
  }

  @objc public func resolve(_ viewController: UIViewController, identifier: String) -> UIViewController {
    _ = try? container.resolve(viewController)
		
		for childVC in viewController.childViewControllers {
			_ = try? container.resolve(childVC)
		}
		
		viewController.viewDidLoad()

    return viewController
  }

  private let container: DIContainer
}
