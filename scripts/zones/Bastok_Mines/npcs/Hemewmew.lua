-----------------------------------
--  Area: Bastok Mines
--  NPC: Hemewmew
--  Type: Guildworker's Union Representative
--  @zone: 234
--  @pos 117.970 1.017 -10.438
-----------------------------------

package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Bastok_Mines/TextIDs");

local keyitems = {
    [0] = {
        id = ANIMA_SYNTHESIS,
        rank = 3,
        cost = 20000
    },
    [1] = {
        id = ALCHEMIC_PURIFICATION,
        rank = 3,
        cost = 40000 
    },
    [2] = {
        id = ALCHEMIC_ENSORCELLMENT,
        rank = 3,
        cost = 40000 
    },
    [3] = {
        id = TRITURATION,
        rank = 3,
        cost = 10000 
    },
    [4] = {
        id = CONCOCTION,
        rank = 3,
        cost = 20000 
    },
    [5] = {
        id = IATROCHEMISTRY,
        rank = 3,
        cost = 10000 
    },
    [6] = {
        id = WAY_OF_THE_ALCHEMIST,
        rank = 9,
        cost = 20000 
    }
};

local items = {
    [2] = {
        id = 15450, -- Alchemist's Belt
        rank = 4,
        cost = 10000 
    },
    [3] = {
        id = 17058, -- Caduceus
        rank = 5,
        cost = 70000 
    },
    [4] = {
        id = 14398, -- Alchemist's Apron
        rank = 7,
        cost = 100000 
    },
    [5] = {
        id = 134, -- copy of Emeralda
        rank = 9,
        cost = 150000 
    },
    [6] = {
        id = 342, -- Alchemist's Signboard
        rank = 9,
        cost = 200000 
    },
    [7] = {
        id = 15825, -- Alchemist's Ring
        rank = 6,
        cost = 80000 
    },
    [8] = {
        id = 3674, -- Alembic
        rank = 7,
        cost = 50000
    },
    [9] = {
        id = 3332, -- Alchemist's Emblem
        rank = 9,
        cost = 15000 
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 0xcf, 7);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    unionRepresentativeTrigger(player, 7, 0xce, "guild_alchemy", keyitems);
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
     
    if (csid == 0xce) then
        unionRepresentativeTriggerFinish(player, option, target, 7, "guild_alchemy", keyitems, items);
    elseif (csid == 0xcf) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;
