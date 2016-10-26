-----------------------------------
-- Area: Nyzul Isle (Nashmeira's Plea)
--  MOB: Raubahn
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Nyzul_Isle/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addListener("DEATH", "RAUBAHN_DEATH", function(mob)
        local instance = mob:getInstance();
        instance:setProgress(instance:getProgress() + 1);

        local reraises = mob:getLocalVar("RERAISES");

        if (reraises < 2) then
            local target = mob:getTarget()
            local targetid = 0

            if target then targetid = target:getShortID() end

            mob:timer(12000, function(mob)
                mob:setHP(mob:getMaxHP())
                mob:AnimationSub(3)
                mob:resetAI()
                mob:stun(3000)
                local new_target = mob:getEntity(targetid)

                if new_target and mob:checkDistance(new_target) < 40 then
                    mob:updateClaim(new_target)
                    mob:updateEnmity(new_target)
                end

                mob:setLocalVar("RERAISES", reraises+1);
            end)

            -- AFAICT we lack the damage tracking for his immunity based on accumlated damage type
            -- Therefore, we'll guess based off of tallying player main jobs - which is better than nothing
            if(reraises == 1) then
                local ranged = 0;
                local magic = 0;
                local phys = 0;

                local chars = mob:getInstance():getChars();

                for i,v in pairs(chars) do
                    local job = v:getMainJob();

                    if (job == 1 or job == 2 or (job >= 6 and job <= 10) or (job >=12 and job <=14) or (job >= 16 and job <=19 )) then
                        phys = phys + 1;
                    elseif ((job >= 3 and job <= 5) or job == 15 or job == 20) then
                        magic = magic + 1;
                    else
                        ranged = ranged + 1;
                    end
                end

                if (phys >= magic and phys >= ranged) then
                    mob:setMod(MOD_UDMGPHYS, -100);
                elseif (magic >= phys and magic >= ranged) then
                    mob:addMod(MOD_UDMGMAGIC, -100);
                else
                    mob:addMod(MOD_UDMGRANGE, -100);
                end
            end
        else
            -- We're out of raises, so we can go away now
            mob:setMobMod(MOBMOD_BEHAVIOR, 0);
        end
    end)

    -- We're able to be raised initially and shouldn't despawn
    mob:setMobMod(MOBMOD_BEHAVIOR, 5);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
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
