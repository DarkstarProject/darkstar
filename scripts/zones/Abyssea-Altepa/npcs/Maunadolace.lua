-----------------------------------
-- Area: Abyssea Altepa
-- NPC: Maunadolace
-- Type: Standard NPC
-- @zone 218
-- @pos 396 0 305 218
-----------------------------------
package.loaded["scripts/zones/Abyssea-Altepa/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local MAUNADOLACE_GHETTO_DIALOG = 8182;
	player:showText(npc,MAUNADOLACE_GHETTO_DIALOG)
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

