-----------------------------------
-- Area: Bastok Mines
--  NPC: Hemewmew
-- Type: Guildworker's Union Representative
-- !pos 117.970 1.017 -10.438 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/crafting");

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
    [0] = {
        id = 15450, -- Alchemist's Belt
        rank = 4,
        cost = 10000
    },
    [1] = {
        id = 17058, -- Caduceus
        rank = 5,
        cost = 70000
    },
    [2] = {
        id = 14398, -- Alchemist's Apron
        rank = 7,
        cost = 100000
    },
    [3] = {
        id = 134, -- copy of Emeralda
        rank = 9,
        cost = 150000
    },
    [4] = {
        id = 342, -- Alchemist's Signboard
        rank = 9,
        cost = 200000
    },
    [5] = {
        id = 15825, -- Alchemist's Ring
        rank = 6,
        cost = 80000
    },
    [6] = {
        id = 3674, -- Alembic
        rank = 7,
        cost = 50000
    },
    [7] = {
        id = 3332, -- Alchemist's Emblem
        rank = 9,
        cost = 15000
    }
};

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 207, 7);
end;

function onTrigger(player,npc)
    unionRepresentativeTrigger(player, 7, 206, "guild_alchemy", keyitems);
end;

function onEventUpdate(player,csid,option,target)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 206) then
        unionRepresentativeTriggerFinish(player, option, target, 7, "guild_alchemy", keyitems, items);
    end
end;

function onEventFinish(player,csid,option,target)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 206) then
        unionRepresentativeTriggerFinish(player, option, target, 7, "guild_alchemy", keyitems, items);
    elseif (csid == 207) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;
