import http from 'http'
import './database.js'
import router from './router.js'

const server = http.createServer(router)

server.listen(3000, () => console.log('Application is running...'))