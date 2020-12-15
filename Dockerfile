# Stage 1: Build an Angular Docker Image

FROM node as build

WORKDIR /app

COPY oboco-frontend/package*.json /app/

RUN npm install

COPY oboco-frontend/ /app/

RUN npm run build -- --outputPath=./dist/out/ --configuration production

# Stage 2, use the compiled app, ready for production with Nginx

FROM nginxinc/nginx-unprivileged

USER root

COPY --from=build /app/dist/out/ /usr/share/nginx/html/
RUN chown -R 1001 /usr/share/nginx/html/

COPY application.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/application.sh

EXPOSE 8080
USER 1001

CMD ["bash","/usr/local/bin/application.sh"]