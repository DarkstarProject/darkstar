-----------------------------------
-- Area: Dynamis Xarcabard
--  NPC: ??? (Spawn when mega is defeated)
-----------------------------------
package.loaded["scripts/zones/Dynamis-Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:addTitle(dsp.title.DYNAMISXARCABARD_INTERLOPER); -- Add title

    if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_BATTLE_STANDARD) == false) then
        player:setVar("DynaXarcabard_Win",1);
        player:addKeyItem(dsp.ki.HYDRA_CORPS_BATTLE_STANDARD);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_BATTLE_STANDARD);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;