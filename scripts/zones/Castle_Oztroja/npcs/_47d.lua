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
    if(player:hasKeyItem(dsp.kis.OLD_RING) == false) then
        player:addKeyItem(dsp.kis.OLD_RING);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.OLD_RING);
    end
    if (npc:getAnimation() == 9) then
        npc:openDoor();
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;