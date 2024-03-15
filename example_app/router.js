import { accountsRoute, homepageRoute, productsRoute, cartRoute, checkoutRoute, ordersRoute, loginRoute } from './routes.js'

export function logger(request) {
  console.log(`${new Date().toLocaleString()} ${request.method} ${request.url}`)
}

export async function payloadParser(request) {
  return new Promise((resolve, reject) => {
    let chunk = ''
    request.on('data', data => chunk += data)
    request.on('end', () => {
      try {
        resolve(JSON.parse(chunk))
      } catch {
        resolve({})
      }
    })
  })
}

export default async function router(request, response) {
  logger(request)

  const requestUrl = new URL(`http://${request.headers.host}${request.url}`)
  response.setHeader('Access-Control-Allow-Origin', 'http://127.0.0.1:5500')

  const formData = await payloadParser(request)
  request.data = formData
  request.requestUrl = requestUrl

  if (requestUrl.pathname === '/') {
    // Home Page
    return homepageRoute(request, response)
  }

  if (requestUrl.pathname === '/api/v1/accounts') {
    return accountsRoute(request, response)
  }

  if (requestUrl.pathname === '/api/v1/products') {
    return productsRoute(request, response)
  }

  if (requestUrl.pathname === '/api/v1/cart_item') {
    return cartRoute(request, response)
  }

  if (requestUrl.pathname === '/api/v1/cart') {
    return checkoutRoute(request, response)
  }

  if (requestUrl.pathname === '/api/v1/orders') {
    return ordersRoute(request, response)
  }

  if (requestUrl.pathname === '/api/v1/auth') {
    return loginRoute(request, response)
  }

  response.statusCode = 404
  response.setHeader('Content-Type', 'application/json')
  response.write(JSON.stringify({
    'status': 404,
    'message': 'Endpoint not found'
  }))
  return response.end()
}