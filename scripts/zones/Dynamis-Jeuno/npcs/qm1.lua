-----------------------------------
-- Area: Dynamis Jeuno
--  NPC: ??? (Spawn when mega is defeated)
-----------------------------------
package.loaded["scripts/zones/Dynamis-Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_TACTICAL_MAP) == false) then
        player:setVar("DynaJeuno_Win",1);
        player:addKeyItem(dsp.ki.HYDRA_CORPS_TACTICAL_MAP);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_TACTICAL_MAP);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;