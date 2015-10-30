-----------------------------------
--  Area: Windurst Woods
--  NPC: Samigo-Pormigo
--  Type: Guildworker's Union Representative
--  @zone: 241
--  @pos -9.782 -5.249 -134.432
-----------------------------------

package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Windurst_Woods/TextIDs");

local keyitems = {
     [0] = {
        id = BONE_PURIFICATION,
        rank = 3,
        cost = 40000 
    },
    [1] = {
        id = BONE_ENSORCELLMENT,
        rank = 3,
        cost = 40000 
    },
	[2] = {
        id = FILING,
        rank = 3,
        cost = 10000 
    },
    [3] = {
        id = WAY_OF_THE_BONEWORKER,
        rank = 9,
        cost = 20000 
    }
};

local items = {
    [2] = {
        id = 15449,
        rank = 3,
        cost = 10000 
    },
    [3] = {
        id = 13947,
        rank = 6,
        cost = 70000 
    },
    [4] = {
        id = 14397,
        rank = 7,
        cost = 100000 
    },
    [5] = {
        id = 142, -- Drogaroga's Fang
        rank = 9,
        cost = 150000 
    },
    [6] = {
        id = 336, -- Boneworker's Signboard
        rank = 9,
        cost = 200000
    },
	[7] = {
        id = 15824, -- Bonecrafter's Ring
        rank = 6,
        cost = 80000
    },
	[8] = {
        id = 3663, -- Bonecraft Tools
        rank = 7,
        cost = 50000
    },
	[9] = {
        id = 3326, -- Boneworker's Emblem
        rank = 9,
        cost = 15000
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 0x2727, 6);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	unionRepresentativeTrigger(player, 6, 0x2726, "guild_bonecraft", keyitems);
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
     
    if (csid == 0x2726) then
        unionRepresentativeTriggerFinish(player, option, target, 6, "guild_bonecraft", keyitems, items);
    elseif (csid == 0x2727) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;

