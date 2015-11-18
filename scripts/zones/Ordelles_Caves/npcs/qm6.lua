-----------------------------------
-- Area: Ordelles Caves
-- NPC:  ??? (qm6)
-- Involved In Quest: Dark Puppet
-- @pos -132 -27 -245 193
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Ordelles_Caves/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getVar("darkPuppetCS") >= 4) then
		if (trade:hasItemQty(16940,1) and trade:getItemCount() == 1) then -- Trade Gerwitz's Sword
			player:tradeComplete();
			player:messageSpecial(GERWITZS_SOUL_DIALOG);
			SpawnMob(17568137,180):updateClaim(player);
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