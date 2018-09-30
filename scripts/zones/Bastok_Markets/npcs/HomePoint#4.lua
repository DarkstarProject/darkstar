-----------------------------------
-- Area: Bastok Markets
--  NPC: HomePoint#4
-- !pos -191 -6 -68 235
-----------------------------------
local ID = require("scripts/zones/Bastok_Markets/IDs");
require("scripts/globals/homepoint");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    homepointMenu(player, 8703, 100);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8703) then
        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(ID.text.HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;
