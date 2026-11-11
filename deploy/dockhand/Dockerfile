FROM alpine:3.23

COPY rvb-theme.css /opt/rvb/rvb-theme.css

RUN chmod 0444 /opt/rvb/rvb-theme.css

CMD ["sh", "-ec", "mkdir -p /var/glpi/files/_themes; rm -f /var/glpi/files/_themes/rvb.scss; cp /opt/rvb/rvb-theme.css /var/glpi/files/_themes/rvb.css; chown -R 33:33 /var/glpi/files/_themes"]
