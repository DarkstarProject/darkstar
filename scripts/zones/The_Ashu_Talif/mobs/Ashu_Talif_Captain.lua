-----------------------------------
-- Area: The Ashu Talif (The Black Coffin)
--  MOB: Ashu Talif Crew
-----------------------------------

require("scripts/globals/instance");
local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setUnkillable(true);
end;

-----------------------------------
-- OnMobFight Action
-----------------------------------

function onMobFight(mob, target)
    -- The captain gives up at <= 20% HP. Everyone disengages
    local instance = mob:getInstance();
    if (mob:getHPP() <= 20 and instance:completed() == false) then
        instance:complete();
    end

    mob:addListener("WEAPONSKILL_STATE_ENTER", "WS_START_MSG", function(mob, skillID)
        -- Vulcan Shot
        if(skillId == 254) then
            mob:showText(mob,TheAshuTalif.text.FOR_EPHRAMAD);
            mob:timer(3000, function(mob)
                mob:showText(mob,TheAshuTalif.text.TROUBLESOME_SQUABS);
            end)
        -- Circle Blade
        elseif(skillId == 938) then
            mob:showText(mob,TheAshuTalif.text.FOR_THE_BLACK_COFFIN);
        end
    end);
end;

-----------------------------------
-- onMobRoam Action
-----------------------------------

function onMobRoam(mob)
    local jumped = mob:getLocalVar("jump");
    local ready = mob:getLocalVar("ready");

    -- Becomes ready when the Crew is engaged. Jump down!
    if (ready == 1 and jumped == 0) then
        mob:showText(mob,TheAshuTalif.text.OVERPOWERED_CREW);

        mob:hideName(true);
        mob:entityAnimationPacket("jmp0");

        mob:timer(2000, function(mob)
            mob:setPos(0,-22,13,192);
            mob:entityAnimationPacket("jmp1");

            mob:showText(mob,TheAshuTalif.text.TEST_YOUR_BLADES);

            mob:timer(2000, function(mob)
                mob:hideName(false);
                mob:untargetable(false);
            end)
        end)

        mob:setLocalVar("jump", 1);
    end

end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------

function onMobDisengage(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
