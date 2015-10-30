-----------------------------------
-- Area: Dragons Aery
-- NPC:  ??? (Spawn Nidhogg)
-- @pos -81 32 2 178
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Dragons_Aery/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local Fafnir = GetMobAction(17408018);
	local Nidhogg = GetMobAction(17408019);

	-- Trade Cup of Sweet Tea
	if ((Nidhogg == ACTION_NONE or Nidhogg == ACTION_SPAWN) and trade:hasItemQty(3340,1) and trade:getItemCount() == 1) then -- Check trade, and if mob is ACTION_NONE (0) or waiting to spawn (24)
		if (LandKingSystem_HQ == 1 or LandKingSystem_HQ == 2) then
			player:tradeComplete();
			SpawnMob(17408019,180):updateClaim(player); -- onMobEngaged does not run for scripted spawns.
		end
	-- Trade Cup of Honey Wine
	elseif ((Fafnir == ACTION_NONE or Fafnir == ACTION_SPAWN) and trade:hasItemQty(3339,1) and trade:getItemCount() == 1) then
		if (LandKingSystem_NQ == 1 or LandKingSystem_NQ == 2) then
			player:tradeComplete();
			SpawnMob(17408018,180):updateClaim(player);
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