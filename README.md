# psp-gatekeeper-policies
This repo contains common policies needed in Pod Security Policy but implemented as Constraints and Constraint Templates with Gatekeeper.

A [Pod Security Policy](https://kubernetes.io/docs/concepts/policy/pod-security-policy/) is a cluster-level resource that controls security
sensitive aspects of the pod specification. The `PodSecurityPolicy` objects
define a set of conditions that a pod must run with in order to be accepted into
the system, as well as defaults for the related fields.

[Gatekeeper](https://github.com/open-policy-agent/gatekeepe) is a customizable admission webhook for Kubernetes that enforces policies executed by the [Open Policy Agent (OPA)](https://www.openpolicyagent.org), a policy engine for Cloud Native environments hosted by CNCF.


