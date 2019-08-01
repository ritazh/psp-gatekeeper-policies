package k8spspreadonlyrootfilesystem

violation[{"msg": msg, "details": {}}] {
    c := input_containers[_]
    not input_read_only_root_fs(c)
    msg := sprintf("only read-only root filesystem container is allowed: %v, securityContext: %v", [c.name, c.securityContext])
}

input_read_only_root_fs(c) {
    c.securityContext.readOnlyRootFilesystem
}

input_containers[c] {
    c := input.review.object.spec.containers[_]
    has_field(c, "securityContext")
    s := c.securityContext
    has_field(s, "readOnlyRootFilesystem")
}

input_containers[c] {
    c := input.review.object.spec.initContainers[_]
    has_field(c, "securityContext")
    s := c.securityContext
    has_field(s, "readOnlyRootFilesystem")
}

# has_field returns whether an object has a field
has_field(object, field) = true {
    object[field]
}
