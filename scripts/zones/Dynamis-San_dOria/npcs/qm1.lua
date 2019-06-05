-----------------------------------
-- Area: Dynamis San d'Oria
--  NPC: qm1 (???)
-- Notes: Spawns when Megaboss is defeated
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Dynamis-San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER) == false) then
        player:setVar("DynaSandoria_Win",1);
        player:addKeyItem(dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;