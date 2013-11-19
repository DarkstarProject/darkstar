-----------------------------------
--  Area: Jugner Forest
--  NPC: 	Signpost
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

    if (npc:getID() == 17203802) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("CleanSignPost"),0)) then
            player:startEvent(0x0006,1);
        else
            player:startEvent(0x0001);
        end
    elseif (npc:getID() == 17203803) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("CleanSignPost"),1)) then
            player:startEvent(0x0007,1);
        else
            player:startEvent(0x0002);
        end
    elseif (npc:getID() == 17203804) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("CleanSignPost"),2)) then
            player:startEvent(0x0008,1);
        else
            player:startEvent(0x0003);
        end
    elseif (npc:getID() == 17203805) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("CleanSignPost"),3)) then
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
		player:setMaskBit(player:getVar("CleanSignPost"),"CleanSignPost",0,true);
	elseif (csid == 7 and option == 1) then
		player:setMaskBit(player:getVar("CleanSignPost"),"CleanSignPost",1,true);
	elseif (csid == 8 and option == 1) then
		player:setMaskBit(player:getVar("CleanSignPost"),"CleanSignPost",2,true);
	elseif (csid == 9 and option == 1) then
		player:setMaskBit(player:getVar("CleanSignPost"),"CleanSignPost",3,true);
	end
end;