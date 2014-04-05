-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  qm1 (???)
-- Note: Used to spawn Aspidochelone
-- @pos 91 -3 -16 128
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Valley_of_Sorrows/TextIDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local Adamantoise = GetMobAction(17301537);
	local Aspidochelone = GetMobAction(17301538);
	-- Trade Clump of Red Pondweed
	if((Aspidochelone == ACTION_NONE or Aspidochelone == ACTION_SPAWN) and trade:hasItemQty(3344,1) and trade:getItemCount() == 1) then -- Check trade, and if mob is ACTION_NONE (0) or waiting to spawn (24)
		if (LandKingSystem_HQ == 1 or LandKingSystem_HQ == 2) then
			player:tradeComplete();
			SpawnMob(17301538,180):updateEnmity(player);
		end
		-- Trade Clump of Red Pondweed
	elseif((Adamantoise == ACTION_NONE or Adamantoise == ACTION_SPAWN) and trade:hasItemQty(3343,1) and trade:getItemCount() == 1) then
		if (LandKingSystem_NQ == 1 or LandKingSystem_NQ == 2) then
			player:tradeComplete();
			SpawnMob(17301537,180):updateEnmity(player);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
local KEYITEM_OBTAINED = 6381; -- Put this as a local until the TextIDs have all been fixed.

function onTrigger(player,npc)
	if(player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 1) then
		player:addKeyItem(FIGURE_OF_TITAN);
		player:messageSpecial(KEYITEM_OBTAINED,FIGURE_OF_TITAN);
		player:setVar("MissionStatus",2);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;