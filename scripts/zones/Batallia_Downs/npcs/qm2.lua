-----------------------------------
--  Area: Batallia Downs
--  NPC: qm2 (???)
--  Pop for the quest "Chasing Quotas"
-----------------------------------
local ID = require("scripts/zones/Batallia_Downs/IDs");
require("scripts/globals/keyitems");

function onTrigger(player,npc)
    local sturmtigerKilled = player:getVar("SturmtigerKilled");
    
    if (player:getVar("ChasingQuotas_Progress") == 5 and sturmtigerKilled == 0) then
        SpawnMob(ID.mob.STURMTIGER,300):updateClaim(player);
    elseif (sturmtigerKilled == 1) then
        player:addKeyItem(dsp.ki.RANCHURIOMES_LEGACY);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.RANCHURIOMES_LEGACY);
        player:setVar("ChasingQuotas_Progress",6);
        player:setVar("SturmtigerKilled",0);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
