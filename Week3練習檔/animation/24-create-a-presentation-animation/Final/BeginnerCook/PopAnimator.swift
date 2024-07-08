import UIKit

final class PopAnimator: NSObject {
  var originFrame = CGRect()
  private let duration: TimeInterval = 1
}

extension PopAnimator: UIViewControllerAnimatedTransitioning {
  func transitionDuration(using _: UIViewControllerContextTransitioning?) -> TimeInterval {
    duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    //1) Set up transition
    let containerView = transitionContext.containerView

    guard let toView = transitionContext.view(forKey: .to)
    else { return }

    let initialFrame = originFrame
    let finalFrame = toView.frame

    toView.transform = .init(
      scaleX: initialFrame.width / finalFrame.width,
      y: initialFrame.height / finalFrame.height
    )
    toView.center = .init(x: initialFrame.midX, y: initialFrame.midY)

    containerView.addSubview(toView)

    //2) Animate!
    UIView.animate(
      withDuration: duration, delay: 0,
      usingSpringWithDamping: 0.4,
      initialSpringVelocity: 0,
      animations: {
        toView.transform = .identity
        toView.center = .init(x: finalFrame.midX, y: finalFrame.midY)
      },
      completion: { _ in
        transitionContext.completeTransition(true)
      }
    )
  }
}
