-----------------------------------
--	Area: Jugner Forest
--	NPC:  Chaplion, R.K.

-- Outpost Conquest Guards

-- X Grant Signet
--   Recharge Emperor Band, Empress Band, or Chariot Band
-- X Sets the player's Home Point to their location for free
-- X Accepts supplies for the region in which the guard is located, for finishing Supply Quest
--   Accepts Garrison starting item of the region, in which the guard is located 
-------------------------------------
package.loaded["scripts/zones/Jugner_Forest/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/conquestguards");
require("scripts/zones/Jugner_Forest/TextIDs");

NationNPC = 0; -- 0: San d'oria, 1: Bastok, 2: Windurst

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
end; 

----------------------------------- 
-- onTrigger Action 
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getNation() == NationNPC) then
		if(player:hasKeyItem(NORVALLEN_SUPPLIES)) then
			player:messageSpecial(7961);
			player:setVar("NORV_TELE", 1);
			player:delKeyItem(NORVALLEN_SUPPLIES);
		else
			player:startEvent(0x7ffb); 
		end
	end
	
end;  

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);

	if(option == 1) then
		player:delStatusEffect(EFFECT_SIGNET);
		ranktime = player:getRank() * 60 * 60;
		duration = ranktime + 0 + 10800;
		player:addStatusEffect(EFFECT_SIGNET,0,0,duration);
	elseif(option == 4) then
		player:setHomePoint();
		player:messageSpecial(HOMEPOINT_SET);
	end

end;