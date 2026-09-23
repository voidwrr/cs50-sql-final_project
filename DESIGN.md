# Design Document

By João Victor da Cunha Salvador

Video overview: <URL HERE>

## Scope

Void's World is a database designed to store and manage data related to tabletop RPG campaigns set within a custom-built Dungeons and Dragons universe. The primary goal of this database is to track players and the characters they played across different campaigns, as well as the specific era of the universe in which each campaign takes place and each character exists. Additionally, it records the magic items and spells possessed by each character, along with non-playable characters (NPCs), key locations, and historical eras.

To keep the database focused and efficient, general mechanics, non-magical inventory, and standard equipment are excluded. The scope is strictly limited to core character details like classes, levels, races, and status, magical capabilities and equipment such as spells and magic items, and world lore including historical eras, locations, campaigns, and NPCs.

The main objective is to enable comprehensive queries and views that allow a Dungeon Master to retrieve all relevant summary information for any given character, city, NPC, or era within the universe in a single call.

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
* What's beyond the scope of what a user should be able to do with your database?

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
