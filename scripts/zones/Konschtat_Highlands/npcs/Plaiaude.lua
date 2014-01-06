-----------------------------------
-- Area: Konschtat Highlands
-- NPC:  Plaiaude
-- Type: Chocobo Vendor
-- @pos 244.705 24.034 296.973 108
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local price = 100;
local gil = player:getGil();
local hasLicense = player:hasKeyItem(CHOCOBO_LICENSE);
local ChocobosWounds = player:getQuestStatus(JEUNO,CHOCOBO_S_WOUNDS);
local level = player:getMainLvl();

	if ((hasLicense and level >= 15) or (level >=15 and ChocobosWounds == QUEST_COMPLETED)) then
		player:startEvent(0x038e,price,gil);
	else
		player:startEvent(0x038f,price,gil);
	end

end;

  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);

	local price = 100;
	local level = player:getMainLvl();

	if (csid == 0x038e and option == 0) then
        if (player:delGil(price)) then
            if (level >= 20) then
                player:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,1,0,1800,true);
            else
                player:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,1,0,900,true);
            end
        end
	end

end;