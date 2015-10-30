-----------------------------------
--  Area: South San d'Oria
--  NPC: Alivatand
--  Type: Guildworker's Union Representative
--  @zone: 230
--  @pos -179.458 -1 15.857
-----------------------------------

package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Southern_San_dOria/TextIDs");

local keyitems = {
    [0] = {
        id = LEATHER_PURIFICATION,
        rank = 3,
        cost = 40000 
    },
    [1] = {
        id = LEATHER_ENSORCELLMENT,
        rank = 3,
        cost = 40000 
    },
    [2] = {
        id = TANNING,
        rank = 3,
        cost = 10000 
    },
    [3] = {
        id = WAY_OF_THE_TANNER,
        rank = 9,
        cost = 20000 
    }
};

local items = {
    [2] = {
        id = 15448, -- Tanner's Belt
        rank = 3,
        cost = 10000 
    },
    [3] = {
        id = 14832, -- Tanner's Gloves
        rank = 5,
        cost = 70000 
    },
    [4] = {
        id = 14396, -- Tanner's Apron
        rank = 7,
        cost = 100000 
    },
    [5] = {
        id = 202, -- Golden Fleece
        rank = 9,
        cost = 150000 
    },
    [6] = {
        id = 339, -- Tanner's Signboard
        rank = 9,
        cost = 200000 
    },
    [7] = {
        id = 15823, -- Tanner's Ring
        rank = 6,
        cost = 80000 
    },
    [8] = {
        id = 3668, -- Hide Stretcher
        rank = 7,
        cost = 50000 
    },
    [9] = {
        id = 3329, -- Tanners' Emblem
        rank = 9,
        cost = 15000 
    }
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)	
	-- "Flyers for Regine" conditional script
	local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
	if (FlyerForRegine == 1) then
		local count = trade:getItemCount();
		local MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	else
		unionRepresentativeTrade(player, npc, trade, 0x02b3, 5);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	unionRepresentativeTrigger(player, 5, 0x02b2, "guild_leathercraft", keyitems);
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
     
    if (csid == 0x02b2) then
        unionRepresentativeTriggerFinish(player, option, target, 5, "guild_leathercraft", keyitems, items);
    elseif (csid == 0x02b3) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;

