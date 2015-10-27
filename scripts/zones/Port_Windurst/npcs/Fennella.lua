-----------------------------------
--  Area: Port Windurst
--  NPC: Fennella
--  Type: Guildworker's Union Representative
--  @zone: 240
--  @pos -177.811 -2.835 65.639
-----------------------------------

package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Port_Windurst/TextIDs");

local keyitems = {
    [0] = {
        id = FROG_FISHING,
        rank = 3,
        cost = 30000 
    },
    [1] = {
        id = SERPENT_RUMORS,
        rank = 8,
        cost = 95000 
    },
    [2] = {
        id = MOOCHING,
        rank = 9,
        cost = 115000 
    },
	 [3] = {
        id = ANGLERS_ALMANAC,
        rank = 9,
        cost = 20000 
    }
};

local items = {
    [2] = {
        id = 17002, -- Robber's Rig
        rank = 3,
        cost = 1500 
    },
	[3] = {
        id = 15452, -- Fisherman's Belt
        rank = 4,
        cost = 10000 
    },
    [4] = {
        id = 14195, -- Pair of Waders
        rank = 5,
        cost = 70000 
    },
    [5] = {
        id = 14400, -- Fisherman's Apron
        rank = 7,
        cost = 100000 
    },
    [6] = {
        id = 191, -- Fishing hole map
        rank = 9,
        cost = 150000 
    },
    [7] = {
        id = 340, -- Fisherman's Signboard
        rank = 9,
        cost = 200000 
    },
    [8] = {
        id = 3670, -- Fish and Lure
        rank = 7,
        cost = 50000 
    },
    [9] = {
        id = 3330, -- Fishermen's Emblem
        rank = 9,
        cost = 15000 
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, npc, trade, 0x2725, 0);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	unionRepresentativeTrigger(player, 0, 0x2724, "guild_fishing", keyitems);
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
     
    if (csid == 0x2724) then
        unionRepresentativeTriggerFinish(player, option, target, 0, "guild_Fishing", keyitems, items);
    elseif (csid == 0x2725) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;
