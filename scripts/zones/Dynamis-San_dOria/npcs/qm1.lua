-----------------------------------
-- Area: Dynamis San d'Oria
--  NPC: qm1 (???)
-- Notes: Spawns when Megaboss is defeated
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER) == false) then
        player:setVar("DynaSandoria_Win",1);
        player:addKeyItem(dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;