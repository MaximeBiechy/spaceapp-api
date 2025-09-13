-- =========================
-- TABLE: object_types
-- =========================
CREATE TABLE object_types
(
    id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- TABLE: media_types
-- =========================
CREATE TABLE media_types
(
    id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- TABLE: media_role
-- =========================
CREATE TABLE media_role
(
    id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- TABLE: celestial_objects
-- =========================
CREATE TABLE celestial_objects
(
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name           VARCHAR(255) NOT NULL,
    nickname       VARCHAR(255),
    description    TEXT,
    object_type_id UUID         NOT NULL REFERENCES object_types (id) ON DELETE RESTRICT,
    parent_id      UUID         REFERENCES celestial_objects (id) ON DELETE SET NULL,
    created_at     TIMESTAMP        DEFAULT NOW(),
    updated_at     TIMESTAMP        DEFAULT NOW()
);

-- =========================
-- TABLE: media
-- =========================
CREATE TABLE media
(
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    celestial_object_id UUID NOT NULL REFERENCES celestial_objects (id) ON DELETE CASCADE,
    url                 TEXT NOT NULL,
    type_id             UUID NOT NULL REFERENCES media_types (id) ON DELETE RESTRICT,
    role_id             UUID REFERENCES media_role (id) ON DELETE SET NULL,
    created_at          TIMESTAMP        DEFAULT NOW()
);

-- =========================
-- TABLE: celestial_properties
-- =========================
CREATE TABLE celestial_properties
(
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    celestial_object_id UUID         NOT NULL REFERENCES celestial_objects (id) ON DELETE CASCADE,
    name                VARCHAR(100) NOT NULL,
    value               VARCHAR(255) NOT NULL,
    unit                VARCHAR(50),
    created_at          TIMESTAMP        DEFAULT NOW()
);