# Design Document

MY RPG WORLD

By João Victor da Cunha Salvador

Video overview: <URL HERE>

## Scope

My RPG World is a database designed to store and manage data related to tabletop RPG campaigns set within a custom-built Dungeons and Dragons universe. The primary goal of this database is to track players and the characters they played across different campaigns, as well as the specific era of the universe in which each campaign takes place and each character exists.

The database records full profile tracking for both player characters and non-playable characters, including full name breakdowns, multiclassing support for up to three classes, race associations, home or current city locations, and their active timeline defined by start and end ages. It also tracks factions within the universe, their historical lifespans, and many-to-many relationships that link characters and NPCs to these organizations along with their specific rank.

Magical capabilities and equipment are managed through cataloged spells with attributes like level, school, casting time, range, and concentration, as well as magic items detailing rarity, type, and attunement status. These are connected to both characters and NPCs through dedicated junction tables. The world design follows a hierarchical location model connecting cities to regions and regions to continents. Chronology and campaigns are maintained through a structured timeline of historical eras linked to cities, factions, NPCs, characters, and campaigns, which also track campaign titles, descriptions, timelines, and the Dungeon Master running them.

To keep the database focused and efficient, general mechanics and mundane inventory such as non-magical equipment, ropes, torches, basic rations, and monetary transactions are explicitly excluded. Combat tracking such as real-time initiative, turn-by-turn battle logs, hit point changes, and spell slot consumption per encounter are also outside the scope. Rulebook data beyond core elements, including detailed subclass feature trees and full monster stat blocks, are excluded in favor of basic NPC profiles.

The main objective is to enable comprehensive analytical queries and views that allow a Dungeon Master to retrieve all relevant summary information for any given character, city, NPC, faction, or era within the universe in a single call.

## Functional Requirements

A user of the My RPG World database should be able to query complete profiles for player characters and non-playable characters, including their full names, race, primary and subsequent classes for multiclassed characters, and historical era timeline. The database allows users to retrieve character and NPC inventories, tracking all magic items owned and spells known by each individual. Users can track players across multiple campaigns by linking players to the specific characters they have played in various games, as well as view faction memberships detailing which characters or NPCs belong to specific organizations and their given rank within those factions. Furthermore, users can explore geographic and temporal hierarchies by querying which cities belong to specific regions, which regions belong to continents, and which eras define the lifespan of cities, factions, campaigns, and characters. The system enables executing analytical views and complex joins to summarize world lore and campaign states for a Dungeon Master in a single query.
Beyond the scope of what a user should be able to do with the database includes managing real-time combat mechanics, such as tracking hit points, initiative order, round-by-round action logs, or temporary status conditions during encounters. Cataloging non-magical inventory and mundane gear, including basic supplies, torches, ropes, arrows, or currency and wallet balances, is explicitly excluded. The database is not intended to track active spell slot consumption, daily resource usage, or temporary buff and debuff durations per session. Finally, storing full Dungeons and Dragons rulebook material, including comprehensive subclass feature progression trees, full spell descriptions, or complete monster stat blocks beyond core character attributes, remains outside the scope of user capabilities.

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?
* What attributes will those entities have?
* Why did you choose the types you did?
* Why did you choose the constraints you did?

### Relationships

![diagram](diagram.jpeg)

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?
* What might your database not be able to represent very well?
