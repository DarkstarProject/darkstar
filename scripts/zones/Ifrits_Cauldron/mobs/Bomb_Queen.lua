-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Bomb Queen
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    mob:addMod(dsp.mod.STUNRES, 50)
end

function onMobFight(mob,target)
    local battleTime = mob:getBattleTime()

    if battleTime - 5 % 20 == 0 then -- every 20 seconds after 5 seconds, source: https://www.youtube.com/watch?v=AVsEbYjSAHM
        local random = math.random(1,100);
        local petId = mob:getID() + 1 + math.floor(random / 25); -- approximately 1% chance to spawn bomb bastard
        local pet = GetMobByID(petId)
        pet:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos(), mob:getRotPos())
        pet:spawn()
        pet:updateEnmity(target)
    end
end

function onMobDeath(mob, player, isKiller)
end
