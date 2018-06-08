-----------------------------------
-- Area: Xarcabard
--  NPC: qm5 (???)
-- Involved in Quests: Breaking Barriers
-- !pos 179 -33 82 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Xarcabard/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    if (player:getCurrentMission(SANDORIA) == BREAKING_BARRIERS and player:getVar("MissionStatus") == 2) then
        player:addKeyItem(dsp.ki.FIGURE_OF_GARUDA);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.FIGURE_OF_GARUDA);
        player:setVar("MissionStatus",3);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;