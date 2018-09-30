-----------------------------------
-- Area: AlTaieu
--  NPC: HomePoint#2
-- !pos -532 0 447 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs");
require("scripts/globals/homepoint");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8701, 86);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8701) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(ID.text.HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;