-----------------------------------
-- Area: Bastok Mines
--  NPC: HomePoint#2
-- !pos 118 1 -58 234
-----------------------------------
package.loaded["scripts/globals/homepoint"] = nil;
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/Bastok_Mines/IDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8701, 10);
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