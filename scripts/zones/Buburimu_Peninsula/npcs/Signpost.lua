-----------------------------------
-- Area: Buburimu Peninsula
-- NPC:  Signpost
-----------------------------------
package.loaded["scripts/zones/Buburimu_Peninsula/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Buburimu_Peninsula/TextIDs");
require("scripts/zones/Buburimu_Peninsula/MobIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - BUBURIMU_SIGNPOST_OFFSET;
    if (offset >= 4 or offset <= 6) then
        player:messageSpecial(SIGN_1);
    elseif (offset >= 0 and offset <= 3) then
        player:messageSpecial(SIGN_5 - offset);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
