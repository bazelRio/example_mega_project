load("@wpi_bazel_deps//third_party/gtest:repo.bzl", "third_party_gtest")
load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@local_allwpilib//:repo.bzl", "third_party_allwpilib")
load("@shuffleboard//bazel_dependencies:maven_dependencies.bzl", "get_shuffleboard_maven_deps", "setup_shuffleboard_manual_maven_deps")
load("@pathweaver//bazel_dependencies:maven_dependencies.bzl", "get_pathweaver_maven_deps")
load("@wpi_bazel_deps//third_party:org_juni_jupiter_junit5.bzl", "get_junit5_maven_deps")
load("@wpi_bazel_deps//third_party:com_fasterxml_jackson_core.bzl", "get_fasterxml_maven_deps")
load("@wpi_bazel_deps//third_party:org_openjfx_javafx.bzl", "get_javafx_maven_deps")
load("//vendordeps:setup_vendordeps.bzl", "setup_vendordeps")

def __add(artifacts, repositories, functor):
    new_artifacts, new_repositories = functor()

    return artifacts + new_artifacts, repositories + new_repositories

def third_party_repositories():
    third_party_gtest()
    setup_shuffleboard_manual_maven_deps()

    artifacts = []
    repositories = ["https://repo1.maven.org/maven2"]

    # Add pure java artifacts
    artifacts += get_shuffleboard_maven_deps()
    artifacts += get_pathweaver_maven_deps()
    artifacts += get_fasterxml_maven_deps()
    artifacts += get_junit5_maven_deps()
    artifacts += get_javafx_maven_deps()

    # Add native + java artifacts
    artifacts, repositories = __add(artifacts, repositories, third_party_allwpilib)
    artifacts, repositories = __add(artifacts, repositories, setup_vendordeps)

    maven_install(
        name = "maven",
        artifacts = artifacts,
        repositories = repositories,
        fetch_sources = True,
    )
