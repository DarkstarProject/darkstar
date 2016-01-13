-----------------------------------
-- Area: Xarcabard
--  NPC: qm5 (???)
-- Involved in Quests: Breaking Barriers
-- @pos 179 -33 82 112
-----------------------------------

local text = require("scripts/zones/Xarcabard/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 2) then
        player:addKeyItem(FIGURE_OF_GARUDA);
        player:messageSpecial(text.KEYITEM_OBTAINED,FIGURE_OF_GARUDA);
        player:setVar("MissionStatus",3);
    else
        player:messageSpecial(text.NOTHING_OUT_OF_ORDINARY);
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
end;