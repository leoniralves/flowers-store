import Danger 
// import DangerSwiftCoverage
// import DangerXCodeSummary
import DangerSwiftPeriphery

// let danger = Danger()

// let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
// message("These files have changed: \(editedFiles.joined(separator: ", "))")

// let summary = XCodeSummary(filePath: "result.json")
// summary.report()

// Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), 
//                             minimumCoverage: 90, 
//                             excludedTargets: ["FlowersStoreTests.xctest"])

DangerPeriphery.scan(arguments: [
    "--workspace FlowersStore.xcworkspace",
    "--schemes FlowersStore",
    "--targets FlowersStore, FlowersStoreTests",
    "--quiet false",
    "--index-store-path Build/Index/DataStore",
    "--skip-build"
])