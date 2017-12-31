-----------------------------------
--  Area: Batallia Downs
--  NPC: qm2 (???)
--  Pop for the quest "Chasing Quotas"
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/zones/Batallia_Downs/MobIDs");
require("scripts/globals/keyitems");

function onTrigger(player,npc)
    local sturmtigerKilled = player:getVar("SturmtigerKilled");
    
    if (player:getVar("ChasingQuotas_Progress") == 5 and sturmtigerKilled == 0) then
        SpawnMob(STURMTIGER,300):updateClaim(player);
    elseif (sturmtigerKilled == 1) then
        player:addKeyItem(RANCHURIOMES_LEGACY);
        player:messageSpecial(KEYITEM_OBTAINED,RANCHURIOMES_LEGACY);
        player:setVar("ChasingQuotas_Progress",6);
        player:setVar("SturmtigerKilled",0);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
