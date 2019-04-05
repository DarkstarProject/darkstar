-----------------------------------
-- Area: North Gustaberg [S]
--  NPC: Cavernous Maw
-- !pos 466 0 479 88
-- Teleports Players to North Gustaberg
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (hasMawActivated(player,7) == false) then
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
            player:addNationTeleport(dsp.teleport.nation.MAW,128);
        end
        dsp.teleport.toMaw(player,12);
    end
end;