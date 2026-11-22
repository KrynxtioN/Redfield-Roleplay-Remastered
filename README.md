# Redfield Roleplay Remastered

**A feature-rich roleplay gamemode for Multi Theft Auto: San Andreas (MTA:SA).**

Redfield Roleplay Remastered is a comprehensive multiplayer roleplay gamemode developed for **Multi Theft Auto: San Andreas**. It provides an extensive collection of interconnected gameplay systems designed to create a dynamic and engaging roleplay environment.

From character progression, faction management and economic activities to vehicle customization, property ownership, criminal operations and recreational activities, the gamemode offers a wide range of features and gameplay opportunities.

The project includes **293 Lua files, over 1,700 functions and approximately 29,000 lines of code**, covering both core gameplay mechanics and supporting systems.

---

## ✨ Features Overview

| Category | Description |
|---|---|
| 👤 Player Progression | Accounts, levels, prestige, achievements and quests |
| 👮 Factions & Organizations | Faction management, gangwars, police systems and faction activities |
| 💼 Jobs & Careers | 12 different jobs with individual gameplay mechanics |
| 💰 Economy & Banking | Banking, businesses, marketplaces, shops and financial systems |
| 🚗 Vehicles & Transportation | Dealerships, tuning, garages, licenses and vehicle management |
| 🏠 Housing & Properties | Property ownership, furniture, hotels and garages |
| 🔫 Criminal Activities | Robberies, illegal transports, wanted systems and gang conflicts |
| 🎮 Activities & Minigames | Fishing, diving, arenas, collectibles and recreational activities |
| 🎒 Inventory & Crafting | Item management, crafting, planting and weapon boxes |
| 🐾 Pets & Companions | Pet ownership and management |
| 🛡️ Administration | Administrative tools, player management and server moderation |
| 🖥️ User Interface | Custom HUD, interactive panels, notifications and menus |

---

## 👤 Player Accounts & Progression

A collection of systems for managing player accounts, character progression and long-term gameplay.

- Account registration and authentication
- Persistent player data management
- Level and experience progression
- Prestige system
- Quest and achievement systems
- Collectible cards and hidden objects
- Player statistics and leaderboards
- Inventory and crafting functionality

## 👮 Factions & Organizations

Extensive faction systems supporting organizational management, law enforcement and competitive gameplay.

**Faction Management**
- Member and organization management
- Faction vehicle purchasing and management
- Shared faction storage and materials
- Gang tags and territory-related activities
- Gangwars and factory wars

**Law Enforcement**
- Police duty system
- Police computer and related tools
- Wanted and blacklist management
- Police-specific interactions
- Evidence storage and wanted cards

## 💣 Robberies & Criminal Activities

Various criminal operations and faction-based activities introduce additional challenges and competitive gameplay.

- Bank robberies
- Warehouse robberies
- Vehicle robberies
- Money transporter operations
- Drug transporter missions
- Drug ship activities
- Materials robberies
- Black powder transports
- Government weapon transports
- Flag hunting
- Wanted and evidence-related systems

## 💼 Jobs & Employment

The gamemode includes **12 different jobs**, providing players with alternative ways to earn money and participate in the server economy.

| Job | Job |
|---|---|
| 🚌 Bus Driver | 🚕 Taxi Driver |
| 🍕 Pizza Delivery | 📮 Postman |
| 🗑️ Garbage Collector | 🌊 Ocean Cleaner |
| 🌾 Farmer | 🪓 Lumberjack |
| ⛏️ Cave Explorer | ✈️ Pilot |
| 🔧 Scrapyard Worker | 🥊 Boxer |

## 🎮 Activities & Minigames

Beyond traditional roleplay, players can participate in numerous optional activities.

- Fishing and diving
- Moon flight activity
- Gym and fighting styles
- Shooting range
- Desert Eagle Arena
- Shooter Arena
- Collectible hunting
- Additional recreational activities

## 🚗 Vehicles & Transportation

A comprehensive set of systems for vehicle ownership, customization and transportation.

**Vehicle Management**
- Vehicle dealerships
- Vehicle management interface
- Vehicle key sharing
- Vehicle collection point
- Vehicle licenses
- Garages and vehicle storage

**Customization & Features**
- Vehicle tuning
- Color selection
- Speedometer
- Vehicle radio
- Fuel stations and refueling

**Additional Transportation**
- Airport-related functionality
- Caravan system
- Transportation-related gameplay systems

## 🏠 Housing & Properties

Property systems allow players to own, customize and interact with residential locations.

- House ownership and management
- Furniture placement and customization
- Hotel functionality
- Garage-related systems

## 💰 Economy & Banking

Various financial systems support player progression, employment and economic interaction.

- Player money management
- ATMs and banking functionality
- Payday interface
- Lottery system
- Player marketplace
- Shops and commercial businesses

## 🏢 Businesses & Public Services

A variety of businesses, organizations and public services contribute to the roleplay environment.

**Public Services & Organizations**
- Driving school
- Mechanics
- Fire department
- Rescue team
- Reporters
- Trucking services
- Company management

**Commercial & Social Activities**
- Restaurants and supermarkets
- Ammu-Nation
- Bars and library
- Garden club
- Gas stations
- Pet shops
- Adult shops and strip clubs
- Sprunk vending machines
- Wedding system

## 🎒 Inventory, Items & Pets

Item-related and companion systems provide additional gameplay possibilities.

- Inventory management
- Item crafting
- Weapon boxes
- Pet system
- Planting and cultivation

## 🔫 Weapons & Combat

Combat-related systems support PvP activities, faction conflicts and weapon management.

- Custom hitbox implementation
- Weapon licensing
- Shooting range
- Fighting styles
- PvP arenas
- Gangwars
- Factory wars

## 🌍 Additional Gameplay Systems

The gamemode also contains numerous supporting features that expand player interaction and world functionality.

- Mobile phone system
- Player identification and interactions
- Character animations
- Mailbox system
- Ghettoblaster
- Parachute functionality
- Construction sites
- Toll systems
- Safe zones
- Teleporters
- Weather functionality
- Hospital and death system
- AFK detection and management
- Easter eggs, including Alligator and Bigfoot

## 🛡️ Administration & Server Management

Administrative tools provide functionality for managing players, server activities and moderation.

- Administrative interface
- Admin commands
- Player management
- Event management
- News management
- Prison system
- Superman functionality

## 🖥️ User Interface

Custom interface components provide access to gameplay features and important information.

- Custom player HUD
- Vehicle speedometer
- Scoreboard and nametags
- Infobox notifications
- Breaking news interface
- Help menu
- Inventory interface
- Mobile phone interface
- Vehicle management panels
- Housing interfaces
- Map blip legend
- Introduction and tutorial interfaces
- Language interface

---

## ⚙️ Installation & Setup

### Requirements

Before installing the gamemode, ensure that you have:

- A working **Multi Theft Auto: San Andreas server**
- A **MySQL database**
- The required MTA resources:
  - `bone_attach`
  - `customblips`

### Installation Steps

**1. Download the project**

Clone the repository or download its contents.

```bash
git clone <repository-url>
```

**2. Install the resources**

Copy the following folders into your MTA server's `resources` directory:

```text
resources/
├── RedfieldRoleplayRemastered/
├── bone_attach/
└── customblips/
```

**3. Configure the database**

Create a new MySQL database and import the included SQL file:

```text
redfieldroleplay.sql
```

**4. Configure the database connection**

Open the following file:

```text
sMain.lua
```

Update the MySQL connection settings according to your server environment.

**5. Start the resources**

Start the required dependencies before launching the main gamemode.

```text
start bone_attach
start customblips
start RedfieldRoleplayRemastered
```

**6. Verify the installation**

Check the MTA server console for errors and verify that the database connection and required resources are working correctly.

---

## 🎬 Gameplay Preview

Explore Redfield Roleplay Remastered in action through the following gameplay video.

**[▶ Watch Gameplay on YouTube](https://youtu.be/PZLQRtp3rf8)**

## 📸 Screenshots

The screenshots below showcase various gameplay features, interfaces and environments included in Redfield Roleplay Remastered.

<details>
<summary><b>View Screenshot Gallery (60 Images)</b></summary>

<p align="center">
  <img src="Screenshots/Screenshot_%201.png" width="350">
  <img src="Screenshots/Screenshot_%202.png" width="350">
  <img src="Screenshots/Screenshot_%203.png" width="350">
  <img src="Screenshots/Screenshot_%204.png" width="350">
  <img src="Screenshots/Screenshot_%205.png" width="350">
  <img src="Screenshots/Screenshot_%206.png" width="350">
  <img src="Screenshots/Screenshot_%207.png" width="350">
  <img src="Screenshots/Screenshot_%208.png" width="350">
  <img src="Screenshots/Screenshot_%209.png" width="350">
  <img src="Screenshots/Screenshot_%2010.png" width="350">
  <img src="Screenshots/Screenshot_%2011.png" width="350">
  <img src="Screenshots/Screenshot_%2012.png" width="350">
  <img src="Screenshots/Screenshot_%2013.png" width="350">
  <img src="Screenshots/Screenshot_%2014.png" width="350">
  <img src="Screenshots/Screenshot_%2015.png" width="350">
  <img src="Screenshots/Screenshot_%2016.png" width="350">
  <img src="Screenshots/Screenshot_%2017.png" width="350">
  <img src="Screenshots/Screenshot_%2018.png" width="350">
  <img src="Screenshots/Screenshot_%2019.png" width="350">
  <img src="Screenshots/Screenshot_%2020.png" width="350">
  <img src="Screenshots/Screenshot_%2021.png" width="350">
  <img src="Screenshots/Screenshot_%2022.png" width="350">
  <img src="Screenshots/Screenshot_%2023.png" width="350">
  <img src="Screenshots/Screenshot_%2024.png" width="350">
  <img src="Screenshots/Screenshot_%2025.png" width="350">
  <img src="Screenshots/Screenshot_%2026.png" width="350">
  <img src="Screenshots/Screenshot_%2027.png" width="350">
  <img src="Screenshots/Screenshot_%2028.png" width="350">
  <img src="Screenshots/Screenshot_%2029.png" width="350">
  <img src="Screenshots/Screenshot_%2030.png" width="350">
  <img src="Screenshots/Screenshot_%2031.png" width="350">
  <img src="Screenshots/Screenshot_%2032.png" width="350">
  <img src="Screenshots/Screenshot_%2033.png" width="350">
  <img src="Screenshots/Screenshot_%2034.png" width="350">
  <img src="Screenshots/Screenshot_%2035.png" width="350">
  <img src="Screenshots/Screenshot_%2036.png" width="350">
  <img src="Screenshots/Screenshot_%2037.png" width="350">
  <img src="Screenshots/Screenshot_%2038.png" width="350">
  <img src="Screenshots/Screenshot_%2039.png" width="350">
  <img src="Screenshots/Screenshot_%2040.png" width="350">
  <img src="Screenshots/Screenshot_%2041.png" width="350">
  <img src="Screenshots/Screenshot_%2042.png" width="350">
  <img src="Screenshots/Screenshot_%2043.png" width="350">
  <img src="Screenshots/Screenshot_%2044.png" width="350">
  <img src="Screenshots/Screenshot_%2045.png" width="350">
  <img src="Screenshots/Screenshot_%2046.png" width="350">
  <img src="Screenshots/Screenshot_%2047.png" width="350">
  <img src="Screenshots/Screenshot_%2048.png" width="350">
  <img src="Screenshots/Screenshot_%2049.png" width="350">
  <img src="Screenshots/Screenshot_%2050.png" width="350">
  <img src="Screenshots/Screenshot_%2051.png" width="350">
  <img src="Screenshots/Screenshot_%2052.png" width="350">
  <img src="Screenshots/Screenshot_%2053.png" width="350">
  <img src="Screenshots/Screenshot_%2054.png" width="350">
  <img src="Screenshots/Screenshot_%2055.png" width="350">
  <img src="Screenshots/Screenshot_%2056.png" width="350">
  <img src="Screenshots/Screenshot_%2057.png" width="350">
  <img src="Screenshots/Screenshot_%2058.png" width="350">
  <img src="Screenshots/Screenshot_%2059.png" width="350">
  <img src="Screenshots/Screenshot_%2060.png" width="350">
</p>

</details>

---

## 📊 Project Statistics

An overview of the project's codebase and included files.

| Metric | Count |
|:---|---:|
| Lua Files | 293 |
| Additional Files | 325 |
| Functions | 1,734 |
| Lines of Code | 29,357 |
| Characters | 1,250,938 |
| Comment Lines | 1,548 |
| Comment Characters | 38,228 |

*Statistics reflect the provided project analysis and may change as development continues.*

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Lua | Gameplay scripting and server logic |
| Multi Theft Auto: San Andreas | Multiplayer game platform |
| MySQL | Persistent data storage |
| MTA Resource System | Resource loading and dependency management |

---

## 📌 About the Project

Redfield Roleplay Remastered brings together a large collection of gameplay mechanics, roleplay features and custom systems within a single MTA:SA gamemode.

The project serves as a comprehensive foundation for a roleplay server, combining player progression, faction gameplay, economic systems, property management, vehicle functionality and numerous additional activities.

**Built for Multi Theft Auto: San Andreas.**
