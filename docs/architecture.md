# Arsitektur FP LBE Team 02

```mermaid
flowchart TB
    Client[Client / curl] --> LB[Azure Load Balancer\nPublic Frontend: TCP 80]
    LB --> Probe[Health Probe TCP 80]
    LB --> VM1[VM 1\nDocker + Nginx\nBackend hostname]
    LB --> VM2[VM 2\nDocker + Nginx\nBackend hostname]
    LB --> VM3[VM 3\nDocker + Nginx\nBackend hostname]
    LB --> VM4[VM 4\nDocker + Nginx\nBackend hostname]
    VM1 --> VNet[Virtual Network\nKorea Central]
    VM2 --> VNet
    VM3 --> VNet
    VM4 --> VNet
    VNet --> RG[Resource Group: fp-lbe-team02-rg]
```

Semua VM berada dalam satu Virtual Network dan subnet yang sama. Azure Load Balancer menggunakan health probe pada port 80 dan mendistribusikan koneksi ke VM yang sehat.
