FROM node:7.10.1 as source
WORKDIR /src/build-your-own-radar
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM centos/nginx-18-centos7
COPY --from=source /src/build-your-own-radar/dist .
CMD $STI_SCRIPTS_PATH/run
