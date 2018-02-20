-----------------------------------
-- Area: Gusgen Mines
--  NPC: _5g2 (Door A)
-- !pos -4.001 -42.4 -25.5 196
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gusgen_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        player:messageSpecial(LOCK_OTHER_DEVICE)
    else
        return 0;
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