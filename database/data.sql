-- =========================
-- SEED: object_types
-- =========================
INSERT INTO object_types (id, name)
VALUES (gen_random_uuid(), 'Étoile'),
       (gen_random_uuid(), 'Planète'),
       (gen_random_uuid(), 'Lune'),
       (gen_random_uuid(), 'Galaxie');

-- =========================
-- SEED: media_types
-- =========================
INSERT INTO media_types (id, name)
VALUES (gen_random_uuid(), 'Image'),
       (gen_random_uuid(), 'Vidéo');

-- =========================
-- SEED: media_role
-- =========================
INSERT INTO media_role (id, name)
VALUES (gen_random_uuid(), 'Photo officielle'),
       (gen_random_uuid(), 'Simulation 3D'),
       (gen_random_uuid(), 'Schéma explicatif');

-- =========================
-- SEED: celestial_objects
-- =========================
-- Soleil
INSERT INTO celestial_objects (id, name, nickname, description, object_type_id)
SELECT gen_random_uuid(), 'Soleil', 'Sol', 'Étoile centrale du système solaire', id
FROM object_types
WHERE name = 'Étoile';

-- Terre
INSERT INTO celestial_objects (id, name, nickname, description, object_type_id, parent_id)
SELECT gen_random_uuid(),
       'Terre',
       'Planète bleue',
       'Troisième planète du système solaire',
       id,
       (SELECT id FROM celestial_objects WHERE name = 'Soleil')
FROM object_types
WHERE name = 'Planète';

-- Lune
INSERT INTO celestial_objects (id, name, nickname, description, object_type_id, parent_id)
SELECT gen_random_uuid(),
       'Lune',
       'Satellite naturel',
       'Satellite naturel de la Terre',
       id,
       (SELECT id FROM celestial_objects WHERE name = 'Terre')
FROM object_types
WHERE name = 'Lune';

-- Galaxie d’Andromède
INSERT INTO celestial_objects (id, name, description, object_type_id)
SELECT gen_random_uuid(), 'Galaxie d’Andromède', 'Grande galaxie spirale voisine de la Voie lactée', id
FROM object_types
WHERE name = 'Galaxie';

-- =========================
-- SEED: celestial_properties
-- =========================
-- Soleil
INSERT INTO celestial_properties (id, celestial_object_id, name, value, unit)
SELECT gen_random_uuid(), id, 'Masse', '1.989 × 10^30', 'kg'
FROM celestial_objects
WHERE name = 'Soleil';
INSERT INTO celestial_properties (id, celestial_object_id, name, value, unit)
SELECT gen_random_uuid(), id, 'Rayon', '696340', 'km'
FROM celestial_objects
WHERE name = 'Soleil';

-- Terre
INSERT INTO celestial_properties (id, celestial_object_id, name, value, unit)
SELECT gen_random_uuid(), id, 'Masse', '5.972 × 10^24', 'kg'
FROM celestial_objects
WHERE name = 'Terre';
INSERT INTO celestial_properties (id, celestial_object_id, name, value, unit)
SELECT gen_random_uuid(), id, 'Rayon', '6371', 'km'
FROM celestial_objects
WHERE name = 'Terre';

-- Lune
INSERT INTO celestial_properties (id, celestial_object_id, name, value, unit)
SELECT gen_random_uuid(), id, 'Masse', '7.342 × 10^22', 'kg'
FROM celestial_objects
WHERE name = 'Lune';
INSERT INTO celestial_properties (id, celestial_object_id, name, value, unit)
SELECT gen_random_uuid(), id, 'Rayon', '1737', 'km'
FROM celestial_objects
WHERE name = 'Lune';

-- Andromède
INSERT INTO celestial_properties (id, celestial_object_id, name, value, unit)
SELECT gen_random_uuid(), id, 'Distance', '2.537', 'millions d’années-lumière'
FROM celestial_objects
WHERE name = 'Galaxie d’Andromède';

-- =========================
-- SEED: media
-- =========================
-- Soleil
INSERT INTO media (id, celestial_object_id, url, type_id, role_id)
SELECT gen_random_uuid(), co.id, 'https://upload.wikimedia.org/wikipedia/commons/c/c3/Solar_sys.jpg', mt.id, mr.id
FROM celestial_objects co,
     media_types mt,
     media_role mr
WHERE co.name = 'Soleil'
  AND mt.name = 'Image'
  AND mr.name = 'Photo officielle';

-- Terre
INSERT INTO media (id, celestial_object_id, url, type_id, role_id)
SELECT gen_random_uuid(),
       co.id,
       'https://upload.wikimedia.org/wikipedia/commons/9/97/The_Earth_seen_from_Apollo_17.jpg',
       mt.id,
       mr.id
FROM celestial_objects co,
     media_types mt,
     media_role mr
WHERE co.name = 'Terre'
  AND mt.name = 'Image'
  AND mr.name = 'Photo officielle';

-- Lune
INSERT INTO media (id, celestial_object_id, url, type_id, role_id)
SELECT gen_random_uuid(),
       co.id,
       'https://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg',
       mt.id,
       mr.id
FROM celestial_objects co,
     media_types mt,
     media_role mr
WHERE co.name = 'Lune'
  AND mt.name = 'Image'
  AND mr.name = 'Photo officielle';

-- Andromède
INSERT INTO media (id, celestial_object_id, url, type_id, role_id)
SELECT gen_random_uuid(),
       co.id,
       'https://upload.wikimedia.org/wikipedia/commons/5/5f/Andromeda_galaxy.jpg',
       mt.id,
       mr.id
FROM celestial_objects co,
     media_types mt,
     media_role mr
WHERE co.name = 'Galaxie d’Andromède'
  AND mt.name = 'Image'
  AND mr.name = 'Photo officielle';
