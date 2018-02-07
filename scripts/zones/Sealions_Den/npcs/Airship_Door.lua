-----------------------------------
-- Area: Sealion's Den
--  NPC: Airship_Door
-----------------------------------
package.loaded["scripts/zones/Sealions_Den/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sealions_Den/TextIDs");
require("scripts/zones/Sealions_Den/MobIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - AIRSHIP_DOOR_OFFSET;
    player:startEvent(32003, offset + 1);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 32003 and (option >= 100 and option <= 102)) then
        local inst = option - 99;
        local instOffset = ONE_TO_BE_FEARED_OFFSET + (7 * (inst - 1));

        local stillAlive = nil;
        for i = 0, 6 do
            if (GetMobByID(instOffset + i):isAlive()) then
                stillAlive = i;
                break;
            end
        end
        
        if (stillAlive ~= nil) then
            if (stillAlive <= 4) then
                player:startEvent(0, inst); -- send to mammet arena
            elseif (stillAlive == 5) then
                player:startEvent(1, inst); -- send to omega arena
            elseif (stillAlive == 6) then
                player:startEvent(2, inst); -- send to ultima arena
            end
        end
    end
end;