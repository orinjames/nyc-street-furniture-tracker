CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS asset_types (
	asset_type_id SERIAL PRIMARY KEY,
	rack_type VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS locations (
    site_id VARCHAR(20) PRIMARY KEY,
    group_id VARCHAR(20),
    borough VARCHAR(30),
    ifo_address VARCHAR(100),
    on_street VARCHAR(100),
    from_street VARCHAR(100),
    to_street VARCHAR(100),
    side_of_st VARCHAR(20),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    nta_name VARCHAR(100),
    fema_fldz VARCHAR(20),
    hrc_evac VARCHAR(20),
    the_geom TEXT,
	geom geometry(Point, )
);

CREATE TABLE IF NOT EXISTS installations (
	installation_id SERIAL PRIMARY KEY,
	site_id VARCHAR(20) REFERENCES locations(site_id),
	asset_type_id INTEGER REFERENCES asset_types(asset_type_id),
	date_installed DATE,
	program VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS condition_inspections (
	inspection_id SERIAL PRIMARY KEY,
	installation_id INTEGER REFERENCES installations(installation_id),
	inspection_date DATE,
	condition_rating INTEGER CHECK (condition_rating BETWEEN 1 and 5),
	notes TEXT
);


