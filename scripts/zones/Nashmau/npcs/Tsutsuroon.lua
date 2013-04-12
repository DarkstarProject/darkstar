-----------------------------------
--  Area: Nashmau
--   NPC: Tsutsuroon
--  Type: Tenshodo Merchant
-- @zone: 53
--  @pos: 
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Nashmau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:hasKeyItem(TENSHODO_MEMBERS_CARD)) then 
		if(player:sendGuild(60422,1,23,7)) then
			player:showText(npc, TSUTSUROON_SHOP_DIALOG);
		end
	else
	end
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

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

