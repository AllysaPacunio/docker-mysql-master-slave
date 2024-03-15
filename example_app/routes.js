import { addUser, getUsers, updateUser, deleteUser } from './controllers/user.controller.js'
// import { addAction, getAction, updateAction, deleteAction } from './controllers/products.controller.js'
// import { getCartItem, addCartItem, updateCartItem, deleteCartItem } from './controllers/cart_item.controller.js'
// import { addCheckout } from './controllers/cart.controller.js'
// import { getHistory } from './controllers/orders.controller.js'
// import { authenticate } from './controllers/login.controller.js'

export function homepageRoute(request, response) {
  response.setHeader('Content-Type', 'application/json')
  response.write(JSON.stringify({
    'message': 'Simple CRUD API Example'
  }))
  return response.end()
}

export function accountsRoute(request, response) {
  if (request.method === 'GET') {
    return getUsers(request, response)
  } else if (request.method === 'POST') {
    return addUser(request, response)
  } else if (request.method === 'PUT') {
    return updateUser(request, response)
  } else if (request.method === 'DELETE') {
    return deleteUser(request, response)
  }

  return response.end()
}

export function productsRoute(request, response) {
  if (request.method === 'GET') {
    return getAction(request, response)
  } else if (request.method === 'POST') {
    return addAction(request, response)
  } else if (request.method === 'PUT') {
    return updateAction(request, response)
  } else if (request.method === 'DELETE') {
    return deleteAction(request, response)
  }

  return response.end()
}

export function cartRoute(request, response) {
  if (request.method === 'GET') {
    return getCartItem(request, response)
  } else if (request.method === 'POST') {
    return addCartItem(request, response)
  } else if (request.method === 'PUT') {
    return updateCartItem(request, response)
  } else if (request.method === 'DELETE') {
    return deleteCartItem(request, response)
  }

  return response.end()
}

export function checkoutRoute(request, response) {
  if (request.method === 'POST') {
    return addCheckout(request, response)
  }

  return response.end()
}

export function ordersRoute(request, response) {
  if (request.method === 'GET') {
    return getHistory(request, response)
  }

  return response.end()
}

export function loginRoute(request, response) {
  if (request.method === 'POST') {
    return authenticate(request, response)
  }

  return response.end()
}
