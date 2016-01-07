-----------------------------------
--  Area: Bastok Markets
--   NPC: Ellard
--  Type: Guildworker's Union Representative
-- @zone: 235
--  @pos -214.355 -7.814 -63.809
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Bastok_Markets/TextIDs");

local keyitems = {
    [0] = {
        id = GOLD_PURIFICATION,
        rank = 3,
        cost = 40000 
    },
    [1] = {
        id = GOLD_ENSORCELLMENT,
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
        id = CLOCKMAKING,
        rank = 3,
        cost = 10000 
    },
    [5] = {
        id = WAY_OF_THE_GOLDSMITH,
        rank = 9,
        cost = 20000 
    }
};

local items = {
    [2] = {
        id = 15446,
        rank = 3,
        cost = 10000 
    },
    [3] = {
        id = 13945,
        rank = 5,
        cost = 70000 
    },
    [4] = {
        id = 14394,
        rank = 7,
        cost = 100000 
    },
    [5] = {
        id = 151,
        rank = 9,
        cost = 150000 
    },
    [6] = {
        id = 335,
        rank = 9,
        cost = 200000 
    },
    [7] = {
        id = 15821,
        rank = 6,
        cost = 80000 
    },
    [8] = {
        id = 3595,
        rank = 7,
        cost = 50000 
    },
    [9] = {
        id = 3325,
        rank = 9,
        cost = 15000 
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 0x155, 3);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    unionRepresentativeTrigger(player, 3, 0x154, "guild_goldsmithing", keyitems);
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
     
    if (csid == 0x154) then
        unionRepresentativeTriggerFinish(player, option, target, 3, "guild_goldsmithing", keyitems, items);
    elseif (csid == 0x155) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;

