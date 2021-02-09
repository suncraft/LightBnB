// const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  console.log(`first log: `,email);
  const queryEmail = `
  SELECT *
  FROM users
  WHERE email = $1
  `;
const values = [email];
return pool.query(queryEmail, values)
.then(res => res.rows[0])
  .catch(err => console.error('query error', err.stack))
};

// @Jaime's version: #############
// const getUserWithEmail = function(email) {
//   // const values = [`%${email}%`]
//   return pool.query(`
//   SELECT * FROM users
//   WHERE email = $1
//   `, [email])
//   .then(res => res.rows[0])
//   .catch(err => null);
// }

exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  const queryID = `
  SELECT *
  FROM users
  WHERE ID = $1;
  `
  const values = [id];
  return pool.query(queryID, values)
  .then(res => {
    return res.rows[0];
  });
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  const queryUser = `
  INSERT INTO users (name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *;
  `
  const values = [user.name, user.email, user.password]
  return pool.query(queryUser, values)
  .then(res => { res.rows[0] });
}
exports.addUser = addUser;
// INSERT INTO users (name, birth_year)
// VALUES ('Susan Hudson', 2000); --auto increment IDs
// 1 | Susan Hudson | su@gmail.com | $2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return getAllProperties(null, 2);
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
// #2 correct #########
const getAllProperties = function(options, limit = 10) {
  return pool.query(`
  SELECT * FROM properties
  LIMIT $1
  `, [limit])
  .then(res => res.rows);
}
exports.getAllProperties = getAllProperties;

//#1 correct with console logging
// const getAllProperties = function(options, limit = 10) {
//   pool.query(`
//   SELECT * FROM properties
//   LIMIT $1
//   `, [limit])
//   .then(res => {
//     console.log(res.rows)
//   });
// }
//#0 initial code returing promise: ##############################
// const getAllProperties = function(options, limit = 10) {
//   const limitedProperties = {};
//   for (let i = 1; i <= limit; i++) {
//     limitedProperties[i] = properties[i];
//   }
//   return Promise.resolve(limitedProperties);
// }

// ###########first try ########
// const textQuery = `
// SELECT properties.*
// FROM properties
// LIMIT $1;
// `;
// const limitQuery = param {*} limit || 10;
// const values = [limitQuery];
// pool.query(textQuery, values)
//   .then(res => {
//     console.log(res.rows);
//   })
//   .catch(err => console.error('query error', err.stack));


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
