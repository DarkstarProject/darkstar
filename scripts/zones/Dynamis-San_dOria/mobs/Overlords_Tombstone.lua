-----------------------------------
-- Area: Dynamis San d'Oria
--  MOB: Overlord's Tombstone
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/dynamis");
-----------------------------------

function onMobEngaged(mob,target)
    SpawnMob(17535350):updateEnmity(target); -- 110
    SpawnMob(17535351):updateEnmity(target); -- 111
    SpawnMob(17535352):updateEnmity(target); -- 112
    SpawnMob(17535354):updateEnmity(target); -- 114
    SpawnMob(17534978):updateEnmity(target); -- Battlechoir Gitchfotch
    SpawnMob(17534979):updateEnmity(target); -- Soulsender Fugbrag
end;

function onMobDeath(mob, player, isKiller)

    if (alreadyReceived(player,8) == false) then
        addDynamisList(player,128);
        player:addTitle(dsp.title.DYNAMISSAN_DORIA_INTERLOPER); -- Add title
        local npc = GetNPCByID(17535224); -- Spawn ???
        npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
        npc:setStatus(0);
        player:launchDynamisSecondPart(); -- Spawn dynamis second part
    end

    for i = 17534978, 17534979 do
        if (GetMobAction(i) ~= 0) then
            DespawnMob(i);
        end
    end

end;