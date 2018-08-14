-----------------------------------
--  Area: Attohwa Chasm
--  NPC:  Loose sand
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Attohwa_Chasm/TextIDs");
require("scripts/zones/Attohwa_Chasm/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local cop = player:getCurrentMission(COP);
    local moamStat = player:getVar("MEMORIES_OF_A_MAIDEN_Status");

    if (cop == THE_ROAD_FORKS and moamStat==8 and not player:hasKeyItem(dsp.ki.MIMEO_JEWEL) and (os.time() - player:getVar("LioumereKilled")) < 200) then
        player:setVar("LioumereKilled",0);
        player:addKeyItem(dsp.ki.MIMEO_JEWEL);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.MIMEO_JEWEL);
    elseif (cop == THE_ROAD_FORKS and (moamStat==7 or moamStat==8) and not player:hasKeyItem(dsp.ki.MIMEO_JEWEL)) then
        SpawnMob(LIOUMERE):updateClaim(player);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
        player:setVar("LioumereKilled",0);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
