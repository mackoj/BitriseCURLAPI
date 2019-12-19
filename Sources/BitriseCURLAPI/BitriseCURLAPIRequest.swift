import Foundation

// MARK: - BitriseCURL
public struct BitriseCURLAPIRequest: Equatable, Codable {
    public let hookInfo: HookInfo?
    public let buildParams: BuildParams?
    public let triggeredBy: String?

    public init(hookInfo: HookInfo?, buildParams: BuildParams?, triggeredBy: String?) {
        self.hookInfo = hookInfo
        self.buildParams = buildParams
        self.triggeredBy = triggeredBy
    }
}

// BuildParams.swift

import Foundation

// MARK: - BuildParams
public struct BuildParams: Equatable, Codable {
    public let branch: String?
    public let workflowId: String?
    public let environments: [Environment]?

    public init(branch: String?, workflowId: String?, environments: [Environment]?) {
        self.branch = branch
        self.workflowId = workflowId
        self.environments = environments
    }
}

// Environment.swift

import Foundation

// MARK: - Environment
public struct Environment: Equatable, Codable {
    public let mappedTo: String?
    public let value: String?
    public let isExpand: Bool?

    public init(mappedTo: String?, value: String?, isExpand: Bool?) {
        self.mappedTo = mappedTo
        self.value = value
        self.isExpand = isExpand
    }
}

// HookInfo.swift

import Foundation

// MARK: - HookInfo
public struct HookInfo: Equatable, Codable {
    public let type: String?
    public let buildTriggerToken: String?

    public init(type: String?, buildTriggerToken: String?) {
        self.type = type
        self.buildTriggerToken = buildTriggerToken
    }
}

