-----------------------------------
--  Area: Jugner Forest (S)
--  NPC:  ???
--  Type: Quest NPC
--  @pos 68 -0.5 324 82
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Jugner_Forest_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getQuestStatus(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("ClawsOfGriffonProg") == 1) then
		player:startEvent(0xC9);

	elseif(player:getQuestStatus(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("ClawsOfGriffonProg") == 2) then
		player:startEvent(0xCA)

	elseif(player:getQuestStatus(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("ClawsOfGriffonProg") == 3) then
		player:startEvent(0xCB)
	else
		player:messageSpecial(NOTHING_HAPPENS);
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

	if(csid == 0xC9) then
		player:setVar("ClawsOfGriffonProg",2);

	elseif(csid == 0xCA) then
		SpawnMob(17113462,180):updateClaim(player);

	elseif(csid == 0xCB) then
		if(player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,813);
		else
			player:addItem(813,1);
			player:messageSpecial(ITEM_OBTAINED,813);
			player:addKeyItem(ALLIED_RIBBON_OF_GLORY);
			player:messageSpecial(KEYITEM_OBTAINED, ALLIED_RIBBON_OF_GLORY);
			player:completeQuest(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON);
			player:setVar("ClawsOfGriffonProg",0);
		end
	end

end;