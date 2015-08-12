-----------------------------------
--  Area: Windurst Woods
--  NPC: Hauh Colphioh
--  Type: Guildworker's Union Representative
--  @zone: 241
--  @pos -38.173 -1.25 -113.679
-----------------------------------

package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Windurst_Woods/TextIDs");

local keyitems = {
     [0] = {
        id = CLOTH_PURIFICATION,
        rank = 3,
        cost = 40000 
    },
    [1] = {
        id = CLOTH_ENSORCELLMENT,
        rank = 3,
        cost = 40000 
    },
	[2] = {
        id = SPINNING,
        rank = 3,
        cost = 10000 
    },
	[3] = {
        id = FLETCHING,
        rank = 3,
        cost = 10000 
    },
    [4] = {
        id = WAY_OF_THE_WEAVER,
        rank = 9,
        cost = 20000 
    }
};

local items = {
    [2] = {
        id = 15447, -- Weaver's Belt
        rank = 4,
        cost = 10000 
    },
    [3] = {
        id = 13946, -- Magnifying Spectacles
        rank = 6,
        cost = 70000 
    },
    [4] = {
        id = 14395, -- Weaver's Apron
        rank = 7,
        cost = 100000 
    },
    [5] = {
        id = 198, -- Gilt Tapestry
        rank = 9,
        cost = 150000 
    },
    [6] = {
        id = 337, -- Weaver's Signboard
        rank = 9,
        cost = 200000
    },
	[7] = {
        id = 15822, -- Tailor's Ring
        rank = 6,
        cost = 80000
    },
	[8] = {
        id = 3665, -- Spinning Wheel
        rank = 7,
        cost = 50000
    },
	[9] = {
        id = 3327, -- Weavers' Emblem
        rank = 9,
        cost = 15000
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 0x2729, 4);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	unionRepresentativeTrigger(player, 4, 0x2728, "guild_weaving", keyitems);
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
        unionRepresentativeTriggerFinish(player, option, target, 4, "guild_weaving", keyitems, items);
    elseif (csid == 0x2729) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;

