-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  qm1 (???)
-- Note: Used to spawn Adamantoise and Aspidochelone
-- @pos 0 0 -37 59
-----------------------------------
package.loaded["scripts/zones/Valley_of_Sorrows/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Valley_of_Sorrows/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local Adamantoise = GetMobAction(17301537);
	local Aspidochelone = GetMobAction(17301538);
	-- Trade Clump of Red Pondweed
	if ((Aspidochelone == ACTION_NONE or Aspidochelone == ACTION_SPAWN) and trade:hasItemQty(3344,1) and trade:getItemCount() == 1) then -- Check trade, and if mob is ACTION_NONE (0) or waiting to spawn (24)
		if (LandKingSystem_HQ == 1 or LandKingSystem_HQ == 2) then
			player:tradeComplete();
			SpawnMob(17301538,180):updateClaim(player);
		end
		-- Trade Clump of Blue Pondweed
	elseif ((Adamantoise == ACTION_NONE or Adamantoise == ACTION_SPAWN) and trade:hasItemQty(3343,1) and trade:getItemCount() == 1) then
		if (LandKingSystem_NQ == 1 or LandKingSystem_NQ == 2) then
			player:tradeComplete();
			SpawnMob(17301537,180):updateClaim(player);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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