package k8spspreadonlyrootfilesystem

test_input_container_not_readonlyrootfilesystem_allowed {
    input := { "review": input_review}
    results := violation with input as input
    count(results) == 0
}
test_input_container_not_readonlyrootfilesystem_no_security_context_allowed {
    input := { "review": input_review_no_security_context}
    results := violation with input as input
    count(results) == 0
}
test_input_container_readonlyrootfilesystem_not_allowed {
    input := { "review": input_review_ro}
    results := violation with input as input
    count(results) > 0
}
test_input_container_many_not_readonlyrootfilesystem_allowed {
    input := { "review": input_review_many}
    results := violation with input as input
    count(results) == 0
}
test_input_container_many_mixed_readonlyrootfilesystem_not_allowed {
    input := { "review": input_review_many_mixed}
    results := violation with input as input
    count(results) > 0
}
test_input_container_many_mixed_readonlyrootfilesystem_not_allowed_two {
    input := { "review": input_review_many_mixed_two}
    results := violation with input as input
    count(results) == 2
}

input_review = {
    "object": {
        "metadata": {
            "name": "nginx"
        },
        "spec": {
            "containers": input_containers_one
      }
    }
}

input_review_no_security_context = {
    "object": {
        "metadata": {
            "name": "nginx"
        },
        "spec": {
            "containers": input_containers_no_security_context
      }
    }
}

input_review_ro = {
    "object": {
        "metadata": {
            "name": "nginx"
        },
        "spec": {
            "containers": input_containers_one_ro
      }
    }
}

input_review_many = {
    "object": {
        "metadata": {
            "name": "nginx"
        },
        "spec": {
            "containers": input_containers_many,
            "initContainers": input_containers_one
      }
    }
}

input_review_many_mixed = {
    "object": {
        "metadata": {
            "name": "nginx"
        },
        "spec": {
            "containers": input_containers_many,
            "initContainers": input_containers_one_ro
      }
    }
}

input_review_many_mixed_two = {
    "object": {
        "metadata": {
            "name": "nginx"
        },
        "spec": {
            "containers": input_containers_many_mixed,
            "initContainers": input_containers_one_ro
      }
    }
}

input_containers_no_security_context = [
{
    "name": "nginx",
    "image": "nginx",
}]

input_containers_one = [
{
    "name": "nginx",
    "image": "nginx",
    "securityContext": {
      "readOnlyRootFilesystem": false
    }
}]

input_containers_one_ro = [
{
    "name": "nginx",
    "image": "nginx",
    "securityContext": {
      "readOnlyRootFilesystem": true
    }
}]

input_containers_many = [
{
    "name": "nginx",
    "image": "nginx",
    "securityContext": {
      "readOnlyRootFilesystem": false
    }
},
{
    "name": "nginx1",
    "image": "nginx"
}]

input_containers_many_mixed = [
{
    "name": "nginx",
    "image": "nginx",
    "securityContext": {
      "readOnlyRootFilesystem": false
    }
},
{
    "name": "nginx1",
    "image": "nginx",
    "securityContext": {
      "readOnlyRootFilesystem": true
    }
}]
