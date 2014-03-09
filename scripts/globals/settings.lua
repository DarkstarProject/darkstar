-----------------------------------------------
-------------   GLOBAL SETTINGS   -------------
-----------------------------------------------

--This is to allow server operators to further customize their servers.  As more features are added to pXI, the list will surely expand.
--Anything scripted can be customized with proper script editing.

--PLEASE REQUIRE THIS SCRIPT IN ANY SCRIPTS YOU DO: ADD THIS LINE TO THE TOP!!!!
--    require("scripts/globals/settings");
--With this script added to yours, you can pull variables from it!!

--Common functions
require("scripts/globals/common");

--Always include status.lua, which defines mods
--require("scripts/globals/status");

--See chocoprice.lua to adjust chocobo stables.
--require("scripts/globals/chocoprice");
-- Enable Extension (1= yes 0= no)
ENABLE_COP  = 0;
ENABLE_TOAU = 0;
ENABLE_WOTG = 0;
ENABLE_ACP  = 0;
ENABLE_AMK  = 0;
ENABLE_ASA  = 0;

-- CHARACTER CONFIG
INITIAL_LEVEL_CAP = 50; --The initial level cap for new players.  There seems to be a hardcap of 255.
MAX_LEVEL = 75; -- Level max of the server, works by disabling Maat quests.
START_GIL = 10; --Amount of gil given to newly created characters.
START_INVENTORY = 30; --Starting inventory and satchel size.  Ignores values < 30.  Do not set above 80!
OPENING_CUTSCENE_ENABLE = 0; --Set to 1 to enable opening cutscenes, 0 to disable.
SUBJOB_QUEST_LEVEL = 18; --Minimum level to accept either subjob quest.  Set to 0 to start the game with subjobs unlocked.
ADVANCED_JOB_LEVEL = 30; --Minimum level to accept advanced job quests.  Set to 0 to start the game with advanced jobs.
ALL_MAPS = 0; -- Set to 1 to give starting characters all the maps.
UNLOCK_OUTPOST_WARPS = 0; -- Set to 1 to give starting characters all outpost warps.  2 to add Tu'Lia and Tavnazia.

SHOP_PRICE = 1.000; --Multiplies prices in NPC shops.
GIL_RATE   = 1.000; --Multiplies gil earned from quests.  Won't always display in game.
EXP_RATE   = 1.000; --Multiplies exp earned from fov.
TABS_RATE  = 1.000; --Multiplies tabs earned from fov.
SAN_FAME   = 1.000; --Multiplies fame earned from San d'Oria quests.
BAS_FAME   = 1.000; --Multiplies fame earned from Bastok quests.
WIN_FAME   = 1.000; --Multiplies fame earned from Windurst quests.
NORG_FAME  = 1.000; --Multiplies fame earned from Norg and Tenshodo quests.
JEUNO_FAME = 1.000; --Multiplies fame earned from Jeuno quests.

FISHING_GUILD_POINTS      = 1.000; --Multiplies guild points earned from fishermans' guild trades.
WOODWORKING_GUILD_POINTS  = 1.000; --Multiplies guild points earned from carpenters' guild trades.
SMITHING_GUILD_POINTS     = 1.000; --Multiplies guild points earned from blacksmiths' guild trades.
GOLDSMITHING_GUILD_POINTS = 1.000; --Multiplies guild points earned from goldsmiths' guild trades.
CLOTHCRAFT_GUILD_POINTS   = 1.000; --Multiplies guild points earned from weavers' guild trades.
LEATHERCRAFT_GUILD_POINTS = 1.000; --Multiplies guild points earned from tanners' guild trades.
BONECRAFT_GUILD_POINTS    = 1.000; --Multiplies guild points earned from boneworkers' guild trades.
ALCHEMY_GUILD_POINTS      = 1.000; --Multiplies guild points earned from alchemists' guild trades.
COOKING_GUILD_POINTS      = 1.000; --Multiplies guild points earned from culinarians' guild trades.
DISABLE_GUILD_CONTRACTS   = 0; --Set to 1 to disable guild contracts, allowing players to accumulate guild points from all guilds at once.

CURE_POWER  = 1.000; --Multiplies amount healed from Healing Magic, including the relevant Blue Magic.
SPELL_POWER = 1.000; --Multiplies damage dealt by Elemental and Divine Magic.
BLUE_POWER  = 1.000; --Multiplies damage dealt by most Blue Magic.
DRAIN_POWER = 1.000; --Multiplies amount drained by Drain, Aspir, and relevant Blue Magic spells.
ITEM_POWER  = 1.000; --Multiplies the effect of items such as Potions and Ethers.
WEAPON_SKILL_POWER  = 1.000; -- Multiplies damage dealt by Weapon Skills.
WEAPON_SKILL_POINTS = 1.000; --Multiplies points earned during weapon unlocking.

HARVESTING_BREAK_CHANCE = 0.33; --% chance for the sickle to break during harvesting.  Set between 0 and 1.
EXCAVATION_BREAK_CHANCE = 0.33; --% chance for the pickaxe to break during excavation.  Set between 0 and 1.
LOGGING_BREAK_CHANCE    = 0.33; --% chance for the hatchet to break during logging.  Set between 0 and 1.
MINING_BREAK_CHANCE     = 0.33; --% chance for the pickaxe to break during mining.  Set between 0 and 1.
HARVESTING_RATE         = 0.50; --% chance to recieve an item from haresting.  Set between 0 and 1.
EXCAVATION_RATE         = 0.50; --% chance to recieve an item from excavation.  Set between 0 and 1.
LOGGING_RATE            = 0.50; --% chance to recieve an item from logging.  Set between 0 and 1.
MINING_RATE             = 0.50; --% chance to recieve an item from mining.  Set between 0 and 1.

-- SE implemented coffer/chest illusion time in order to prevent coffer farming. No-one in the same area can open a chest or coffer for loot (gil, gems & items)
-- till a random time between MIN_ILLSION_TIME and MAX_ILLUSION_TIME. During this time players can loot keyitem and item related to quests (AF, maps... etc.)

COFFER_MAX_ILLUSION_TIME = 3600;  -- 1 hour
COFFER_MIN_ILLUSION_TIME = 1800;  -- 30 minutes
CHEST_MAX_ILLUSION_TIME  = 3600;  -- 1 hour
CHEST_MIN_ILLUSION_TIME  = 1800;  -- 30 minutes

-- DYNAMIS SETTINGS
    BETWEEN_2DYNA_WAIT_TIME = 1;        -- wait time between 2 dynamis (in real day) min: 1 day
             DYNA_LEVEL_MIN = 65;       -- level min for entering in dynamis
    TIMELESS_HOURGLASS_COST = 500000;   -- cost of the timeless hourglass for Dynamis.
     CURRENCY_EXCHANGE_RATE = 100;      -- X Tier 1 ancient currency -> 1 Tier 2, and so on.  Certain values may conflict with shop items.  Not designed to exceed 198.
RELIC_2ND_UPGRADE_WAIT_TIME = 604800;      -- wait time for 2nd relic upgrade (stage 2 -> stage 3) in seconds. 604800s = 1 RL week.
RELIC_3RD_UPGRADE_WAIT_TIME = 295200;      -- wait time for 3rd relic upgrade (stage 3 -> stage 4) in seconds. 295200s = 82 hours.
FREE_COP_DYNAMIS = 1 ; -- autorised player to entering inside COP dynamis without completing COP mission ( 1 = enable 0= disable)
-- QUEST/MISSION SPECIFIC SETTINGS
WSNM_LEVEL = 70; -- Min Level to get WSNM Quests
WSNM_SKILL_LEVEL = 240;
AF1_QUEST_LEVEL = 40; -- Minimum level to start AF1 quest
AF2_QUEST_LEVEL = 50; -- Minimum level to start AF2 quest
AF3_QUEST_LEVEL = 50; -- Minimum level to start AF3 quest
AF1_FAME = 20; -- base fame for completing an AF1 quest
AF2_FAME = 40; -- base fame for completing an AF2 quest
AF3_FAME = 60; -- base fame for completing an AF3 quest
DEBUG_MODE = 0; -- Set to 1 to activate auto-warping to the next location (only supported by certain missions / quests).
QM_RESET_TIME = 300; -- Default time (in seconds) you have from killing ???-pop mission NMs to click again and get key item, until ??? resets.

-- FIELDS OF VALOR SETTINGS
REGIME_WAIT = 1; --Make people wait till 00:00 game time as in retail. If it's 0, there is no wait time.
FIELD_MANUALS = 1; -- Enables Fields of Valor manuals
LOW_LEVEL_REGIME = 0; --Allow people to kill regime targets even if they give no exp, allowing people to farm regime targets at 75 in low level areas.

-- JOB ABILITY/TRAIT SPECIFIC SETTINGS
SCAVENGE_RATE = 0.1; --The chance of obtaining an item when you use the Ranger job ability Scavenge.  Do not set above 1!
STATUS_RESIST_MULTIPLIER = 10; -- Sets the strength of status resist traits.
CIRCLE_DURATION = 300; -- Sets the duration of circle effects, in seconds. Retail is 5 minutes.
CIRCLE_KILLER_EFFECT = 20; -- Intimidation percentage granted by circle effects. (made up number)
KILLER_EFFECT = 10; -- Intimidation percentage from killer job traits.

-- SPELL SPECIFIC SETTINGS
MILK_OVERWRITE = 1; --Set to 1 to allow Milk and Regen to overwrite each other.  Default is 1.
JUICE_OVERWRITE = 1; --Set to 1 to allow Juice and Refresh to overwrite each other.  Default is 1.
DIA_OVERWRITE = 1; --Set to 1 to allow Bio to overwrite same tier Dia.  Default is 1.
BIO_OVERWRITE = 0; --Set to 1 to allow Dia to overwrite same tier Bio.  Default is 0.
BARELEMENT_OVERWRITE = 1; --Set to 1 to allow Barelement spells to overwrite each other (prevent stacking).  Default is 1.
BARSTATUS_OVERWRITE = 1; --Set to 1 to allow Barstatus spells to overwrite each other (prevent stacking).  Default is 1.
BARD_SONG_LIMIT = 1; --Maximum amount of songs from a single Bard that can be granted to a single target at once.  Set between 1 and 31.
BARD_INSTRUMENT_LIMIT = 2; --Maximum amount of songs from a single Bard with an instrument that can be granted to a single target at once.  Set between 2 and 32.
ENHANCING_SONG_DURATION = 120; -- duration of enhancing bard songs such as Minuets, Ballads, etc.
STONESKIN_CAP = 350; -- soft cap for hp absorbed by stoneskin
BLINK_SHADOWS = 2;   -- number of shadows supplied by Blink spell
ENSPELL_DURATION = 180; -- duration of RDM en-spells
SPIKE_EFFECT_DURATION = 180; -- the duration of RDM, BLM spikes effects (not Reprisal)
ELEMENTAL_DEBUFF_DURATION = 120; -- base duration of elemental debuffs
STORM_DURATION = 180; -- duration of Scholar storm spells
KLIMAFORM_MACC = 30;  -- magic accuracy added by Klimaform. 30 is just a guess.
AQUAVEIL_INTERR_RATE = 25;  -- percent spell interruption rate reduction from Aquaveil (see http://www.bluegartrls.com/forum/82143-spell-interruption-down-cap-aquaveil-tests.html)
ABSORB_SPELL_AMOUNT = 8; -- how much of a stat gets absorbed by DRK absorb spells - expected to be a multiple of 8.
ABSORB_SPELL_TICK = 9; -- duration of 1 absorb spell tick
SNEAK_INVIS_DURATION_MULTIPLIER = 1; -- multiplies duration of sneak,invis,deodorize to reduce player torture. 1 = retail behavior. MUST BE INTEGER.
USE_OLD_CURE_FORMULA = false; -- true/false. if true, uses older cure formula (3*MND + VIT + 3*(healing skill/5)) // cure 6 will use the newer formula

-- CELEBRATIONS
EXPLORER_MOOGLE = 1; -- Enables Explorer Moogle teleports
EXPLORER_MOOGLE_LEVELCAP = 10;
JINX_MODE_2005 = 0; -- Set to 1 to give starting characters swimsuits from 2005.  Ex: Hume Top
JINX_MODE_2008 = 0; -- Set to 1 to give starting characters swimsuits from 2008.  Ex: Custom Top
JINX_MODE_2012 = 0; -- Set to 1 to give starting characters swimsuits from 2012.  Ex: Marine Top
SUMMERFEST_2004 = 0; -- Set to 1 to give starting characters Far East dress from 2004.  Ex: Onoko Yukata
SUNBREEZE_2009 = 0; -- Set to 1 to give starting characters Far East dress from 2009.  Ex: Otokogusa Yukata
SUNBREEZE_2011 = 0; -- Set to 1 to give starting characters Far East dress from 2011.  Ex: Hikogami Yukata
CHRISTMAS = 0; -- Set to 1 to give starting characters Christmas dress.
HALLOWEEN = 0; -- Set to 1 to give starting characters Halloween items (Does not start event).
HALLOWEEN_2005 = 1; -- Set to 1 to Enable the 2005 version of Harvest Festival, will start on Oct. 20 and end Nov. 1.
HALLOWEEN_YEAR_ROUND = 0; -- Set to 1 to have Harvest Festival initialize outside of normal times.

--MISC
HOMEPOINT_HEAL = 0; --Set to 1 if you want Home Points to heal you like in single-player Final Fantasy games.
RIVERNE_PORTERS = 120; -- Time in seconds that Unstable Displacements in Cape Riverne stay open after trading a scale.
LANTERNS_STAY_LIT = 1200; -- time in seconds that lanterns in the Den of Rancor stay lit.
ENABLE_COP_ZONE_CAP=1; -- enable or disable lvl cap
TIMEZONE_OFFSET = 9.0; -- Offset from UTC used to determine when "JP Midnight" is for the server.  Default is JST (+9.0).
ALLOW_MULTIPLE_EXP_RINGS = 0; -- Set to 1 to remove ownership restrictions on the Chariot/Empress/Emperor Band trio.
BYPASS_EXP_RING_ONE_PER_WEEK = 0; -- -- Set to 1 to bypass the limit of one ring per Conquest Tally Week.
NUMBER_OF_DM_EARRINGS = 1; -- Number of earrings players can simultaneously own from Divine Might before scripts start blocking them (Default: 1)
--LIMBUS
BETWEEN_2COSMOCLEANSE_WAIT_TIME = 3; -- day between 2 limbus keyitem  (default 3 days)