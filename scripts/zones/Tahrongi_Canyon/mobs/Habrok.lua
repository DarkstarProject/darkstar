-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Habrok
-----------------------------------

function onMobInitialize(mob)
    mob:setLocalVar("pop", os.time() + math.random(1200,7200))
end

function onMobDeath(mob, player, isKiller)
	if (player:getCharVar("TutorialProgress") == 7) then
		player:setCharVar("TutorialProgress",8)
	end
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setLocalVar("pop", os.time() + math.random(1200,7200))
end
