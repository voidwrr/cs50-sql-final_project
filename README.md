# My RPG World

A relational database built with SQLite to manage complex worldbuilding, historical timelines, characters, items, and spells for fifth-edition Dungeons & Dragons (D&D 5e) campaigns.

---

## 📌 Project Overview

**My RPG World** bridges campaign mechanics and worldbuilding history into a centralized, high-performance database. Designed specifically for Dungeon Masters, it simplifies session preparation and real-time tracking by providing consolidated views for character sheets, magical inventories, and global spellcasting rosters.

- **Author:** João Salvador
- **Location:** Manaus, Brazil
- **Course:** CS50’s Introduction to Databases with SQL (Final Project)
- **GitHub:** [github.com/voidwrr](https://github.com/voidwrr)

---

## 🗂️ Features & Architecture

- **Geographical & Temporal Context:** Tracks continents, regions, cities, and world ages to contextualize historical events and entity origins.
- **Unified Character Roster:** Manages both Player Characters (PCs) and Non-Player Characters (NPCs), including multiclassing progressions and active faction memberships.
- **Optimized DM Views:** Custom analytical views aggregate complex many-to-many relationships (spells, inventory, factions) into single-row lookups.
- **Performance Indexes:** Strategic indexing on entity names, geographic identifiers, and temporal ages speeds up frequent campaign queries.

---

## 📄 Repository Structure

```text
.
├── DESIGN.md       # Detailed technical design, choices, optimizations, and limitations
├── README.md       # Project documentation
├── diagram.jpeg    # Database Schema / Entity-Relationship Diagram (ERD)
├── queries.sql     # Core analytical and operational queries
└── schema.sql      # Database DDL (tables, constraints, indexes, and views)
