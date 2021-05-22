load("@rules_java//java:defs.bzl", "java_library")
load("@wpi_bazel_rules//rules:cc.bzl", "wpilib_cc_library")

java_library(
    name = "vendordeps-java",
    exports = [
        "@local_allwpilib//:wpilibNewCommands-java",
    ],
)

wpilib_cc_library(
    name = "vendordeps-cpp",
    raw_deps = [
        "@local_allwpilib//:wpilibNewCommands-cpp",
    ],
)
