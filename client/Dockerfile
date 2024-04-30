FROM node:20
WORKDIR /workspace
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build
EXPOSE 80
ENV CERN_RESTAURANT_CLIENT_PORT 80
ENV CERN_RESTAURANT_CLIENT_PREFIX /client
ENV VITE_BACKEND_URL https://localhost/api/
CMD ["npm", "run", "dev"]
