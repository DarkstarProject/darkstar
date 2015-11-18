-----------------------------------
--  Area: Windurst Waters
--  NPC: Qhum_Knaidjn
--  Type: Guildworker's Union Representative
--  @zone: 238
--  @pos -112.561 -2 55.205
-----------------------------------

package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Windurst_Waters/TextIDs");

local keyitems = {
    [0] = {
        id = RAW_FISH_HANDLING,
        rank = 3,
        cost = 30000 
    },
    [1] = {
        id = NOODLE_KNEADING,
        rank = 3,
        cost = 30000 
    },
    [2] = {
        id = PATISSIER,
        rank = 3,
        cost = 8000 
    },
	[3] = {
        id = STEWPOT_MASTERY,
        rank = 3,
        cost = 30000 
    },
	[4] = {
        id = WAY_OF_THE_CULINARIAN,
        rank = 9,
        cost = 20000 
    }
};

local items = {
	[2] = {
        id = 15451, -- Culinarian's Belt
        rank = 4,
        cost = 10000 
    },
    [3] = {
        id = 13948, -- Chef's Hat
        rank = 5,
        cost = 70000 
    },
    [4] = {
        id = 14399, -- Culinarian's Apron
        rank = 7,
        cost = 100000 
    },
    [5] = {
        id = 137, -- Cordon Bleu Cooking Set
        rank = 9,
        cost = 150000 
    },
    [6] = {
        id = 338, -- Culinarian's Signboard
        rank = 9,
        cost = 200000 
    },
    [7] = {
        id = 15826, -- Chef's Ring
        rank = 6,
        cost = 80000 
    },
	[8] = {
		id = 3667, -- Brass Crock
		rank = 7,
		cost = 50000 
    },
    [9] = {
        id = 3328, -- Culinarian's Emblem
        rank = 9,
        cost = 15000 
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 0x2729, 8);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	unionRepresentativeTrigger(player, 8, 0x2728, "guild_cooking", keyitems);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
     
    if (csid == 0x2728) then
        unionRepresentativeTriggerFinish(player, option, target, 8, "guild_cooking", keyitems, items);
    elseif (csid == 0x2729) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;
