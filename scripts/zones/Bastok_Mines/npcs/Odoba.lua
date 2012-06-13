-----------------------------------
-- Area: Bastok Mines
-- NPC: Odoba
-- Guild Merchant NPC: Alchemy Guild 
-- @zone: 234
-- @pos: 108.473 5.017 1.089
-----------------------------------

package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:sendGuild(521,8,23,6)) then
		player:showText(npc, ODOBA_SHOP_DIALOG);
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

