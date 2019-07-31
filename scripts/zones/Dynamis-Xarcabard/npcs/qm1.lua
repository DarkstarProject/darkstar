-----------------------------------
-- Area: Dynamis Xarcabard
--  NPC: ??? (Spawn when mega is defeated)
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Dynamis-Xarcabard/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:addTitle(dsp.title.DYNAMIS_XARCABARD_INTERLOPER); -- Add title

    if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_BATTLE_STANDARD) == false) then
        player:setVar("DynaXarcabard_Win",1);
        player:addKeyItem(dsp.ki.HYDRA_CORPS_BATTLE_STANDARD);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_BATTLE_STANDARD);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;