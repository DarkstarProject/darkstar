-----------------------------------
--
--     Nomad Moogle
--
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,NOMAD_MOOGLE_DIALOG);
    player:sendMenu(1);
end;

function onEventUpdate(player,csid,option)
--print("onEventUpdate");
end;

function onEventFinish(player,csid,option)
    -- printf("onEventFinish");
end;

