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

    -- CIRCLE OF TIME (Bard AF3)
    if (circleOfTime == QUEST_ACCEPTED and player:getVar("circleTime") == 3) then
        if (player:getVar("star_ringburied") == 0) then
            player:startEvent(3);
        elseif (os.time() > player:getVar("star_ringburied")) then
            player:startEvent(2);
        else
            player:messageSpecial(PERENNIAL_SNOW_WAIT,225);
        end;

    -- DEFAULT DIALOG
    else
        player:messageSpecial(PERENNIAL_SNOW_DEFAULT);
    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
   if (csid == 3) then
       player:setVar("star_ringburied",os.time()+60); -- wait 1 minute
   elseif (csid == 2) then
       player:setVar("star_ringburied",0);
       player:setVar("circleTime",4);
   end;
end;
