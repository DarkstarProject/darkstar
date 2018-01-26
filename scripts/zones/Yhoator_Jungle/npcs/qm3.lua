-----------------------------------
-- Area: Davoi
--  NPC: ??? (qm3)
-- Involved in Quest: True will
-- !pos 203 0.1 82 124
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Yhoator_Jungle/TextIDs");
require("scripts/zones/Yhoator_Jungle/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(OUTLANDS,TRUE_WILL) == QUEST_ACCEPTED and not player:hasKeyItem(OLD_TRICK_BOX)) then
        if (player:getVar("trueWillKilledNM") >= 1) then
            if (GetMobByID(KAPPA_AKUSO):isDead() and GetMobByID(KAPPA_BONZE):isDead() and GetMobByID(KAPPA_BIWA):isDead()) then
                player:addKeyItem(OLD_TRICK_BOX);
                player:messageSpecial(KEYITEM_OBTAINED,OLD_TRICK_BOX);
                player:setVar("trueWillKilledNM",0);
            end
        else
            SpawnMob(KAPPA_AKUSO):updateClaim(player);
            SpawnMob(KAPPA_BONZE):updateClaim(player);
            SpawnMob(KAPPA_BIWA):updateClaim(player);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
