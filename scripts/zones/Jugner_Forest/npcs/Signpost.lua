-----------------------------------
--  Area: Jugner Forest
--  NPC: Singpost
--  General Info NPC
-------------------------------------

require("/scripts/globals/settings");
package.loaded["/scripts/globals/quests"] = nil;
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
            if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and (tonumber(cleanedSignPost) % 2 < 1)) then
               player:startEvent(0x0006,1);
            else
               player:startEvent(0x0001);
            end
         elseif (npc:getID() == 17203804) then
            if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and (tonumber(cleanedSignPost) % 4 < 2)) then
               player:startEvent(0x0007,1);
            else
               player:startEvent(0x0002);
            end
         elseif (npc:getID() == 17203805) then
            if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and (tonumber(cleanedSignPost) % 8 < 4)) then
               player:startEvent(0x0008,1);
            else
               player:startEvent(0x0003);
            end
         elseif (npc:getID() == 17203806) then
            if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and (tonumber(cleanedSignPost) % 16 < 8)) then
               player:startEvent(0x0009,1);
            else
               player:startEvent(0x0004);
            end
         else
             --printf("Unknown Signpost");
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
printf("fCSID: %u",csid);
printf("fRESULT: %u",option);

	if (csid == 6 and option == 1) then
		player:setVar("CleanSignPost",cleanedPost + 1);
	elseif (csid == 7 and option == 1) then
		player:setVar("CleanSignPost",cleanedPost + 2);
	elseif (csid == 8 and option == 1) then
		player:setVar("CleanSignPost",cleanedPost + 4);
	elseif (csid == 9 and option == 1) then
		player:setVar("CleanSignPost",cleanedPost + 8);
	end
end;
