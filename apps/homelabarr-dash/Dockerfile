## HomelabARR - Dash Container
## Maintainer: smashingtags
FROM mauricenino/dashdot
LABEL org.opencontainers.image.source="https://github.com/smashintags/containers"

ENV DASHDOT_OS_WIDGET_ENABLE="true" \
    DASHDOT_CPU_WIDGET_ENABLE="true" \
    DASHDOT_CPU_DATAPOINTS="20" \
    DASHDOT_CPU_POLL_INTERVAL="1000" \
    DASHDOT_RAM_WIDGET_ENABLE="true" \
    DASHDOT_RAM_POLL_INTERVAL="1000" \
    DASHDOT_STORAGE_WIDGET_ENABLE="true"

CMD ["yarn", "start"]
##EOF
