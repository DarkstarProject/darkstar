-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Adamantking Effigy
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas1.htm
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas2.htm
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Bastok/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- this is my super id and all my children will have the same number
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID())
end

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, bastyList)
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID()
    local battlefield = player:getBattlefield()

    if battlefield then
        if isKiller then
            -- Time Bonus: 001 019 041
            if (mobID == 17539350 or mobID == 17539368 or mobID == 17539386) and not mob:getBattlefield() then
                dynamis.extendTimeLimit(battlefield, 20)
                battlefield:insertEntity(mob)
            end
        end
        -- HP Bonus: 007 008 025 042 082 085 092
        if (mobID == 17539356 or mobID == 17539357 or mobID == 17539374 or mobID == 17539387 or
            mobID == 17539426 or mobID == 17539429 or mobID == 17539171) then
            -- todo: why heal 2k but message the actual amount healed?
            player:restoreHP(2000)
            player:messageBasic(024, player:getMaxHP() - player:getHP())
        -- MP Bonus: 026 031 038 081 104
        elseif mobID == 17539118 or mobID == 17539161 or mobID == 17539383 or
            mobID == 17539425 or mobID == 17539446 then
            player:restoreMP(2000)
            player:messageBasic(025, player:getMaxMP() - player:getMP())
        end
    end
end
