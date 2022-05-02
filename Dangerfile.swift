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
        // runPeriphery()
        // runXCodeSummary()
        // runXCodeBuildCoverage()
        // runTestsUpdatedValidate()
        checkHavingTests()
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

    // private runTestsUpdatedValidate() {
    //     // Warn when library files has been updated but not tests.
    //     let testsUpdated = danger.git.modifiedFiles.contains { $0.hasPrefix("Tests") || $0.hasPrefix("Test") }
    //     if allSourceFiles && !testsUpdated {
    //         warn("The library files were changed, but the tests remained unmodified. Consider updating or adding to the tests to match the library changes.")
    //     }
    // }

    private func checkHavingTests() {
        let createdFiles = danger.git.createdFiles
        let sourceChanges = createdFiles.filter { $0.hasPrefix("FlowersStore/") }
        let sourceTestChanges = createdFiles.filter { $0.hasPrefix("FlowersStoreTests/") }
        let swiftCreatedFiles = sourceChanges.filter { $0.hasSuffix(".swift") }
        let swiftCreatedFilesTests = sourceTestChanges.filter { $0.hasSuffix("Tests.swift") || $0.hasSuffix("Test.swift") }
        
        // for swiftCreatedFilesTest in swiftCreatedFilesTests {
        //     // Check if the file doesn't require test
        //     let isRequiredTest = !danger.utils.readFile(viewModel).contains("// danger:notest")
        //     guard isRequiredTest else {
        //         return
        //     }

        //     let baseViewModelFileName = ((viewModel as NSString).lastPathComponent as NSString).deletingPathExtension
        //     let foundTest = viewModelTests.filter { (($0 as NSString).lastPathComponent as NSString).deletingPathExtension.hasPrefix(baseViewModelFileName) }
        //     guard foundTest.count == 0 else {
        //         return
        //     }
        //     warn("You have created `\(viewModel)` but there is no test `\(baseViewModelFileName)Tests.swift` found.")
        // }

        // for i in createdFiles.filter { !$0.hasPrefix("Tests.swift") } {
        //     let file = ((i as NSString).lastPathComponent as NSString)
        //     print(file)
            
            
        // }

        print(swiftCreatedFilesTests)

        let files = swiftCreatedFiles.filter { !$0.hasPrefix("Tests.swift") }

        for filePath in files {
            let file = ((filePath as NSString).lastPathComponent as NSString)
            
            if !swiftCreatedFilesTests.contains { $0.hasSuffix("\(file.deletingPathExtension)Tests.swift") } {
                print("\(file) has no test")
            } else {
                print("\(file) has test ###")
            }
        }
        
        
    }
}