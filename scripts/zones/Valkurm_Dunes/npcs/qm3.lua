-----------------------------------
-- Area: Valkurm Dunes
-- NPC:  qm3 (???)
-- Involved In Quest: Yomi Okuri
-- !pos -767 -4 192 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Valkurm_Dunes/TextIDs");
require("scripts/zones/Valkurm_Dunes/MobIDs");
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local cstime = VanadielHour();

    if (player:hasKeyItem(YOMOTSU_HIRASAKA) and (cstime > 18 or cstime < 5) and not GetMobByID(DOMAN):isSpawned() and not GetMobByID(ONRYO):isSpawned()) then
        if (player:getVar("OkuriNMKilled") >= 1 and player:needToZone()) then
            player:delKeyItem(YOMOTSU_HIRASAKA);
            player:addKeyItem(FADED_YOMOTSU_HIRASAKA);
            player:messageSpecial(KEYITEM_OBTAINED,FADED_YOMOTSU_HIRASAKA);
            player:setVar("OkuriNMKilled",0);
        else
            player:startEvent(10);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 10 and option == 1) then
        player:needToZone(true); -- If you zone, you will need to repeat the fight.
        player:setVar("OkuriNMKilled",0);
        SpawnMob(DOMAN):updateClaim(player);
        SpawnMob(ONRYO):updateClaim(player);
    end
end;
