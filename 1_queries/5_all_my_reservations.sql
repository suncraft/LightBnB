
--mine:
-- SELECT reservations.*, properties.*, avg(property_reviews.*) as average_rating
-- FROM properties
-- JOIN reservations ON properties.id = property_id
-- JOIN property_reviews ON properties.id = property_id
-- WHERE reservations.guest_id = 1
-- GROUP BY properties.title
-- ORDER BY reservations.start_date DESC
-- LIMIT 10;

--answer:
SELECT properties.*, reservations.*, avg(rating) as average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id 
WHERE reservations.guest_id = 1
AND reservations.end_date < now()::date
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;

-- SELECT properties.*, avg(property_reviews.rating) as average_rating
-- FROM properties
-- JOIN property_reviews ON properties.id = property_id
-- WHERE city LIKE '%ancouv%'
-- GROUP BY properties.id
-- HAVING avg(property_reviews.rating) >= 4
-- ORDER BY cost_per_night
-- LIMIT 10;

-- INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
-- VALUES 
-- (3, 'Vagrant house', 'description', 'someThumbURL.com', 'someCoverPhotoURL.com', 400, 4, 2, 3, 'Canada', '001 University Drive', 'Vancouver', 'British Columbia', '123456', true),
-- (2, 'VSCode Hill', 'description', 'someThumbURL2.com', 'someCoverPhotoURL2.com', 700, 10, 4, 6, 'Canada', '001 Any Street', 'Burnaby', 'British Columbia', '654321', true),
-- (1, 'EssQueEll Corner', 'description', 'someThumbURL3.com', 'someCoverPhotoURL3.com', 250, 3, 2, 4, 'Canada', '001 Across Road', 'Montreal', 'Quebec', '555555', true);


-- --used example for reservations
-- INSERT INTO reservations (guest_id, property_id, start_date, end_date) 
-- VALUES 
-- (1, 1, '2018-09-11', '2018-09-26'),
-- (2, 2, '2019-01-04', '2019-02-01'),
-- (3, 3, '2021-10-01', '2021-10-14');