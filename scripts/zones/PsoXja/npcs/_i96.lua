-----------------------------------
-- Area: Pso'Xja
--  NPC: _i96 (Stone Gate)
-- Notes: Red Bracelet Door
-- !pos -310.000 -1.925 -238.399 9
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

    if (Z >= -238) then
        if (player:hasKeyItem(dsp.ki.GREEN_BRACELET) == true) then -- Green Bracelet
            player:startEvent(62);
        else
            player:messageSpecial(ARCH_GLOW_GREEN);
        end
    elseif (Z <= -239) then
        player:messageSpecial(CANNOT_OPEN_SIDE);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option,npc)
end;