# Arsitektur FP LBE Team 02

```mermaid
flowchart TB
    Client[Client / curl] --> LB[Azure Load Balancer\nPublic IP: pip-02\nFrontend TCP 80]
    LB --> Probe[Health Probe TCP 80]
    LB --> VM1[VM 1: rayzabuf\nPrivate IP only\nDocker + Nginx]
    LB --> VM2[VM 2: vm-affan\nPrivate IP only\nDocker + Nginx]
    LB --> VM3[VM 3: VMLUCKY\nPublic IP + Private IP\nDocker + Nginx]
    LB --> VM4[VM 4: VMSAS\nPrivate IP only\nDocker + Nginx]
    VM1 --> VNet[Virtual Network\nKorea Central]
    VM2 --> VNet
    VM3 --> VNet
    VM4 --> VNet
    VNet --> RG[Resource Group: fp-lbe-team02-rg]
```

Semua VM berada dalam satu Virtual Network dan subnet yang sama. `VMLUCKY` adalah satu-satunya VM dengan Public IP untuk akses administrasi. Tiga VM lainnya hanya memiliki private IP. Azure Load Balancer menggunakan Public IP `pip-02`, health probe pada port 80, dan mendistribusikan koneksi ke VM yang sehat melalui private IP backend.
