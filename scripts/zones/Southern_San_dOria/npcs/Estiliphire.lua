-----------------------------------
--  Area: Southern Sandoria
--   NPC: Estiliphire
--  Type: Traveling Merchant NPC
--  @zone: 230
--  @pos -41.550 1.999 -2.845
--
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x381);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

