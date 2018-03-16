FROM nginx:alpine

LABEL maintainer "vaimana.huet@gmail.com"

ADD app /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
