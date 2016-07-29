-----------------------------------
-- Area: Valley of Sorrows
--  NPC: qm2 (???)
-- Note: Used to rank 9.1 San d'oria
-- @pos 91 -3 -16 128
-----------------------------------
package.loaded["scripts/zones/Valley_of_Sorrows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Valley_of_Sorrows/TextIDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");
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
    if (player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 1) then
        player:addKeyItem(FIGURE_OF_TITAN);
        player:messageSpecial(KEYITEM_OBTAINED,FIGURE_OF_TITAN);
        player:setVar("MissionStatus",2);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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