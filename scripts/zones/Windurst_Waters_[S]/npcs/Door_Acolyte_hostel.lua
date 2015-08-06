-----------------------------------
--  Area: Windurst Waters (S)
--  NPC: Door Acolyte hostel
--  @pos 125 -2 216 94
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
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
	if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS)==QUEST_ACCEPTED and player:hasKeyItem(SMALL_STARFRUIT)) then
		player:startEvent(0x81);
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
	if (csid==0x81) then
		player:addItem(4144); -- hi-elixir
		player:messageSpecial(ITEM_OBTAINED, 4144);
		player:delKeyItem(SMALL_STARFRUIT);
		player:addKeyItem(BRASS_RIBBON_OF_SERVICE);
		player:messageSpecial(KEYITEM_OBTAINED, BRASS_RIBBON_OF_SERVICE);
		player:completeQuest(CRYSTAL_WAR, THE_TIGRESS_STIRS);
	end
end;

