-----------------------------------
-- Area: Jugner Forest [S]
--  NPC: Cavernous Maw
-- !pos -118 -8 -520 82
-- Teleports Players to Jugner Forest
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Jugner_Forest_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (hasMawActivated(player,3) == false) then
        player:startEvent(101);
    else
        player:startEvent(102);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (option == 1) then
        if (csid == 101) then
            player:addNationTeleport(MAW,8);
        end
        dsp.teleport.toMaw(player,14);
    end
end;