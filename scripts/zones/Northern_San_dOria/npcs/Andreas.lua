-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Andreas
--  Type: Guildworker's Union Representative
--  @zone: 231
--  @pos -189.282 10.999 262.626
-----------------------------------

package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Northern_San_dOria/TextIDs");

local keyitems = {
    [0] = {
        id = WOOD_PURIFICATION,
        rank = 3,
        cost = 40000 
    },
    [1] = {
        id = WOOD_ENSORCELLMENT,
        rank = 3,
        cost = 40000 
    },
    [2] = {
        id = LUMBERJACK,
        rank = 3,
        cost = 10000 
    },
     [3] = {
        id = BOLTMAKER,
        rank = 3,
        cost = 10000 
    },
    [4] = {
        id = WAY_OF_THE_CARPENTER,
        rank = 9,
        cost = 20000 
    }
};

local items = {
    [2] = {
        id = 15444, -- Carpenter's Belt
        rank = 1,
        cost = 10000 
    },
    [3] = {
        id = 14830, -- Carpenter's Gloves
        rank = 5,
        cost = 70000 
    },
    [4] = {
        id = 14392, -- Carpenter's Apron
        rank = 7,
        cost = 100000 
    },
    [5] = {
        id = 28, -- Drawing Desk
        rank = 9,
        cost = 150000 
    },
    [6] = {
        id = 341, -- Carpenter's Signboard
        rank = 9,
        cost = 200000 
    },
    [7] = {
        id = 15819, -- Carpenter's Ring
        rank = 6,
        cost = 80000 
    },
    [8] = {
        id = 3672, -- Carpenter's Kit
        rank = 8,
        cost = 50000 
    },
    [9] = {
        id = 3331, -- Carpenter's Emblem
        rank = 9,
        cost = 15000 
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 0x02dc, 1);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    unionRepresentativeTrigger(player, 1, 0x02db, "guild_woodworking", keyitems);
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
     
    if (csid == 0x02db) then
        unionRepresentativeTriggerFinish(player, option, target, 1, "guild_woodworking", keyitems, items);
    elseif (csid == 0x02dc) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;
