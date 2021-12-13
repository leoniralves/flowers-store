//
//  UIView+Constraints.swift
//  FlowersStore
//
//  Created by Magno Ferreira on 28/10/21.
//

import UIKit

extension UIView {
    // MARK: - Anchors and programmatically constraints

    func constraintToSuperview(constant: CGFloat = 0) {
        if let view = self.superview {
            self
                .topAnchor(equalTo: view.topAnchor, constant: constant)
                .leadingAnchor(equalTo: view.leadingAnchor, constant: constant)
                .trailingAnchor(equalTo: view.trailingAnchor, constant: -constant)
                .bottomAnchor(equalTo: view.bottomAnchor, constant: -constant)
        }
    }

    /// Function to add more than one view to view's hierarchy
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }

    @discardableResult func topAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func topAnchor(greaterThan anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func topAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func topAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func topAnchorToSuperview(constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        guard let superview = superview else { fatalError("View doesn't have a superview") }
        let constraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func bottomAnchor(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func bottomAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func bottomAnchorToSuperview(constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required, safeArea: Bool = true) -> Self {
        guard let superview = superview else { fatalError("View doesn't have a superview") }
        let bottom: NSLayoutYAxisAnchor = safeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor
        let constraint: NSLayoutConstraint = bottomAnchor.constraint(equalTo: bottom, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func leadingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func leadingAnchorToSuperview(constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        guard let superview = superview else { fatalError("View doesn't have a superview") }
        let constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func trailingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func trailingAnchor(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func trailingAnchor(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func trailingAnchorToSuperview(constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        guard let superview = superview else { fatalError("View doesn't have a superview") }
        let constraint = trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func heightAnchor(equalTo height: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func heightAnchor(equalTo nsLayoutDimension: NSLayoutDimension, multiplier: CGFloat = 1.0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let heightConstraint = heightAnchor.constraint(equalTo: nsLayoutDimension, multiplier: multiplier)
        heightConstraint.priority = priority
        heightConstraint.isActive = true
        return self
    }

    @discardableResult func heightAnchor(greaterThanOrEqualToConstant height: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func heightAnchor(lessThanOrEqualToConstant height: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: height)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func widthAnchor(equalTo width: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func widthAnchor(equalTo nsLayoutDimension: NSLayoutDimension, multiplier: CGFloat = 1.0) -> Self {
        widthAnchor.constraint(equalTo: nsLayoutDimension, multiplier: multiplier).isActive = true
        return self
    }

    @discardableResult func widthAnchor(greaterThanOrEqualToConstant width: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func widthAnchor(lessThanOrEqualToConstant width: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: width)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func centerXAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func centerYAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}

