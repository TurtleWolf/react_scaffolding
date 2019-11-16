FROM node:12.2.0-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
# add `/app/node_modules/.bin` to $PATH
# ENV PATH /usr/src/app/node_modules/.bin:$PATH
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production && mv node_modules ../
RUN npm install react-scripts@3.0.1 -g
COPY . .
EXPOSE 3000
CMD npm start