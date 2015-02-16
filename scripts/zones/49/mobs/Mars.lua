-----------------------------------
-- Area: Legion: Hidden bonus Hall.
--  HNM: Mars
-- Legion Secret Bonus Boss
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");
require("scripts/globals/spoofchat");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    -- MobMods
    mob:setMobMod(MOBMOD_AUTO_SPIKES, mob:getShortID()); -- Needed for auto spikes
    -- mob:setMobMod(MOBMOD_MAIN_2HOUR, 1); -- Enables Blood Weapon
    -- mob:setMobMod(MOBMOD_SUB_2HOUR, 1); -- Enables Mighty Strikes

    -- Mods
    mob:addMod(MOD_ACC, 25);
    mob:addMod(MOD_DOUBLE_ATTACK, 5);
    mob:addMod(MOD_MATT, 25);
    mob:addMod(MOD_MACC, 80);
    mob:addMod(MOD_INT, 10);

    -- Effects
    mob:addStatusEffect(EFFECT_DAMAGE_SPIKES,5,0,0); -- Needed for auto spikes
    mob:getStatusEffect(EFFECT_DAMAGE_SPIKES):setFlag(32); -- Make spikes undispellable.
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Mods
    mob:setMod(MOD_REGEN, 20);
    mob:setMod(MOD_REFRESH, 20);
    mob:setMod(MOD_REGAIN, 25);
    mob:setMod(MOD_HASTE_ABILITY, 10);
    mob:setMod(MOD_UFASTCAST, 75);
    mob:setMod(MOD_COUNTER, 10);
    mob:setMod(MOD_TRIPLE_ATTACK, 1);

    -- Vars
    mob:setLocalVar("MagicElement", math.random(1,6));
    -- 0 = Stops rotating weakness
    -- 1 = Fire
    -- 2 = Ice
    -- 3 = Wind
    -- 4 = Earth
    -- 5 = Lightning
    -- 6 = Water
    mob:setLocalVar("SpikesElement", math.random(1,6));
    -- 0 = Retaliation
    -- 1 = Fire
    -- 2 = Ice
    -- 3 = Wind
    -- 4 = Earth
    -- 5 = Lightning
    -- 6 = Water
    mob:setLocalVar("PhysicalElement", math.random(1,4));
    -- 0 = Stops rotating weakness
    -- 1 = Slashing
    -- 2 = Piercing
    -- 3 = Blunt
    -- 4 = H2H
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob, target)
    if (target:getParty() ~= nil) then
        local targets = target:getParty(); -- local targets = mob:getEnmityList();
        for hey, dude in pairs(targets) do
            if (dude:isPC()) then
                dude:ChangeMusic(0, 195); -- Background Music (Day time, 7:00 -> 18:00)
                dude:ChangeMusic(1, 195); -- Background Music (Night time, 18:00 -> 7:00)
                dude:ChangeMusic(2, 195); -- SoloBattle Music
                dude:ChangeMusic(3, 195); -- Party Battle Music
            end
        end
    elseif (target:isPC()) then
        target:ChangeMusic(0, 195); -- Background Music (Day time, 7:00 -> 18:00)
        target:ChangeMusic(1, 195); -- Background Music (Night time, 18:00 -> 7:00)
        target:ChangeMusic(2, 195); -- SoloBattle Music
        target:ChangeMusic(3, 195); -- Party Battle Music
    end
    mob:SpoofChatParty("I am Mars, god of war. Have you entered this hall to challenge me mortal?", MESSAGE_SAY)
    mob:SpoofChatParty("Do you think yourself fit to battle a god?", MESSAGE_SAY)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local Mars_2hr_Used = 0;
    if (mob:getLocalVar("Mars_2hr") ~= nil) then
        Mars_2hr_Used = mob:getLocalVar("Mars_2hr");
    end

    if (mob:getHPP() <= 9) then -- Time for BW(3rd use) and MS(2nd use) together!
        if (Mars_2hr_Used == 3) then
            mob:SpoofChatParty("That you should fight a god this far...Deplorable.", MESSAGE_SAY);
            mob:useMobAbility(432); -- Do Mighty Strikes!
            mob:setMod(MOD_TRIPLE_ATTACK, 2);
            mob:setLocalVar("Mars_2hr", 4);
        elseif (Mars_2hr_Used == 4) then
            mob:SpoofChatParty("You shall not survive this day, I AM THE GOD OF WAR!!!", MESSAGE_SAY);
            mob:setMod(MOD_UFASTCAST, 80);
            mob:setLocalVar("MagicElement", 0);
            mob:setLocalVar("SpikesElement", 0);
            mob:setLocalVar("PhysicalElement", 0);
            mob:useMobAbility(439); -- Do Blood Weapon!
            mob:addStatusEffect(EFFECT_HASTE,200,0,200);
            mob:setLocalVar("Mars_2hr", 5);
        end
    elseif (mob:getHPP() <= 25) then -- 2nd BW time!
        if (Mars_2hr_Used == 2) then
            mob:SpoofChatParty("It has been over 1000 years since I have been so...Entertained.", MESSAGE_SAY);
            mob:SpoofChatParty("Show me more, mortal! More! Bleed for the god of war!", MESSAGE_SAY);
            mob:useMobAbility(439); -- Do Blood Weapon!
            mob:setLocalVar("Mars_2hr", 3);
        end
    elseif (mob:getHPP() <= 70) then -- 1st MS time!
        if (Mars_2hr_Used == 1) then
            mob:SpoofChatParty("Hmmph. You've managed to scratch me.", MESSAGE_SAY);
            mob:SpoofChatParty("Very well then, I shall show you my full might!", MESSAGE_SAY);
            mob:useMobAbility(432); -- Do Mighty Strikes!
            mob:setLocalVar("Mars_2hr", 2);
        end
    elseif (mob:getHPP() <= 85) then -- 1st BW time!
        if (Mars_2hr_Used == 0) then
            mob:SpoofChatParty("Such hubris...You shall learn to show me the proper respect, mortal!", MESSAGE_SAY);
            mob:useMobAbility(439); -- Do Blood Weapon!
            mob:setLocalVar("Mars_2hr", 1);
        end
    end

    if (Mars_2hr_Used < 4) then -- After 4th use of 2hr, no more ele switching.
        local MARS_ELEMENT = mob:getLocalVar("MagicElement");
        -- target:PrintToPlayer( string.format( "Mars Weakness: '%u' ", MARS_ELEMENT) );
        if (MARS_ELEMENT == 6) then -- Water
            mob:setMod(MOD_FIRE_ABSORB,50);
            mob:setMod(MOD_LTNG_NULL,200);
            mob:setMod(MOD_EARTH_NULL,200);
            mob:setMod(MOD_WIND_NULL,200);
            mob:setMod(MOD_ICE_NULL,200);
            mob:setMod(MOD_LIGHT_NULL,200);
            mob:setMod(MOD_DARK_NULL,200);
        elseif (MARS_ELEMENT == 5) then -- Lightning
            mob:setMod(MOD_WATER_ABSORB,50);
            mob:setMod(MOD_EARTH_NULL,200);
            mob:setMod(MOD_WIND_NULL,200);
            mob:setMod(MOD_ICE_NULL,200);
            mob:setMod(MOD_FIRE_NULL,200);
            mob:setMod(MOD_LIGHT_NULL,200);
            mob:setMod(MOD_DARK_NULL,200);
        elseif (MARS_ELEMENT == 4) then -- Earth
            mob:setMod(MOD_LTNG_ABSORB,50);
            mob:setMod(MOD_WATER_NULL,200);
            mob:setMod(MOD_WIND_NULL,200);
            mob:setMod(MOD_ICE_NULL,200);
            mob:setMod(MOD_FIRE_NULL,200);
            mob:setMod(MOD_LIGHT_NULL,200);
            mob:setMod(MOD_DARK_NULL,200);
        elseif (MARS_ELEMENT == 3) then -- Wind
            mob:setMod(MOD_EARTH_ABSORB,50);
            mob:setMod(MOD_WATER_NULL,200);
            mob:setMod(MOD_LTNG_NULL,200);
            mob:setMod(MOD_ICE_NULL,200);
            mob:setMod(MOD_FIRE_NULL,200);
            mob:setMod(MOD_LIGHT_NULL,200);
            mob:setMod(MOD_DARK_NULL,200);
        elseif (MARS_ELEMENT == 2) then -- Ice
            mob:setMod(MOD_WIND_ABSORB,50);
            mob:setMod(MOD_WATER_NULL,200);
            mob:setMod(MOD_LTNG_NULL,200);
            mob:setMod(MOD_EARTH_NULL,200);
            mob:setMod(MOD_FIRE_NULL,200);
            mob:setMod(MOD_LIGHT_NULL,200);
            mob:setMod(MOD_DARK_NULL,200);
        elseif (MARS_ELEMENT == 1) then -- Fire
            mob:setMod(MOD_ICE_ABSORB,50);
            mob:setMod(MOD_WATER_NULL,200);
            mob:setMod(MOD_LTNG_NULL,200);
            mob:setMod(MOD_EARTH_NULL,200);
            mob:setMod(MOD_WIND_NULL,200);
            mob:setMod(MOD_LIGHT_NULL,200);
            mob:setMod(MOD_DARK_NULL,200);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    if (killer:getParty() ~= nil) then
        local targets = killer:getParty(); -- local targets = mob:getEnmityList();
        for hey, dude in pairs(targets) do
            if (dude:isPC()) then
                dude:ChangeMusic(0, 0); -- Background Music (Day time, 7:00 -> 18:00)
                dude:ChangeMusic(1, 0); -- Background Music (Night time, 18:00 -> 7:00)
                dude:ChangeMusic(2, 195); -- SoloBattle Music
                dude:ChangeMusic(3, 195); -- Party Battle Music
            end
        end
    elseif (killer:isPC()) then
        killer:ChangeMusic(0, 0); -- Background Music (Day time, 7:00 -> 18:00)
        killer:ChangeMusic(1, 0); -- Background Music (Night time, 18:00 -> 7:00)
        killer:ChangeMusic(2, 195); -- SoloBattle Music
        killer:ChangeMusic(3, 195); -- Party Battle Music
    end
    mob:SpoofChatParty("...I...Defeated...Content...At last...", MESSAGE_SAY)
    mob:SpoofChatParty("As you watch the gods form dissolve you see it smile, its hunger for battle finally sated.", MESSAGE_ECHO)
    -- insert code to spawn lootbox here, move battlefield win stuff into lootbox?
    -- mob:getBattlefield():win();
end;

-----------------------------------
-- onMagicHit
-----------------------------------

function onMagicHit(caster, target, spell)
    -- When mob casts on self it is caster AND target! Care must be taken to NOT do
    -- things like try to print message at a mob or exec mob things on the player!
    local mob = nil;
    if (caster:isMob()) then
        mob = caster;
    elseif (target:isMob()) then
        mob = target;
    end

    if (mob ~= nil) then
        local SPELL_ELEMENT = spell:getElement();
        local MARS_ELEMENT = mob:getLocalVar("MagicElement");
        local Mars_2hr_Used = 0;
        if (mob:getLocalVar("Mars_2hr") ~= nil) then
            Mars_2hr_Used = mob:getLocalVar("Mars_2hr");
        end

        --[[
        local player = nil;
        if (caster:isPC()) then
            player = caster;
        elseif (target:isPC()) then
            player = target;
        end
        if (player ~= nil) then
            player:PrintToPlayer( string.format( "Spell Ele: '%u' ", SPELL_ELEMENT) );
            player:PrintToPlayer( string.format( "Mars Weakness: '%u' ", MARS_ELEMENT) );
        end
        ]]--

        if (Mars_2hr_Used < 4) then -- After 4th use of 2hr, no more ele switching.
            if (SPELL_ELEMENT == ELE_WATER) then
                mob:useMobAbility(572); -- Water Blade
                mob:setLocalVar("SpikesElement", 6);
                mob:setLocalVar("MagicElement", math.random(1,6));
                mob:setTP(10);
            elseif (SPELL_ELEMENT == ELE_LIGHTNING) then
                mob:useMobAbility(571); -- Lightning Blade
                mob:setLocalVar("SpikesElement", 5);
                mob:setLocalVar("MagicElement", math.random(1,6));
                mob:setTP(10);
            elseif (SPELL_ELEMENT == ELE_EARTH) then
                mob:useMobAbility(570); -- Earth Blade
                mob:setLocalVar("SpikesElement", 4);
                mob:setLocalVar("MagicElement", math.random(1,6));
                mob:setTP(10);
            elseif (SPELL_ELEMENT == ELE_WIND) then
                mob:useMobAbility(569); -- Wind Blade
                mob:setLocalVar("SpikesElement", 3);
                mob:setLocalVar("MagicElement", math.random(1,6));
                mob:setTP(10);
            elseif (SPELL_ELEMENT == ELE_ICE) then
                mob:useMobAbility(568); -- Ice Blade
                mob:setLocalVar("SpikesElement", 2);
                mob:setLocalVar("MagicElement", math.random(1,6));
                mob:setTP(10);
            elseif (SPELL_ELEMENT == ELE_FIRE) then
                mob:useMobAbility(567); -- Fire Blade
                mob:setLocalVar("SpikesElement", 1);
                mob:setLocalVar("MagicElement", math.random(1,6));
                mob:setTP(10);
            else
                mob:useMobAbility(573); -- Great Wheel
                mob:setLocalVar("SpikesElement", math.random(1,6));
                mob:setLocalVar("MagicElement", math.random(1,6));
                mob:setTP(10);
            end
        end
    end
    return spell;
end

-----------------------------------
-- onSpikesDamage
-----------------------------------

function onSpikesDamage(mob,target,damage)
    local SPIKE_ELEMENT = mob:getLocalVar("SpikesElement");
    local dmg = math.random(6,12);
    -- target:PrintToPlayer( string.format( "Spike Ele: '%u' ", SPIKE_ELEMENT) );
    if (SPIKE_ELEMENT == 6) then -- Water
        if (math.random(0,99) <= 66) then
            target:addStatusEffect(EFFECT_DROWN, dmg*0.5, 3, 90, FLAG_ERASBLE);
        end
        if (math.random(0,99) <= 20) then
            target:addStatusEffect(EFFECT_ATTACK_DOWN, 10, 0, 60);
        end
        return SUBEFFECT_DELUGE_SPIKES,44,dmg;
    elseif (SPIKE_ELEMENT == 5) then -- Lightning
        if (math.random(0,99) <= 66) then
            target:addStatusEffect(EFFECT_SHOCK, dmg*0.5, 3, 90, FLAG_ERASBLE);
        end
        return SUBEFFECT_SHOCK_SPIKES,44,dmg;
    elseif (SPIKE_ELEMENT == 4) then -- Earth
        if (math.random(0,99) <= 25) then
            target:addStatusEffect(EFFECT_PETRIFICATION, 1, 0, math.random(15,30))
        end
        if (math.random(0,99) <= 66) then
            target:addStatusEffect(EFFECT_RASP, dmg*0.5, 3, 90, FLAG_ERASBLE);
        end
        return SUBEFFECT_STONE_SPIKES,44,dmg;
    elseif (SPIKE_ELEMENT == 3) then -- Wind
        if (math.random(0,99) <= 66) then
            target:addStatusEffect(EFFECT_CHOKE, dmg*0.5, 3, 90, FLAG_ERASBLE);
        end
        if (math.random(0,99) <= 20) then
            target:addStatusEffect(EFFECT_DEFENSE_DOWN, 10, 0, 60);
        end
        return SUBEFFECT_WIND_SPIKES,44,dmg;
    elseif (SPIKE_ELEMENT == 2) then -- Ice
        if (math.random(0,99) <= 66) then
            target:addStatusEffect(EFFECT_FROST, dmg*0.5, 3, 90, FLAG_ERASBLE);
        end
        return SUBEFFECT_ICE_SPIKES,44,dmg;
    elseif (SPIKE_ELEMENT == 1) then -- Fire
        if (math.random(0,99) <= 66) then
            target:addStatusEffect(EFFECT_BURN, dmg*0.5, 3, 90, FLAG_ERASBLE);
        end
        dmg = dmg+5;
        return SUBEFFECT_BLAZE_SPIKES,44,dmg;
    else -- Retaliation. Just straight dmg and extra TP for Mars.
        if (math.random(0,99) <= getHitRate(mob,target,true)) then -- Evading means no retaliation proc.
            local STRVIT = mob:getStat(MOD_STR) - target:getStat(MOD_VIT);
            if (STRVIT > 20) then
                STRVIT = 20 + (STRVIT - 20);
                dmg = STRVIT * 0.5;
            end
            dmg = utils.clamp(dmg, 2, 240);
            -- Mar's retaliation bypasses shadows because TeoTwawki is just evil like that.
            mob:addTP(10); -- Forget math, just straight 100/3000 per hit is good enough.
            return SUBEFFECT_COUNTER,536,dmg;
        else
            return 0, 0, 0;
        end
    end
end;