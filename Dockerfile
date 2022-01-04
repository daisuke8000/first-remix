# pull official base image
FROM node:16-alpine

# set working directory
WORKDIR /usr/src/front-remix

# add `/usr/src/remix-app/node_modules/.bin` to $PATH
ENV PATH /usr/src/front-remix/node_modules/.bin:$PATH

# install and cache app dependencies
COPY ./front-remix/package.json .
COPY ./front-remix/package-lock.json .
RUN npm ci
RUN npm install react-scripts@4.0.3 -g --silent

# start app
CMD ["npm", "run", "dev"]