# FPLBE02 - Portfolio on Azure Load Balancer

Final Project Lab Based Education oleh tim `fp=lbe-team02`.

Aplikasi yang digunakan adalah portfolio statis berbasis HTML, CSS, dan JavaScript. Aplikasi dijalankan di Docker pada 4 VM Azure, lalu diakses melalui Azure Load Balancer.

## Struktur

```text
app/                 Source aplikasi dan Dockerfile
docs/architecture.md Diagram arsitektur
docs/evidence/       Bukti pengujian distribusi traffic
```

## Menjalankan secara lokal

```bash
docker build -t fplbe02-portfolio -f app/Dockerfile app
docker run --rm -p 8080:80 -e BACKEND_HOSTNAME=local-vm fplbe02-portfolio
```

Buka `http://localhost:8080`. Footer halaman menampilkan hostname backend.

## Deployment pada setiap VM

Jalankan pada masing-masing VM Ubuntu:

```bash
sudo apt-get update
sudo apt-get install -y docker.io git
sudo systemctl enable --now docker
git clone https://github.com/<username>/FPLBE02.git
cd FPLBE02
sudo docker build -t fplbe02-portfolio -f app/Dockerfile app
sudo docker run -d --name portfolio --restart unless-stopped -p 80:80 \\
  -e BACKEND_HOSTNAME=$(hostname) fplbe02-portfolio
```

Pastikan setiap VM dapat diakses pada port TCP 80 dari Azure Load Balancer. NSG harus mengizinkan inbound TCP 80 dari Internet atau sumber yang digunakan untuk pengujian.

## Pengujian distribusi traffic

Setelah public IP Load Balancer aktif, jalankan:

```bash
for i in $(seq 1 30); do curl -s http://<LOAD_BALANCER_PUBLIC_IP>/ | grep -o 'Backend: [^<]*'; done
```

Output diharapkan menampilkan hostname dari lebih dari satu VM. Simpan output tersebut sebagai `docs/evidence/curl-loop-output.txt`.

## Azure resource yang diperlukan

- Resource Group: `fp-lbe-team02-rg`
- Region: `Korea Central`
- Virtual Network dan subnet yang sama untuk 4 VM
- 4 VM Ubuntu
- Azure Load Balancer public dengan backend pool berisi 4 VM
- Health probe TCP port 80
- Load balancing rule TCP port 80 ke backend port 80
