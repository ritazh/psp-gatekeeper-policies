package k8spspreadonlyrootfilesystem

violation[{"msg": msg, "details": {}}] {
    c := input_containers[_]
    input_read_only_root_fs(c)
    msg := sprintf("only read-only root filesystem container is allowed: %v", [c.name])
}

input_read_only_root_fs(c) {
    not has_field(c, "securityContext")
}
input_read_only_root_fs(c) {
    has_field(c, "securityContext")
    not has_field(c.securityContext, "readOnlyRootFilesystem")
}

input_containers[c] {
    c := input.review.object.spec.containers[_]
}
input_containers[c] {
    c := input.review.object.spec.initContainers[_]
}

# has_field returns whether an object has a field
has_field(object, field) = true {
    object[field]
}
