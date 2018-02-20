-----------------------------------
-- Area: Pso'Xja
--  NPC: _i94 (Stone Gate)
-- Notes: Blue Bracelet Door
-- !pos -330.000 14.074 -261.600 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local Z=player:getZPos();

    if (Z >= -261) then
        if (player:hasKeyItem(595) == true) then -- Blue Bracelet
            player:startEvent(61);
        else
            player:messageSpecial(ARCH_GLOW_BLUE);
        end
    elseif (Z <= -262) then
        player:messageSpecial(CANNOT_OPEN_SIDE);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option,npc)
end;