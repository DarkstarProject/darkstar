-----------------------------------
-- Area: East Ronfaure [S]
--  NPC: Cavernous Maw
-- Teleports Players to East Ronfaure
-- !pos 322 -59 503 81
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/East_Ronfaure_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (hasMawActivated(player,6) == false) then
        player:startEvent(100);
    else
        player:startEvent(101);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (option == 1) then
        if (csid == 100) then
            player:addNationTeleport(MAW,64);
        end
        dsp.teleport.toMaw(player,10);
    end
end;