# API
### TO DO
- [ ] UPLOAD TO API FUNCTIONS
- [ ] DOWNLOAD & UPDATE SQL FUNCTIONS

# GUI
### TO DO
- [ ] Formulary
    - [ ] Formulary create/mod character
        - [ ] character static details
        - [ ] character race, job, especiality
        - [ ] character characteristics, skills, talents
        - [ ] inventory 
    - [ ] Formulary create item/mod
- [ ]controls
    - [ ] select images
    - [ ] combo box
    - [ ] number
    - [x] TEXT
- [ ]GRAPHICS
    - [ ] HP BAR
    - [ ] SKILL BAR
    - [ ] SHOW ITEMS

# SQL LITE
### TO DO
- [ ] character tables
    - [ ] cahracters
    - [ ] inventory
    - [ ] effects(wounds/conditions)[auto_modify]
- [ ] data tables
    - [ ] generic obj
    - [ ] weapons
    - [ ] armor
    - [ ] characterisitcs
    - [ ] skills
    - [ ] special weapon [auto_modify]
    - [ ] special armor [auto_modify]
    - [ ] atatchments [auto_modify]
    - [ ] wounds [auto_modify]
##  TABLES

### SPECIES

### NPC GENERIC DATA TAB
||VALUE||
### INVENTORY TAB

### WOUNDS TAB

### GENERIC OBJ TAB
| ID          | NOMBRE      | DESCRIPCION   | IMPEDIMENTO | ENS CAP     | PRECIO      | RAREZA      | RESTRINGIDO | CONSUMABLE |
|         ---:|:---         |          ---: |         ---:|         ---:|         ---:|         ---:|         :---|:---        |
| INT | STRING 30   | STRING 300    | INT         | INT         | INT         | INT         | BOOL        | BOOL       |
| ITEM ID | ITEM NAME   | ITEM DESCRIPTION    |ITEM WEIGHT  | MOD CAPACITY|AVG PRICE| RARITY VALUE| IS RESTRICTED?|IS 1 USE ITEM|

### WEAPON TAB(OBJ)
|ID    |DAMAGE|CRIT|+ SKILL| SKILL| REACH|SPECIAL|
|  :---|  ---:|---:|  :---:| ---: |  ---:|:---:|
|INT   | INT  |INT |BOOLEAN| TAB  |   TAB |[TAB]|
|GENERIC OBJ ID|DAMAGE VALUE|CRIT VALUE| DAMAGE+ SKILL?| ID OF SKILL|  ID REACH VALUES|WEAPONS 1 OR MORE SPECIAL ATR ID| 

### ARMOR TAB (OBJ)
|ID| SOAK|DEFENSE|
|:---|---:|---:|
|INT| INT|INT|
|GENERIC OBJ ID| SOAK VALUE| DEFENSE VALUE|

### CHARACTERISTIC TABLE
|ID|NAME|SHORT NAME|DESC*|
|:---|:---:|:---:|:---:|
|INT|STRING 20|STRING 10| STRING 200|
|ID|CHARACT NAME|SHORT CHAR NAME|CHAR DESC *OPTIONAL*|

### LIST OF CHARACTERISITCS:
|CHARACTERISTICS|
|:---:|
|FORTITUDE|
|AGILITY|
|INTELECT|
|SKULLDUGERY|
|WILL|
|PRESENCE|

### HABILITY TABLE
|ID|CHARACTERISTIC|NAME|DESC*|
|:---|:---|:---:|---:|
|INT|TABLE|STRING 20|STRING 200|
|SKILL ID|CAHARACTERRISTIC ID| SKILL NAME | SKILL DESCRIPTION *OPTIONAL*|

#### LIST OF HABILITYES BY CHARACTERISTIC:
 |SKILLS| CHARACTERISTICS|
 |:---:|:---:|
 |ACTIVIDAD CRIMINAL|AST|

