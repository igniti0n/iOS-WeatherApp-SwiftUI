import UIKit

final class RootRouter {
  private var rootController: UINavigationController?
  private var completions: [UIViewController : () -> Void]
  
  init(rootController: UINavigationController) {
    self.rootController = rootController
    self.completions = [:]
  }

  func push(_ vc: UIViewController, animated: Bool, completion: (() -> Void)?)  {
    if let completion = completion {
      self.completions[vc] = completion
    }
    self.rootController?.pushViewController(vc, animated: animated)
  }
  
  func popModule(animated: Bool)  {
    if let controller = rootController?.popViewController(animated: animated) {
      self.runCompletion(for: controller)
    }
  }
  
  func setRootModule(_ vc: UIViewController, hideBar: Bool) {
    self.rootController?.setViewControllers([vc], animated: false)
    self.rootController?.isNavigationBarHidden = hideBar
  }
  
  func popToRootModule(animated: Bool) {
    if let controllers = self.rootController?.popToRootViewController(animated: animated) {
      controllers.forEach { controller in
        self.runCompletion(for: controller)
      }
    }
  }

}

// MARK: - Private methods
extension RootRouter {
  private func runCompletion(for controller: UIViewController) {
    guard let completion = self.completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
}


