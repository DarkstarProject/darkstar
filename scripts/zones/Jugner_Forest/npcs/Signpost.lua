-----------------------------------
--  Area: Jugner Forest
--  NPC: Singpost
--  General Info NPC
-------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/quests");

----------------------------------- 
-- onTrade Action
----------------------------------- 

function onTrade(player,npc,trade) 

end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc)
    cleanedSignPost = player:getVar("CleanSignPost");

    if (npc:getID() == 17203803) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and player:getMaskBit("CleanSignPost",0) == false) then
            player:startEvent(0x0006,1);
        else
            player:startEvent(0x0001);
        end
    elseif (npc:getID() == 17203804) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and player:getMaskBit("CleanSignPost",1) == false) then
            player:startEvent(0x0007,1);
        else
            player:startEvent(0x0002);
        end
    elseif (npc:getID() == 17203805) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and player:getMaskBit("CleanSignPost",2) == false) then
            player:startEvent(0x0008,1);
        else
            player:startEvent(0x0003);
        end
    elseif (npc:getID() == 17203806) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and player:getMaskBit("CleanSignPost",3) == false) then
            player:startEvent(0x0009,1);
        else
            player:startEvent(0x0004);
        end
    else
        print("Unknown Signpost");
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

	if (csid == 6 and option == 1) then
		player:addVar("CleanSignPost",1);
	elseif (csid == 7 and option == 1) then
		player:addVar("CleanSignPost",2);
	elseif (csid == 8 and option == 1) then
		player:addVar("CleanSignPost",4);
	elseif (csid == 9 and option == 1) then
		player:addVar("CleanSignPost",8);
	end
end;
