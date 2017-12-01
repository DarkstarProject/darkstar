-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Jeanvirgaud
-- Outpost Teleporter NPC
-- !pos 111 -0.199 -6 231
-----------------------------------
require("scripts/globals/conquest");

function onTrigger(player,npc)
    local regionsControlled = 1073741823 - getTeleAvailable(NATION_SANDORIA);
    local regionsSupplied = 1073741823 - player:getNationTeleport(NATION_SANDORIA);
    if (player:getNation() == NATION_SANDORIA) then
        player:startEvent(716,0,0,regionsControlled,0,0,514,player:getMainLvl(),regionsSupplied);
    else
        player:startEvent(716,0,0,0,0,0,1,0,0);
    end
end;

function onEventUpdate(player,csid,option)
    local region = option - 1073741829;
    player:updateEvent(player:getGil(),OP_TeleFee(player,region),0,OP_TeleFee(player,region),player:getCP());
end;

function onEventFinish(player,csid,option)
    if (csid == 716 and option >= 5 and option <= 23) then
        if (player:delGil(OP_TeleFee(player,option-5))) then
            toOutpost(player,option);
        end
    elseif (option >= 1029 and option <= 1047) then
        local cpCost = OP_TeleFee(player,option-1029);
        if (player:getCP()>=cpCost) then
            player:delCP(cpCost);
            toOutpost(player,option-1024);
        end
    end
end;
