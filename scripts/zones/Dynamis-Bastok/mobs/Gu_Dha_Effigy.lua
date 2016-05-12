-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Gu'Dha Effigy
-- Mega Boss
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (mob:isInBattlefieldList() == false) then
        mob:addInBattlefieldList();

        player:addTimeToDynamis(30); -- Add + 30min

        player:addTitle(DYNAMISBASTOK_INTERLOPER); -- Add title

        local npc = GetNPCByID(17539323); -- Spawn ???
        npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
        npc:setStatus(0);

        player:launchDynamisSecondPart(); -- Spawn dynamis second part
    end

end;