FROM docker-prod.dc.teliacompany.net/springfield/java:17 as builder

COPY --chown=appuser:appuser target/service.jar ./
RUN java -Djarmode=layertools -jar ./service.jar extract

FROM docker-prod.dc.teliacompany.net/springfield/java:17

WORKDIR /home/appuser

COPY --chown=appuser:appuser src/docker/start.sh .
RUN chmod +x start.sh

COPY --from=builder dependencies/ ./
COPY --from=builder snapshot-dependencies/ ./
COPY --from=builder spring-boot-loader/ ./
COPY --from=builder application/ ./

# Run as non-root user for security reasons
USER appuser

EXPOSE 8080
ENTRYPOINT ["/home/appuser/start.sh"]
