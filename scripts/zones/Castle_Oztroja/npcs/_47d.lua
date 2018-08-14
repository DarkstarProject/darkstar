-----------------------------------
-- Area: Castle Oztroja
--  NPC: _47d
-- !pos 20.000 24.168 -25.000 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Oztroja/TextIDs");
-----------------------------------

function onTrigger(player,npc)
    if(player:hasKeyItem(dsp.ki.OLD_RING) == false) then
        player:addKeyItem(dsp.ki.OLD_RING);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.OLD_RING);
    end
    if (npc:getAnimation() == 9) then
        npc:openDoor();
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;