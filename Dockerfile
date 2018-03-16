FROM nginx:alpine

LABEL maintainer "vaimana.huet@gmail.com"

ADD app /usr/share/nginx/html

EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]
