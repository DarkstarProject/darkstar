-----------------------------------
-- Area: Xarcabard
-- NPC:  Perennial Snow
-- Involved in Quests: The Circle of Time
-- @pos 339 0 -379 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);

   if (circleOfTime == QUEST_ACCEPTED and player:getVar("circleTime") == 3) then
       if (player:getVar("star_ringburied") == 0) then
           player:startEvent(0x03);
       elseif (player:getVar("star_ringburied") < tonumber(os.date("%j")) and player:getVar("circleTime") == 3) then
           player:startEvent(0x02);
       end
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

   if (csid == 0x03) then
       player:setVar("star_ringburied",os.date("%j"));
   elseif (csid == 0x02) then
       player:setVar("star_ringburied",0);
       player:setVar("circleTime",4);
       printf("test");
   end
end;