-----------------------------------
-- Area: Jugner Forest [S]
--  NPC: Cavernous Maw
-- !pos -118 -8 -520 82
-- Teleports Players to Jugner Forest
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
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
end;

function onEventFinish(player,csid,option)
    if (option == 1) then
        if (csid == 101) then
            player:addNationTeleport(dsp.teleport.nation.MAW,8);
        end
        dsp.teleport.toMaw(player,14);
    end
end;