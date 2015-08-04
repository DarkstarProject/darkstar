-----------------------------------
--  Area: Metalworks
--  NPC: Lorena
--  Type: Blacksmithing Guildworker's Union Representative
--  @zone: 237
--  @pos -104.990 1 30.995
-----------------------------------

package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/crafting");

local keyitems = {
    [0] = {
        id = METAL_PURIFICATION,
        rank = 3,
        cost = 40000 
    },
    [1] = {
        id = METAL_ENSORCELLMENT,
        rank = 3,
        cost = 40000 
    },
    [2] = {
        id = CHAINWORK,
        rank = 3,
        cost = 10000 
    },
    [3] = {
        id = SHEETING,
        rank = 3,
        cost = 10000 
    },
    [4] = {
        id = WAY_OF_THE_BLACKSMITH,
        rank = 9,
        cost = 20000 
    }

};

local items = {
    [2] = {
        id = 15445,
        rank = 3,
        cost = 10000 
    },
    [3] = {
        id = 14831,
        rank = 5,
        cost = 70000 
    },
    [4] = {
        id = 14393,
        rank = 7,
        cost = 100000 
    },
    [5] = {
        id = 153,
        rank = 9,
        cost = 150000 
    },
    [6] = {
        id = 334,
        rank = 9,
        cost = 200000 
    },
    [7] = {
        id = 15820,
        rank = 6,
        cost = 80000 
    },
    [8] = {
        id = 3661,
        rank = 7,
        cost = 50000 
    },
    [9] = {
        id = 3324,
        rank = 9,
        cost = 15000 
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 0x321, 2);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	unionRepresentativeTrigger(player, 2, 0x320, "guild_smithing", keyitems);
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

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
    if (csid == 0x320) then
        unionRepresentativeTriggerFinish(player, option, target, 2, "guild_smithing", keyitems, items);
    elseif (csid == 0x321) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;

