-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Streetlamp
-- Involved in Quests: Community Service
-- @zone 245
-- @pos -45.148 0 -47.279
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local hour = VanadielHour();

if (hour >= 18 and hour < 21) then
if (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_ACCEPTED) then
if (player:getVar("cService") == 4) then
    player:setVar("cService",5);
            end
        
elseif (hour >= 18 and hour < 21) then
if (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_COMPLETED) then
if (player:getVar("cService") == 17) then
    player:setVar("cService",18);
                end
            end
        end
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
end;