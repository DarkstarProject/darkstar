-----------------------------------
-- Area: Western Altepa Desert
--  NPC: _3h0 (Altepa Gate)
-- !pos -19 12 131 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Western_Altepa_Desert/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        if (player:getZPos() > 137) then
            npc:openDoor(3.2);
        else
            player:messageSpecial(THE_DOOR_IS_LOCKED);
        end
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