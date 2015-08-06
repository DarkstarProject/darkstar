-----------------------------------
--  Area: Windurst Waters (S)
--   NPC: Dhea Prandoleh
--  Type: Standard NPC
-- @zone: 94
--  @pos 3.167 -2 15.545
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
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
	if (player:getCampaignAllegiance() == 3) then

		if (player:getCurrentMission(WOTG) == BACK_TO_THE_BEGINNING and player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS) == QUEST_AVAILABLE) then
			player:startEvent(0x80);
		else
			player:startEvent(0x00a0);
		end

	else
		player:startEvent(0x00a0);
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
	if (csid==0x80) then
		player:addQuest(CRYSTAL_WAR, THE_TIGRESS_STIRS);
	end
end;

