# Schema Changelog

## 2026-07-21
- Widened `locations.side_of_st` from VARCHAR(5) to VARCHAR(20); source data included full values like "West Bound", not just directional abbreviations
- Added PostGIS extension and `geom` geometry column to `locations` for spatial queries

## 2026-07-20
- Initial schema created in PostgreSQL: asset_types, locations, installations, condition_inspections
- Migrated from Access
    - source data required UTF-8 re-export to resolve encoding errors during import
    - exported CSV files required minimal reordering of columns to match PostgreSQL schema

## 2026-07-16
- Relational database for bike parking created in Microsoft Access
- Database relationships created and verified in Access
- Created Report and Form