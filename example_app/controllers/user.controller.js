import students from '../models/user.model.js';

export async function getUsers(request, response) {
  response.setHeader('Content-Type', 'application/json')

  try {
    const { id } = request?.data || {}

    const data = await students.get(id)

    response.write(JSON.stringify({
      'success': true,
      'data': data
    }, undefined, 4))
    
  } catch (err) {
    response.write(JSON.stringify({
      'success': false,
      'message': err.message,
    }))
  }

  return response.end()
}

export async function addUser(request, response) {
  response.setHeader('Content-Type', 'application/json')

  try {
    const {
      full_name,
      email,
      username,
      phone,
      password,
      shipping_add,
      billing_add
    } = request?.data || {}

    if (!full_name || !email || !username || !phone || !password || !shipping_add || !billing_add) {
      response.write(JSON.stringify({
        'success': false,
        'message': 'Invalid data. Expecting `full_name`, `email`, `username`, `phone`, `password`, `shipping_add` and `billing_add`.',
      }))
      return response.end()
    }

    const res = await students.add_account(full_name, email, username, phone, password, shipping_add, billing_add)

    response.write(JSON.stringify({
      'success': true,
      'data': res
    }))
  } catch (err) {
    response.write(JSON.stringify({
      'success': false,
      'message': err.message,
    }))
  }

  return response.end()
}

export async function updateUser(request, response) {
  response.setHeader('Content-Type', 'application/json')

  try {
    const {
      id,
      full_name,
      email,
      username,
      phone,
      password,
      shipping_add,
      billing_add
    } = request?.data || {}

    if (!id || !full_name || !email || !username || !phone || !password || !shipping_add || !billing_add) {
      response.write(JSON.stringify({
        'success': false,
        'message': 'Invalid data. Expecting `id`, `full_name`, `email`, `username`, `phone`, `password`, `shipping_add` and `billing_add`.',
      }))
      return response.end()
    }

    const res = await students.update_account(id, full_name, email, username, phone, password, shipping_add, billing_add)

    response.write(JSON.stringify({
      'success': true,
      'data': res
    }))
  } catch (err) {
    response.write(JSON.stringify({
      'success': false,
      'message': err.message,
    }))
  }

  return response.end()
}

export async function deleteUser(request, response) {
  response.setHeader('Content-Type', 'application/json')

  try {
    const {
      id,
    } = request?.data || {}

    const res = await students.delete_account(id)

    response.write(JSON.stringify({
      'success': true,
      'data': res
    }))
  } catch (err) {
    response.write(JSON.stringify({
      'success': false,
      'message': err.message,
    }))
  }

  return response.end()
}