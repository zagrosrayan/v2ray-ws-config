FROM alpine:latest

# نصب ابزارها
RUN apk update && apk add --no-cache caddy v2ray bash

# کپی فایل‌ها
COPY Caddyfile /etc/caddy/Caddyfile
COPY v2ray-server.json /etc/v2ray/config.json

# باز کردن پورت مورد نیاز
EXPOSE 8080

# اجرای همزمان caddy و v2ray
CMD sh -c "caddy run & v2ray run -config /etc/v2ray/config.json"
