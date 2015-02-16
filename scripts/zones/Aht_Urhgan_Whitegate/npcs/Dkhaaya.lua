-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Dkhaaya
--  Type: Standard NPC
--  @pos -73.212 -1 -5.842 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------


function onTrigger(player,npc)

oldummStatus = player:getQuestStatus(AHT_URHGAN,OLDUUM);
quest_status = player:getVar("OLDUUM_QUEST_STATUS");
-- quest_status == 0 : quest hasn't been activated
-- quest_status == 1 : on quest for the first time
-- quest_status == 2 : completed for the first time
-- quest_status == 3 : restarted, not yet completed again
-- quest_status == 4 : completed again (distinction is important for setting correct CS at leypoint)

	local keyitem = 0;

	if (oldummStatus == QUEST_AVAILABLE) then
	  event = 0x0004;
	  player:addKeyItem(0x02FF); -- add keyitem Dkhaaya's research journal
	  player:messageSpecial(KEYITEM_OBTAINED,0x02FF);
	  player:addQuest(6,2);
	  player:setVar("OLDUUM_QUEST_STATUS",1);
	elseif (oldummStatus == QUEST_ACCEPTED and (quest_status == 1 or quest_status == 3)) then
	  if (player:hasKeyItem(0x0300) == 1) then -- electrocell
		keyitem = 0x300;
	  end
	  if (player:hasKeyItem(0x0301) == 1) then -- electropod
		keyitem = 0x301;
	  end
	  if (player:hasKeyItem(0x0302) == 1) then -- electrolocomotive
		keyitem = 0x302;
		end
		if (keyitem == 0) then
		  event = 0x0005;
		else
		  if (quest_status == 3) then -- quest is being finished again
			event = 0x0008;
		  else						  -- quest is being finished for the first time
			event = 0x0006;
		  end;
		end
	elseif (oldummStatus == QUEST_COMPLETED and (quest_status ==2 or quest_status ==4)) then
		if ((player:hasItem(2217) == 1) or (player:hasItem(15769) == 1)) then -- player has lightning band or olduum ring?
		  event = 0x0007;
		else
		  event = 0x0004; -- NEED TO FIX THIS for starting repeat of the quest, but this will do for now
		  player:setVar("OLDUUM_QUEST_STATUS",3);
		end
	end

	player:startEvent(event,keyitem);
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
	if (csid == 0x0006 or csid == 0x0008) then
	  player:completeQuest(AHT_URHGAN,OLDUUM)
	  player:addItem(2217) -- player receives lightning band
	  player:messageSpecial(ITEM_OBTAINED,2217);
	  if (csid == 0x0006) then
		player:setVar("OLDUUM_QUEST_STATUS",2);
	  elseif (csid == 0x0008) then
		player:setVar("OLDUUM_QUEST_STATUS",4);
	  end;

	  if (player:hasKeyItem(0x300) == 1) then
		player:delKeyItem(0x300); -- electrocell
	  end
	  if (player:hasKeyItem(0x301) == 1) then
		player:delKeyItem(0x301); -- electropod
	  end
	  if (player:hasKeyItem(0x302) == 1) then
		player:delKeyItem(0x302); -- electrolocomotive
		end
	end
end;
