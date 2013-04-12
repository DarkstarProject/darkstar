-----------------------------------
--  Area: Lower Jeuno
--   NPC: Akamafula
--  Type: Tenshodo Merchant
-- @zone: 245
--  @pos: 28.465 2.899 -46.699
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Lower_Jeuno/TextIDs");

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
		if(player:sendGuild(60417,1,23,2)) then
			player:showText(npc, AKAMAFULA_SHOP_DIALOG);
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

