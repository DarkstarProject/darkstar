-----------------------------------
-- Area: Toraimarai Canal
--  NPC: Transporter
-- Involved In Windurst Mission 7-1
-- @zone 169
-- !pos 182 11 -60 169
-----------------------------------
package.loaded["scripts/zones/Toraimarai_Canal/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Toraimarai_Canal/TextIDs");
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    player:startEvent(71);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 71 and option == 1) then
        player:setPos(0,0,-22,192,242);
    end
end;


