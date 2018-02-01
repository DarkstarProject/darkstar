-----------------------------------
-- Area:  Sacrarium
-- NPC:   qm7 (???)
-- Notes: Used to spawn Old Prof. Mariselle
-- !pos 22.669 -3.111 -127.318 28
-----------------------------------
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sacrarium/TextIDs");
require("scripts/zones/Sacrarium/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local cop = player:getCurrentMission(COP);
    local copStat = player:getVar("PromathiaStatus");
    local prof = GetMobByID(OLD_PROFESSOR_MARISELLE);
    local profLoc = GetServerVariable("Old_Prof_Spawn_Location");

    if (cop == THE_SECRETS_OF_WORSHIP and copStat == 3 and not player:hasKeyItem(RELIQUIARIUM_KEY) and not prof:isSpawned() and profLoc == 7) then
        player:messageSpecial(EVIL_PRESENCE);
        SpawnMob(OLD_PROFESSOR_MARISELLE):updateClaim(player);
        prof:setPos(npc:getXPos()+1, npc:getYPos(), npc:getZPos()+1); -- Set Prof. spawn x and z pos. +1 from NPC
    elseif (cop == THE_SECRETS_OF_WORSHIP and copStat == 4 and not player:hasKeyItem(RELIQUIARIUM_KEY)) then
        player:addKeyItem(RELIQUIARIUM_KEY);
        player:messageSpecial(KEYITEM_OBTAINED,RELIQUIARIUM_KEY);
    elseif (profLoc == 7) then
        player:messageSpecial(DRAWER_SHUT);
    else
        player:messageSpecial(DRAWER_OPEN);
        player:messageSpecial(DRAWER_EMPTY);
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end;
