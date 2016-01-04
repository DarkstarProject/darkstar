-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Streetlamp
-- Involved in Quests: Community Service
-- @zone 245
-- @pos -19 0 -4.625
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
if (player:getVar("cService") == 1) then
    player:setVar("cService",2);
            end
        
elseif (hour >= 18 and hour < 21) then
if (player:getQuestStatus(JEUNO,COMMUNITY_SERVICE) == QUEST_COMPLETED) then
if (player:getVar("cService") == 14) then
    player:setVar("cService",15);
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