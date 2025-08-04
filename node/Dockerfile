FROM node:20

WORKDIR /app
COPY src/node-back-trabajo/ /app/
RUN npm install

EXPOSE 3000

CMD ["node", "src/index.js"]
#docker build -f node/Dockerfile -t geoprtal_back .
#docker run -d -p 81:81 geoprtal_back
