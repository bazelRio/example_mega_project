load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_JVM_EXTERNAL_TAG = "3.3"

RULES_JVM_EXTERNAL_SHA = "d85951a92c0908c80bd8551002d66cb23c3434409c814179c0ff026b53544dab"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

http_archive(
    name = "rules_python",
    sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.1.0/rules_python-0.1.0.tar.gz",
)

# FIRST Bazel Rules
local_repository(
    name = "wpi_bazel_rules",
    path = "C:/Users/PJ/Documents/GitHub/wpilib/original/bazel_rules/wpi-bazel-rules",
)

# WPI Dependencies, for importing all wpilib, defining robots
local_repository(
    name = "wpi_bazel_deps",
    path = "C:/Users/PJ/Documents/GitHub/wpilib/original/bazel_rules/wpi-bazel-deps-rules",
)

load("@wpi_bazel_deps//allwpilib:load_allwpilib.bzl", "load_allwpilib")

load_allwpilib(
    build_from_source = True,
    local_repository_location = None, #,"C:/Users/PJ/Documents/GitHub/wpilib/original/allwpilib",
    year = 2021,
)

# CTRE Dependencies
local_repository(
    name = "ctre_bazel_rules",
    path = "C:/Users/PJ/Documents/GitHub/wpilib/original/bazel_rules/ctre-bazel-rules",
)

# REV Dependencies
local_repository(
    name = "rev_bazel_rules",
    path = "C:/Users/PJ/Documents/GitHub/wpilib/original/bazel_rules/rev-bazel-rules",
)

# NavX Dependencies
local_repository(
    name = "navx_bazel_rules",
    path = "C:/Users/PJ/Documents/GitHub/wpilib/original/bazel_rules/navx-bazel-rules",
)

# Pull in WPI tools and build them from source
local_repository(
    name = "shuffleboard",
    path = "C:/Users/PJ/Documents/GitHub/wpilib/original/shuffleboard",
)

local_repository(
    name = "pathweaver",
    path = "C:/Users/PJ/Documents/GitHub/wpilib/original/pathweaver",
)

local_repository(
    name = "sysid",
    path = "C:/Users/PJ/Documents/GitHub/wpilib/original/sysid",
)

# Load vendor dependencies
load("//vendordeps:load_vendordeps.bzl", "load_vendordeps")

load_vendordeps()

# Load embedded cross compiler toolchains
load("@wpi_bazel_rules//toolchains:load_toolchains.bzl", "load_toolchains")

load_toolchains()

load("@wpi_bazel_rules//toolchains:configure_toolchains.bzl", "configure_toolchains")

configure_toolchains()

# Finally, load up all the third party stuff
load("//thirdparty:thirdparty.bzl", "third_party_repositories")

third_party_repositories()
