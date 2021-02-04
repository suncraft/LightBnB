INSERT INTO users (name, email, password)
VALUES 
('Susan Hudson', 'su@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Malloy Jenkins', 'malloyj@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Mr Rogers', 'rogers@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES 
(3, 'Vagrant house', 'description', 'someThumbURL.com', 'someCoverPhotoURL.com', 400, 4, 2, 3, 'Canada', '001 University Drive', 'Vancouver', 'British Columbia', '123456', true),
(2, 'VSCode Hill', 'description', 'someThumbURL2.com', 'someCoverPhotoURL2.com', 700, 10, 4, 6, 'Canada', '001 Any Street', 'Burnaby', 'British Columbia', '654321', true),
(1, 'EssQueEll Corner', 'description', 'someThumbURL3.com', 'someCoverPhotoURL3.com', 250, 3, 2, 4, 'Canada', '001 Across Road', 'Montreal', 'Quebec', '555555', true);


--used example:
INSERT INTO reservations (guest_id, property_id, start_date, end_date) 
VALUES 
(1, 1, '2018-09-11', '2018-09-26'),
(2, 2, '2019-01-04', '2019-02-01'),
(3, 3, '2021-10-01', '2021-10-14');


INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES 
(3, 2, 1, 5, 'the servants say it was good'),
(1, 1, 2, 3, 'something about smells'),
(2, 3, 3, 4, 'good view');