load("@local_ctre//:ctre.bzl", "third_party_ctre")
load("@local_rev//:rev.bzl", "third_party_rev")
load("@local_navx//:navx.bzl", "third_party_navx")

def __add(artifacts, repositories, functor):
    new_artifacts, new_repositories = functor()

    return artifacts + new_artifacts, repositories + new_repositories

def setup_vendordeps():
    artifacts = []
    repositories = []

    artifacts, repositories = __add(artifacts, repositories, third_party_ctre)
    artifacts, repositories = __add(artifacts, repositories, third_party_rev)
    artifacts, repositories = __add(artifacts, repositories, third_party_navx)

    return artifacts, repositories
