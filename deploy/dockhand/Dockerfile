ARG GLPI_VERSION=12.0
FROM glpi/glpi:${GLPI_VERSION}

USER root

COPY rvb-theme.css /opt/rvb/rvb-theme.css
COPY rvb-entrypoint.sh /opt/rvb/entrypoint.sh

RUN chmod 0555 /opt/rvb/entrypoint.sh \
    && chmod 0444 /opt/rvb/rvb-theme.css

USER www-data

ENTRYPOINT ["/opt/rvb/entrypoint.sh"]
