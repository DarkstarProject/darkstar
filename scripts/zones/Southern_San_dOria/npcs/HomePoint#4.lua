-----------------------------------
-- Area: Southern San dOria
--  NPC: HomePoint#4
-- !pos -165 -1 11 230
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8703, 97);
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