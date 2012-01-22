-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Dauperiat
-- Starts and Finishes Quest: Blackmail (R)
-- @zone 231
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Blackmail" quest status
   Black = player:getQuestStatus(SANDORIA,BLACKMAIL);
   --TRADE BLACKMAIL
   if (player:getQuestStatus(SANDORIA,BLACKMAIL) >= 1) then
      count = trade:getItemCount();
      carta = trade:hasItemQty(530, 1);
      gil = trade:getGil();
      if (carta == 1 and count == 1 and gil == 0) then
	player:startEvent(0x0288);
      end
   end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- "Blackmail" quest status
	blackMail = player:getQuestStatus(SANDORIA, BLACKMAIL);
	envelope = player:hasKeyItem(SUSPICIOUS_ENVELOPE);
	word = player:hasKeyItem(KEY_ITEM318);
	sanFame = player:getFameLevel(SANDORIA);
	sanRank = player:getRank(SANDORIA);
	
	if(sanFame >= 3 and sanRank >= 3) then
		if(blackMail == QUEST_AVAILABLE and envelope == false and word == false) then
			player:startEvent(0x0283);
		elseif(envelope) then  
			player:startEvent(0x0285);
		elseif(blackMail == QUEST_AVAILABLE and word) then
			player:startEvent(0x0286);
			player:delKeyItem(SEALED_IRON_BOX);
		elseif(blackMail == QUEST_ACCEPTED) then
			player:startEvent(0x0281);
		elseif(blackMail == QUEST_COMPLETED) then
			player:startEvent(0x0287);
		end
	else
		player:startEvent(0x0282);
	end	
	
end; 
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--print("CSID: %u",csid);
--print("RESULT: %u",option);

	if(csid == 0x0283) then
		player:addQuest(SANDORIA,BLACKMAIL);
		player:addKeyItem(SUSPICIOUS_ENVELOPE);
		player:messageSpecial(KEYITEM_OBTAINED,SUSPICIOUS_ENVELOPE);
	elseif(csid == 0x0288) then
		player:tradeComplete();
		player:addGil(GIL_RATE*900);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*900)
		if(player:getQuestStatus(SANDORIA,BLACKMAIL) == QUEST_ACCEPTED) then
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,BLACKMAIL);
		else
			player:addFame(SANDORIA,SAN_FAME*5);
		end
	elseif(csid == 0x028 and option == 1) then
		player:addQuest(SANDORIA,BLACKMAIL);
	end

end;