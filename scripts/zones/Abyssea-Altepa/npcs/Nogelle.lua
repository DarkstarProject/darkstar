-----------------------------------
-- Area: Abyssea Altepa
-- NPC: Nogelle
-- Type: Standard NPC
-- @zone 218
-- @pos 415 0 311 218
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
local NOGELLE_GHETTO_DIALOG = 7923
	player:showText(npc, NOGELLE_GHETTO_DIALOG); -- Doesn't have any 'default' dialogue, just quest dialogues til i script the quest.
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

