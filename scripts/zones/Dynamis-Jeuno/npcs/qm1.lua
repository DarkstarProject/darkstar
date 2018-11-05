-----------------------------------
-- Area: Dynamis Jeuno
--  NPC: ??? (Spawn when mega is defeated)
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Dynamis-Jeuno/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_TACTICAL_MAP) == false) then
        player:setVar("DynaJeuno_Win",1);
        player:addKeyItem(dsp.ki.HYDRA_CORPS_TACTICAL_MAP);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_TACTICAL_MAP);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;