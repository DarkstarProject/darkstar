-----------------------------------
-- Area: Bibiki Bay
-- NPC: Mep Nhapopoluko
-- Guild Merchant NPC: Fishing Guild 
-- @zone: 4
-- @pos: 464.350 -6 752.731
-----------------------------------

package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
require("scripts/zones/Bibiki_Bay/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:sendGuild(518,1,23,5)) then
		player:showText(npc, MEP_NHAPOPOLUKO_DIALOG);
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

