-----------------------------------
-- Area: Bastok Mines
--  NPC: Conrad
-- Outpost Teleporter NPC
-- !pos 94.457 -0.375 -66.161 234
-----------------------------------
require("scripts/globals/conquest");

function onTrigger(player,npc)
    local regionsControlled = 1073741823 - dsp.conquest.getTeleAvailable(NATION_BASTOK);
    local regionsSupplied = 1073741823 - player:getNationTeleport(NATION_BASTOK);
    if (player:getNation() == NATION_BASTOK) then
        player:startEvent(581,0,0,regionsControlled,0,0,514,player:getMainLvl(),regionsSupplied);
    else
        player:startEvent(581,0,0,0,0,0,256,0,0);
    end
end;

function onEventUpdate(player,csid,option)
    local region = option - 1073741829;
    player:updateEvent(player:getGil(),dsp.conquest.opTeleFee(player,region),0,dsp.conquest.opTeleFee(player,region),player:getCP());
end;

function onEventFinish(player,csid,option)
    if (csid == 581 and option >= 5 and option <= 23) then
        if (player:delGil(dsp.conquest.opTeleFee(player,option-5))) then
            dsp.conquest.toOutpost(player,option);
        end
    elseif (option >= 1029 and option <= 1047) then
        local cpCost = dsp.conquest.opTeleFee(player,option-1029);
        if (player:getCP()>=cpCost) then
            player:delCP(cpCost);
            dsp.conquest.toOutpost(player,option-1024);
        end
    end
end;
