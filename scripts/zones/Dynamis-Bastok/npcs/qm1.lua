-----------------------------------
-- Area: Dynamis Bastok
--  NPC: qm1 (???)
-- Notes: Spawns when Megaboss is defeated
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS) == false) then
        player:setVar("DynaBastok_Win",1);
        player:addKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_EYEGLASS);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;