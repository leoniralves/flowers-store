import Danger 
// import DangerSwiftCoverage

let danger = Danger()

let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
message("These files have changed: \(editedFiles.joined(separator: ", "))")

// Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), 
//                             minimumCoverage: 100, 
//                             excludedTargets: ["DangerSwiftCoverageTests.xctest"])