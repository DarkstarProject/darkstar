-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Sobane
-- Starts and Finishes Quest: Signed in Blood
-- Involved in quest: Sharpening the Sword, Riding on the Clouds
-- @zone 230
-- @pos -190 -3 97
-- csid: 0x0034  0x02dc  0x02dd  0x02de  0x02df  0x02e0  0x02e1  0x02e2  0x02e3  0x02e4  0x02e5 
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-------------------------------------
require("scripts/globals/player");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    -- FLYERS FOR REGINE QUEST --
    if (trade:hasItemQty(532,1) and count == 1) then -- Trade Magicmart Flyer
        if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
            player:messageSpecial(FLYER_REFUSED);
        end

    -- SIGNED IN BLOOD QUEST --
    elseif (trade:hasItemQty(1662,1) and count == 1) then
        if (player:getQuestStatus(SANDORIA,SIGNED_IN_BLOOD) == QUEST_ACCEPTED and player:getVar("SIGNED_IN_BLOOD_Prog") < 1) then
            player:startEvent(0x02DE,0,1662);
        end

    -- RIDING ON THE CLOUDS QUEST --
    elseif (trade:hasItemQty(1127,1) and count == 1) then -- Trade Kindred seal
        if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 2) then
            player:setVar("ridingOnTheClouds_1",0);
            player:tradeComplete();
            player:addKeyItem(SCOWLING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SCOWLING_STONE);
        end
    end
end

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
	local blood = player:getQuestStatus(SANDORIA,SIGNED_IN_BLOOD);
	local bloodProg = player:getVar("SIGNED_IN_BLOOD_Prog");
        if (player:getVar("sharpeningTheSwordCS") >= 2) then
		player:startEvent(0x0034);

        elseif (blood == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then
		player:startEvent(0x02dc,0,1662); -- Start Quest
	
	elseif (blood == QUEST_ACCEPTED and bloodProg < 1) then
		player:startEvent(0x02dd,0,1662); -- after
	
	elseif (bloodProg == 3 and blood == QUEST_ACCEPTED) then
		player:startEvent(0x02E0); -- complete
	
	elseif (bloodProg >= 1 and blood == QUEST_ACCEPTED) then
		player:startEvent(0x02df);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if (csid == 0x02dc and option == 1) then
		player:addQuest(SANDORIA,SIGNED_IN_BLOOD);
	
	elseif (csid == 0x02E0) then
		if (player:getFreeSlotsCount() >= 1) then
			player:delKeyItem(TORN_OUT_PAGES);
			player:addItem(14760,1);
			player:messageSpecial(ITEM_OBTAINED,14760);
			player:addFame(SANDORIA,SAN_FAME*30);
			player:completeQuest(SANDORIA,SIGNED_IN_BLOOD);
			player:setVar("SIGNED_IN_BLOOD_Prog",0);
			player:addGil(GIL_RATE*3500);
			player:tradeComplete();
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14760);
		end
	elseif (csid == 0x0034) then
		player:setVar("sharpeningTheSwordCS",3);
		
	elseif (csid == 0x02DE) then
		player:setVar("SIGNED_IN_BLOOD_Prog",1);
	end
	

	
end;
