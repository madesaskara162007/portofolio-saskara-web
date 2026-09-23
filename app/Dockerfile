FROM nginx:1.27-alpine

COPY index.html style.css script.js backend-info.js /usr/share/nginx/html/
COPY "WhatsApp Image 2026-09-19 at 17.13.44.jpeg" /usr/share/nginx/html/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
