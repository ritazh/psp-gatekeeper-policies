# psp-gatekeeper-policies

⚠️⚠️⚠️ This repo has been donated to the CNCF [Open Policy Agent Gatekeeper](https://github.com/open-policy-agent/gatekeeper) project. You can find the same policies under [https://github.com/open-policy-agent/gatekeeper/tree/master/library/pod-security-policy/](https://github.com/open-policy-agent/gatekeeper/tree/master/library/pod-security-policy/). Feel free to open issues and PRs there!

--------------


This repo contains common policies needed in Pod Security Policy but implemented as Constraints and Constraint Templates with Gatekeeper.

A [Pod Security Policy](https://kubernetes.io/docs/concepts/policy/pod-security-policy/) is a cluster-level resource that controls security
sensitive aspects of the pod specification. The `PodSecurityPolicy` objects define a set of conditions that a pod must run with in order to be accepted into
the system, as well as defaults for the related fields.

[Gatekeeper](https://github.com/open-policy-agent/gatekeeper) is a customizable admission webhook for Kubernetes that enforces policies executed by the [Open Policy Agent (OPA)](https://www.openpolicyagent.org), a policy engine for Cloud Native environments hosted by CNCF.

An adminstrator can control the following by setting the field in PSP or by deploying the corresponding Gatekeeper constraint and constraint templates:

| Control Aspect                                    | Field Names in PSP                                                          | Gatekeeper Constraint and Constraint Template                    |
| ------------------------------------------------- | --------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| Running of privileged containers                  | `privileged`                                                                | [privileged-containers](../../tree/master/privileged-containers) |
| Usage of host namespaces                          | `hostPID`, `hostIPC`                                                        | [host-namespaces](../../tree/master/host-namespaces)             |
| Usage of host networking and ports                | `hostNetwork`, `hostPorts`                                                  | [host-network-ports](../../tree/master/host-network-ports)       |
| Usage of volume types                             | `volumes`                                                                   | [volumes](../../tree/master/volumes)                             |
| Usage of the host filesystem                      | `allowedHostPaths`                                                          | [host-filesystem](../../tree/master/host-filesystem)             |
| White list of Flexvolume drivers                  | `allowedFlexVolumes`                                                        | [flexvolume-drivers](../../tree/master/flexvolume-drivers)       |
| Allocating an FSGroup that owns the pod's volumes | `fsGroup`                                                                   | [fsgroup](../../tree/master/fsgroup)<sup>\*</sup>                |
| Requiring the use of a read only root file system | `readOnlyRootFilesystem`                                                    | [read-only-root-filesystem](read-only-root-filesystem)           |
| The user and group IDs of the container           | `runAsUser`, `runAsGroup`, `supplementalGroups`                             |
| Restricting escalation to root privileges         | `allowPrivilegeEscalation`, `defaultAllowPrivilegeEscalation`               | [allow-privilege-escalation](allow-privilege-escalation)         |
| Linux capabilities                                | `defaultAddCapabilities`, `requiredDropCapabilities`, `allowedCapabilities` |
| The SELinux context of the container              | `seLinux`                                                                   |
| The Allowed Proc Mount types for the container    | `allowedProcMountTypes`                                                     | [proc-mount](proc-mount)                                         |
| The AppArmor profile used by containers           | annotations                                                                 |
| The seccomp profile used by containers            | annotations                                                                 |
| The sysctl profile used by containers             | `forbiddenSysctls`,`allowedUnsafeSysctls`                                   |                                                                  |

<sup>\*</sup> For PSP rules that apply default value or mutations, Gatekeeper v3 currently cannot apply mutation.
