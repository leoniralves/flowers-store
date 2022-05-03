import Foundation
import Danger
import DangerSwiftCoverage
import DangerXCodeSummary
import DangerSwiftPeriphery

let danger = Danger()
let allSourceFiles = danger.git.modifiedFiles + danger.git.createdFiles

let validator: Validator = .init()
validator.validate()

struct Validator {

    func validate() {
        runPeriphery()
        runXCodeSummary()
        runXCodeBuildCoverage()
        runTestsUpdatedValidate()
        checkHavingTestsToCreatedFiles()
        checkHavingTestsToModifiedFiles()
    }

    private func runPeriphery() {
        DangerPeriphery.scan()
    }

    private func runXCodeSummary() {
        let summary = XCodeSummary(filePath: "result.json")
        summary.report()
    }

    private func runXCodeBuildCoverage() {
        Coverage.xcodeBuildCoverage(
            .derivedDataFolder("Build"), 
            minimumCoverage: 80, 
            excludedTargets: ["FlowersStoreTests.xctest"]
        )
    }

    private func checkHavingTestsToCreatedFiles() {
        let createdFiles = danger.git.createdFiles
        let sourceChanges = createdFiles.filter { $0.hasPrefix("FlowersStore/") }
        let swiftCreatedFiles = sourceChanges.filter { $0.hasSuffix(".swift") }
        
        let files = swiftCreatedFiles.filter { !$0.hasPrefix("Tests.swift") && !$0.hasPrefix("Test.swift") }
        for filePath in files {
            let file = ((filePath as NSString).lastPathComponent as NSString)
            
            if !createdFiles.contains(where: { $0.hasSuffix("\(file.deletingPathExtension)Tests.swift") || $0.hasSuffix("\(file.deletingPathExtension)Test.swift") }) {
                warn("You have created `\(file)` but there is no test `\(file.deletingPathExtension)Tests.swift` found.")
            }
        }
    }

    private func checkHavingTestsToModifiedFiles() {
        let modifiedFiles = danger.git.modifiedFiles
        let sourceChanges = modifiedFiles.filter { $0.hasPrefix("FlowersStore/") }
        let swiftCreatedFiles = sourceChanges.filter { $0.hasSuffix(".swift") }
        let sourceTestChanges = modifiedFiles.filter { $0.hasPrefix("FlowersStoreTests/") }
        let swiftCreatedFilesTests = sourceTestChanges.filter { $0.hasSuffix("Tests.swift") || $0.hasSuffix("Test.swift") }
        
        let files = swiftCreatedFiles.filter { !$0.hasPrefix("Tests.swift") }
        for filePath in files {
            let file = ((filePath as NSString).lastPathComponent as NSString)
            
            if !swiftCreatedFilesTests.contains(where: { $0.hasSuffix("\(file.deletingPathExtension)Tests.swift") }) {
                warn("The `\(file)` file was changed, but the tests remained unmodified. Consider updating or adding the tests to match the PR changes.")
            }
        }
    }
}