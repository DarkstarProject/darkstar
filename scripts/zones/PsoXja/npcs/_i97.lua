-----------------------------------
-- Area: Pso'Xja
--  NPC: Stone Gate
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local posZ=player:getZPos();
    if (player:hasKeyItem(PSOXJA_PASS) == true and posZ >= 25) then
        player:startEvent(14);
    elseif (posZ < 25) then
        player:startEvent(17);
    else
        player:messageSpecial(DOOR_LOCKED);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
end;